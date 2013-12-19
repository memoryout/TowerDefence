package game.control.game
{
	import broadcast.BroadcastModule;
	
	import game.core.data.StaticDataManager;
	import game.core.game.GameMainModule;
	
	public class MainGameController extends BroadcastModule
	{
		private var _mainGameCore:			GameMainModule;
		private var _staticDataManager:		StaticDataManager;
		
		public function MainGameController()
		{
			super();
			
			initModules();
		}
		
		
		private function initModules():void
		{
			_staticDataManager = new StaticDataManager();
			_mainGameCore = new GameMainModule();
		}
	}
}