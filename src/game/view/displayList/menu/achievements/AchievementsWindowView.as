package game.view.displayList.menu.achievements
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.MenuData;
	import game.view.displayList.menu.PrimaryWindow;

	public class AchievementsWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:		String = "AchievementsWindow";
		
		private const BTN_CLOSE_NAME:	String = "BtnClose";
		
		private var _controller:		AchievementsWindowController;
		
		private var btnClose:			MovieClip;
		
		public function AchievementsWindowView()
		{
			super();
			
			pageName = MenuData.ACHIEVEMENTS_WINDOW_VIEW;
			
			addLinks();
			addListeners();
			
			_controller = new AchievementsWindowController(this);		
		}
		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			addChild(_viewElement);		
			
			btnClose = _viewElement.getChildByName(BTN_CLOSE_NAME) as MovieClip;
		}
		
		private function addListeners():void
		{
			btnClose.addEventListener(MouseEvent.CLICK, mClick);
			btnClose.buttonMode = true;
		}
		
		private function mClick(e:MouseEvent):void
		{
			_controller.showNextWindow(MenuData.MAIN_WINDOW_VIEW);
		}
	}
}