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
//			if(_currentWindow && _currentWindow.pageName == windowName) 
//			{
				_currentWindow.close();
				_currentWindow = null;
//			}
		}
	}
}