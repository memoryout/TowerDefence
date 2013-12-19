package game.view.displayList.menu
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import game.view.displayList.menu.main.MainWindowView;
	import game.view.displayList.menu.upgrades.UpgradesWindowView;

	public class MenuWindowView extends Sprite
	{
		private var _currentWindow:			PrimaryWindow;
		
		private var _registeredWindows:		Dictionary;
		
		public function MenuWindowView()
		{
			_registeredWindows = new Dictionary();
			
			_registeredWindows[MenuData.MAIN_WINDOW_VIEW] 		= MainWindowView;			
			_registeredWindows[MenuData.UPGRADES_WINDOW_VIEW] 	= UpgradesWindowView;			
			
		}
		
		public function openWindow(windowName:String):void
		{
			if(_currentWindow)
			{
				if(_currentWindow.pageName == windowName) return;
								
				_currentWindow.close();
				_currentWindow = null;
			}
			
			if(_registeredWindows[windowName])
			{
				_currentWindow = new _registeredWindows[windowName]();
				_currentWindow.name = windowName;
				_currentWindow.open();
				
				this.addChild(_currentWindow);	
			}
		}
		
		public function closeWindow(windowName:String):void
		{
			if(_currentWindow && _currentWindow.pageName == windowName) 
			{
				_currentWindow.close();
				_currentWindow = null;
			}
		}
	}
}