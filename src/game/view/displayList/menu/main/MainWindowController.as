package game.view.displayList.menu.main
{
	import broadcast.BroadcastModule;
	
	import game.view.events.MenuEvents;

	public class MainWindowController extends BroadcastModule
	{
		private var _mainWindowView:	MainWindowView;
		
		public function MainWindowController(viewComponent:Object=null)
		{
			_mainWindowView = viewComponent as MainWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
	}
}