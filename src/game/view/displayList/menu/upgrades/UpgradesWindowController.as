package game.view.displayList.menu.upgrades
{
	import broadcast.BroadcastModule;
	
	import game.view.events.MenuEvents;

	public class UpgradesWindowController extends BroadcastModule
	{
		private var _upgradesWindowView:	UpgradesWindowView;	
						
		public function UpgradesWindowController(viewComponent:Object=null)
		{
			_upgradesWindowView = viewComponent as UpgradesWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
	}
}