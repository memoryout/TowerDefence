package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.core.data.StaticDataManager;
	import game.core.data.StaticDataManagerCommands;
	import game.core.game.GameMainModule;
	import game.core.session.GameSession;
	
	public class MainGameController extends BroadcastModule
	{
		public static const MODULE_NAME:		String = "mainGameController";
		
		private var _mainGameCore:			GameMainModule;
		private var _staticDataManager:		StaticDataManager;
		
		private var _dataController:		DataController;
		
		private var _session:				GameSession;
		
		public function MainGameController()
		{
			super();
			
			setSharedModule( MODULE_NAME, this );
			
			initModules();
		}
		
		
		public function initGameSessionData():void
		{
			_dataController.initDefaultUserSession();
		}
		
		
		public function initDefaultUser():void
		{
			
		}
		
		
		public function setSavedData(str:String):void
		{
			
		}
		
		public function initGame():void
		{
			
		}
		
		
		public function initNewGame(mapId:uint):void
		{
			
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