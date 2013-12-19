package game.control.game
{
	import broadcast.BroadcastModule;
	
	import game.core.data.StaticDataManager;
	import game.core.game.GameMainModule;
	import game.core.session.GameSession;
	
	public class MainGameController extends BroadcastModule
	{
		private var _mainGameCore:			GameMainModule;
		private var _staticDataManager:		StaticDataManager;
		
		private var _dataController:		DataController;
		
		public function MainGameController()
		{
			super();
			
			initModules();
		}
		
		
		public function initDefaultUser():void
		{
			_dataController.initDefaultUser();
		}
		
		
		private function initModules():void
		{
			GameSession.get();
			
			_staticDataManager = new StaticDataManager();
			_mainGameCore = new GameMainModule();
			
			_dataController = new DataController();
		}
	}
}