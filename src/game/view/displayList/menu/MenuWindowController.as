package game.view.displayList.menu
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import flash.display.Sprite;
	
	import game.view.dispatcher.ViewDispatcher;
	import game.view.events.MenuEvents;

	public class MenuWindowController extends BroadcastModule 
	{
		private var _contentContainer:	Sprite;
		private var _menuWindowView:	MenuWindowView;		
		
		public function MenuWindowController(contentContainer:Sprite)
		{
			_contentContainer = contentContainer;
			
			_menuWindowView = new MenuWindowView();		
			_contentContainer.addChild(_menuWindowView);
			
			initListener();
		}		
		
		private function initListener():void
		{
			addMessageListener(MenuEvents.SHOW_WINDOW);
			addMessageListener(MenuEvents.HIDE_WINDOW);
		}
		
		private function showWindow(windowName:String):void
		{
			_menuWindowView.openWindow(windowName);
		}
		
		private function hideWindow(windowName:String):void
		{
			_menuWindowView.closeWindow(windowName);
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case MenuEvents.SHOW_WINDOW:
				{
					showWindow(message.data);
					break;
				}
				case MenuEvents.HIDE_WINDOW:
				{
					hideWindow(message.data);
					break;
				}
			}
		}
	}
}