package game.view.displayList.menu.additional_window.start_game
{
	import broadcast.BroadcastModule;
	
	import game.view.displayList.menu.MenuData;
	import game.view.events.GameEvents;
	import game.view.events.MenuEvents;

	public class StartGameWindowController extends BroadcastModule
	{
		private var _infoWindowView:	StartGameWindowView;
		
		public function StartGameWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as StartGameWindowView;
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
		
		public function goToGame():void
		{
			this.sendMessage(MenuEvents.HIDE_WINDOW, MenuData.START_GAME_WINDOW_VIEW);
			this.sendMessage(MenuEvents.SHOW_GAME_WINDOW, null);
		}
	}
}