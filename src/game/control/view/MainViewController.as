package game.control.view
{
	import broadcast.BroadcastModule;
	
	import game.GameGlobalData;
	import game.view.displayList.menu.MenuData;
	import game.view.events.MenuEvents;
	import game.view.interfaces.IMainAppScreen;
	
	public class MainViewController extends BroadcastModule
	{
		private var _mainAppScreen:			IMainAppScreen;		
		
		public function MainViewController()
		{
			super();
		}		
		
		public function setMainAppScreen(screen:IMainAppScreen):void
		{
			_mainAppScreen = screen;
			_mainAppScreen.setSourceSize( GameGlobalData.SOURCE_WIDTH, GameGlobalData.SOURCE_HEIGHT);
		}
		
		public function showDefaultPreloader():void
		{
			_mainAppScreen.showDefaultPreloaderScreen();
		}
		
		public function removeDefaultPreloader():void
		{
			_mainAppScreen.removeDefaultPreloader();
		}
		
		public function addMenu():void
		{
			_mainAppScreen.addMenu();
		}
		
		
		public function initGame():void
		{
			addMenu();
			
			sendMessage(MenuEvents.SHOW_WINDOW, MenuData.MAIN_WINDOW_VIEW);
		}
	}
}