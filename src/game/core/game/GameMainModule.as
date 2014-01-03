package game.core.game
{
	import broadcast.BroadcastModule;
	
	import utils.updater.TimerUpdater;
	
	public class GameMainModule extends BroadcastModule
	{
		private static const UPDATE_PERIOD:			uint = 100;
		
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
			var timer:TimerUpdater = new TimerUpdater();
			timer.startTimer(UPDATE_PERIOD);
			timer.addListener( update );
		}
		
		
		
		private function update():void
		{
			
		}
	}
}