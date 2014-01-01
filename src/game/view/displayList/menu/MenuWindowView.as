package game.view.displayList.menu
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	import game.view.displayList.menu.achievements.AchievementsWindowView;
	import game.view.displayList.menu.additional_window.start_game.StartGameWindowView;
	import game.view.displayList.menu.info.InfoWindowView;
	import game.view.displayList.menu.main.MainWindowView;
	import game.view.displayList.menu.map.MapWindowView;
	import game.view.displayList.menu.upgrades.UpgradesWindowView;

	public class MenuWindowView extends Sprite
	{
		private var _currentWindow:			PrimaryWindow;
		
		private var _registeredWindows:		Dictionary;
		private var _windowNameForShow:		String;
		
		public function MenuWindowView()
		{
			_registeredWindows = new Dictionary();
			
			_registeredWindows[MenuData.MAIN_WINDOW_VIEW] 			= MainWindowView;			
			_registeredWindows[MenuData.UPGRADES_WINDOW_VIEW] 		= UpgradesWindowView;
			_registeredWindows[MenuData.INFO_WINDOW_VIEW] 			= InfoWindowView;		
			_registeredWindows[MenuData.ACHIEVEMENTS_WINDOW_VIEW] 	= AchievementsWindowView;				
			_registeredWindows[MenuData.MAP_WINDOW_VIEW] 			= MapWindowView;	
			_registeredWindows[MenuData.START_GAME_WINDOW_VIEW] 	= StartGameWindowView;	
//			_registeredWindows[MenuData.END_GAME_WINDOW_VIEW] 		= ;	
			
		}
		
		public function openWindow(windowName:String):void
		{
			_windowNameForShow = windowName;
			
			if(_currentWindow)
			{
				if(_currentWindow.pageName == windowName) return;
												
				closeWindow(_currentWindow.pageName, registerAndAddWindow);
			}
			else registerAndAddWindow();			
		}
		
		private function registerAndAddWindow():void
		{
			if(_currentWindow && this.contains(_currentWindow)) 
			{
				this.removeChild(_currentWindow);
				_currentWindow = null;
			}
			
			if(_registeredWindows[_windowNameForShow])
			{
				_currentWindow = new _registeredWindows[_windowNameForShow]();
				_currentWindow.name = _windowNameForShow;
				_currentWindow.open();
				
				this.addChild(_currentWindow);	
			}
		}
		
		public function closeWindow(windowName:String, callBack:Function = null):void
		{
//			if(_currentWindow && _currentWindow.pageName == windowName) 
//			{
				_currentWindow.close(callBack);				
//			}
		}
	}
}