package game.core.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import utils.updater.Updater;
	
	public class GameMainModule extends BroadcastModule
	{
		
		public function GameMainModule()
		{
			super();
			
			initListeners();
			
			initTimer();
		}
		
		
		private function initListeners():void
		{
			this.addMessageListener(GameCoreCommands.START_GAME);
		}
		
		
		override public function receiveMessage(message:MessageData):void
		{
			var id:uint = message.message;
			
			switch(id)
			{
				case GameCoreCommands.START_GAME:
				{
					
					break;
				}
			}
		}
		
		
		private function receiveMessage(message:MessageData):void
		{
			
		}
		
		
		private function initTimer():void
		{
			Updater.get().addListener( update );
		}
		
		
		
		private function update(ms:Number):void
		{
			
		}
	}
}