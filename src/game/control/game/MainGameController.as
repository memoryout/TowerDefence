package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.core.data.StaticMapData;
	import game.core.data.StaticDataManager;
	import game.core.data.StaticDataManagerCommands;
	import game.core.game.GameMainModule;
	import game.core.session.GameSession;
	
	public class MainGameController extends BroadcastModule
	{
		private var _mainGameCore:			GameMainModule;
		private var _staticDataManager:		StaticDataManager;
		
		private var _dataController:		DataController;
		
		private var _session:				GameSession;
		
		public function MainGameController()
		{
			super();
			
			initModules();
		}
		
		
		public function initDefaultUser():void
		{
			_dataController.initDefaultUser();
		}
		
		public function setSavedData(str:String):void
		{
			
		}
		
		
		public function initGame():void
		{
			_dataController.initSessionData();
		}
		
		
		private function initModules():void
		{
			_session = GameSession.get();
			
			_staticDataManager = new StaticDataManager();
			_mainGameCore = new GameMainModule();
			
			_dataController = new DataController();
		}
	}
}