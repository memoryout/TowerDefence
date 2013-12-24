package game.control.view
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
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
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case MenuEvents.SHOW_GAME_WINDOW:
				{
					this.sendMessage(GameEvents.START_GAME, null);
					break;
				}
			}
		}
	}
}