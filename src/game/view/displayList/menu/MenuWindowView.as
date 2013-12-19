package game.view.displayList.menu
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class MenuWindowView extends Sprite
	{
		private var _currentWindow:			PrimaryWindow;
		
		private var _registeredWindows:		Dictionary;
		
		public function MenuWindowView()
		{
			_registeredWindows = new Dictionary();
			
//			_registeredWindows[""] 		= ;			
//			_registeredWindows[""] 		= ;				
		}
		
		public function openWindow(windowName:String):void
		{
//			_currentWindow.open();
		}
		
		public function closeWindow(windowName:String):void
		{
//			_currentWindow.close();
		}
	}
}