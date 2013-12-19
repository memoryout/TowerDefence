package game.view.displayList.menu
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import flash.display.Sprite;
	
	import game.view.dispatcher.ViewDispatcher;

	public class MenuWindowController extends BroadcastModule 
	{
		private var _contentContainer:	Sprite;
		private var _menuWindowView:	MenuWindowView;		
		
		public function MenuWindowController(contentContainer:Sprite)
		{
			_menuWindowView = new MenuWindowView();		
			_contentContainer.addChild(_menuWindowView);
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
			
		}
	}
}