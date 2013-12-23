package game.view.displayList.menu.additional_window.start_game
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.MenuData;
	import game.view.displayList.menu.PrimaryWindow;

	public class StartGameWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:		String = "StartGameWindow";
		
		private const BTN_CLOSE_NAME:	String = "BtnClose";
		
		private var _controller:		StartGameWindowController;
		private var btnClose:			MovieClip;
		
		public function StartGameWindowView()
		{
			super();
			
			addLinks();
			addListeners();
			
			_controller = new StartGameWindowController(this);		
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
			_controller.showNextWindow(MenuData.MAP_WINDOW_VIEW);
		}
	}
}