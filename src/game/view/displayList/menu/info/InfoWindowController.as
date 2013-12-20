package game.view.displayList.menu.info
{
	import broadcast.BroadcastModule;
	
	import game.view.events.MenuEvents;

	public class InfoWindowController extends BroadcastModule
	{
		private var _infoWindowView:	InfoWindowView;
		
		public function InfoWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as InfoWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
	}
}