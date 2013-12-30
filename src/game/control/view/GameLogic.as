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
			var message:MessageData = this.sendMessage(GameCommands.GET_GAME_DATA);
			this.sendMessage(GameEvents.START_GAME, message.data);
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