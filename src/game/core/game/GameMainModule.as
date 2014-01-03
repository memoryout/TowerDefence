package game.core.game
{
	import broadcast.BroadcastModule;
	
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