package game.view.displayList.menu.map
{
	import broadcast.BroadcastModule;
	
	import game.view.events.MenuEvents;

	public class MapWindowController extends BroadcastModule
	{	
		private var _infoWindowView:	MapWindowView;
		
		public function MapWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as MapWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
	}
}