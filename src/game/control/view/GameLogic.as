package game.control.view
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.control.game.tasks.StartGameTask;
	import game.core.data.tables.TowersStaticTableItem;
	import game.core.game.GameCoreCommands;
	import game.core.game.data.ActiveGameStateData;
	import game.core.game.objects.mob.SimpleMobObject;
	import game.interfaces.data.IMapData;
	import game.interfaces.data.ITowerData;
	import game.task.TaskEvent;
	import game.view.events.GameEvents;
	import game.view.events.MenuEvents;
	
	import utils.updater.Updater;
	
	public class GameLogic extends BroadcastModule
	{
		private var _gameStateObject:			ActiveGameStateData;
		private var task:						StartGameTask;
		
		public function GameLogic()
		{
			super();
			initMessages();
		}
		
		private function initMessages():void
		{
			this.addMessageListener( MenuEvents.SHOW_GAME_WINDOW );
			this.addMessageListener(GameEvents.START_GAME);
		}
		
		
		private function startNewGame():void
		{
			task = new StartGameTask();
			task.addListener(TaskEvent.COMPLETE, handlerNewGameStart);
			task.addListener(TaskEvent.ERROR, handlerErrorStartNewGame);			
		}
		
		
		private function handlerNewGameStart(task:StartGameTask):void
		{
			_gameStateObject = task.gameStateObject;
			task.destroy();
			
			getGlobalDataAndShowGameWindow();
		}
		
		private function handlerErrorStartNewGame(task:StartGameTask):void
		{
			task.destroy();
		}
		
		
		private function getGlobalDataAndShowGameWindow():void
		{
			var messageGameData:MessageData   = this.sendMessage(GameCommands.GET_STATIC_MAP_DATA, 0);
			var messageTowersData:MessageData = this.sendMessage(GameCommands.GET_SESSION_TOWERS_DATA);			
			
			var staticMapData:IMapData = messageGameData.data as IMapData;
			var towers:Vector.<ITowerData> = messageTowersData.data as Vector.<ITowerData>;			
			
			if(staticMapData == null ||towers == null )	return;					
			
			var skinsName:Array = new Array(), i:int, messageTower:MessageData, towerItem:TowersStaticTableItem;
				
			for (i = 0; i < staticMapData.towers.length; i++) 
			{
				messageTower = this.sendMessage(GameCommands.GET_SESSION_TOWER_DATA_BY_ID, staticMapData.towers[i]);
				towerItem = messageTower.data as TowersStaticTableItem;
				
				if(towerItem)
				{
					skinsName.push( towerItem.skin );
				}
			}	
				
			var gameInitData:Object = 
				{
					"game_bg":staticMapData.image, 
					"towers_skin":skinsName, 
					"balance":staticMapData.balance, 
					"life":staticMapData.life, 
					"wave":staticMapData.waves,
					"map":staticMapData.mesh
				};
				
			this.sendMessage(GameEvents.INIT_GAME, gameInitData);
		}
		
		private function startTimer():void
		{
			Updater.get().addListener( updateAction );
		}
		
		private function updateAction(ms:Number):void
		{	
			var i:int;
			
			for (i = 0; i < _gameStateObject.notifications.length; i++) 
			{				
				var newMobData:SimpleMobObject = _gameStateObject.notifications[i].data as SimpleMobObject;
				
				this.sendMessage(GameEvents.UPDATE_MOBS_NOTIFICATION, [_gameStateObject.notifications[i], newMobData.getStaticData().skin]);
			}		
			
			_gameStateObject.flushNotifications();			
			
			for (i = 0; i < _gameStateObject.mobsList.length; i++) 
			{	
				this.sendMessage(GameEvents.UPDATE_MOBS_MOVE, _gameStateObject.mobsList[i]);
			}
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case MenuEvents.SHOW_GAME_WINDOW:
				{
					startNewGame();
					getGlobalDataAndShowGameWindow();
					
					break;
				}
				
				case GameEvents.START_GAME:
				{
					task.run(0); 			// надо что бы вместо 0 передавался реальный id карты
					startTimer();
					break;
				}
			}
		}
	}
}