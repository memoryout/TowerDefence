package game.control.view
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.control.game.tasks.StartGameTask;
	import game.core.data.tables.TowersStaticTableItem;
	import game.core.game.data.ActiveGameStateData;
	import game.interfaces.data.IMapData;
	import game.interfaces.data.ITowerData;
	import game.task.TaskEvent;
	import game.view.events.GameEvents;
	import game.view.events.MenuEvents;
	
	public class GameLogic extends BroadcastModule
	{
		private var _gameStateObject:			ActiveGameStateData;
		
		public function GameLogic()
		{
			super();
			initMessages();
		}
		
		private function initMessages():void
		{
			this.addMessageListener( MenuEvents.SHOW_GAME_WINDOW );
		}
		
		
		private function startNewGame():void
		{
			var task:StartGameTask = new StartGameTask();
			task.addListener(TaskEvent.COMPLETE, handlerNewGameStart);
			task.addListener(TaskEvent.ERROR, handlerErrorStartNewGame);
			task.run(0); 			// надо что бы вместо 0 передавался реальный id карты
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
			
			
			if(staticMapData == null ||towers == null )
			{
				return;
			}
			
			
			var skinsName:Array = new Array(), i:int, messageTower:MessageData, towerItem:TowersStaticTableItem;
				
			for (i = 0; i < staticMapData.towers.length; i++) 
			{
				messageTower = this.sendMessage(GameCommands.GET_SESSION_TOWER_DATA_BY_ID, staticMapData.towers[i]);
				towerItem = messageTower.data as TowersStaticTableItem
				
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
				
			this.sendMessage(GameEvents.START_GAME, gameInitData);
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case MenuEvents.SHOW_GAME_WINDOW:
				{
					startNewGame();
					//getGlobalDataAndShowGameWindow();
					break;
				}
			}
		}
	}
}