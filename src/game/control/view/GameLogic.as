package game.control.view
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.view.events.GameEvents;
	import game.view.events.MenuEvents;
	
	public class GameLogic extends BroadcastModule
	{
		public function GameLogic()
		{
			super();
			initMessages();
		}
		
		private function initMessages():void
		{
			this.addMessageListener( MenuEvents.SHOW_GAME_WINDOW );
			this.addMessageListener( GameCommands.GET_GAME_DATA );
		}
		
		private function getGlobalDataAndShowGameWindow():void
		{
			var messageGameData:MessageData   = this.sendMessage(GameCommands.GET_GAME_DATA);
			var messageTowersData:MessageData = this.sendMessage(GameCommands.GET_TOWERS_DATA);
			
			var skinsName:Array = new Array(), i:int;
			
			for (i = 0; i < messageGameData.data[0].towers.length; i++) 
			{
				var towerId:int = messageGameData.data[0].towers[i];
				skinsName.push(messageTowersData.data[towerId].skin) 
			}	
			
			var gameInitData:Object = 
			{
				"game_bg":messageGameData.data[0].image, 
				"towers_skin":skinsName, 
				"balance":messageGameData.data[0].balance, 
				"life":messageGameData.data[0].life, 
				"wave":messageGameData.data[0].wave
			};
			
			this.sendMessage(GameEvents.START_GAME, gameInitData);
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case MenuEvents.SHOW_GAME_WINDOW:
				{
					getGlobalDataAndShowGameWindow();
					break;
				}
			}
		}
	}
}