package game.view.displayList.menu.achievements
{
	import broadcast.BroadcastModule;
	
	import game.view.events.MenuEvents;

	public class AchievementsWindowController extends BroadcastModule
	{
		private var _infoWindowView:	AchievementsWindowView;
		
		public function AchievementsWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as AchievementsWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
	}
}