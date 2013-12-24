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
		private const BTN_TO_GAME_NAME:	String = "BtnToGame";
		
		private var _controller:		StartGameWindowController;
		private var btnClose:			MovieClip;
		private var btnToGame:			MovieClip;
		
		public function StartGameWindowView()
		{
			super();
			
			pageName = MenuData.START_GAME_WINDOW_VIEW;
			
			addLinks();
			addListeners();
			
			_controller = new StartGameWindowController(this);		
		}
		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			addChild(_viewElement);		
			
			btnClose  = _viewElement.getChildByName(BTN_CLOSE_NAME) as MovieClip;
			btnToGame = _viewElement.getChildByName(BTN_TO_GAME_NAME) as MovieClip;
		}
		
		private function addListeners():void
		{
			btnClose.addEventListener(MouseEvent.CLICK,  mClickClose);
			btnToGame.addEventListener(MouseEvent.CLICK, mClickToGame);
			
			btnClose.buttonMode  = true;
			btnToGame.buttonMode = true;
		}
		
		private function mClickClose(e:MouseEvent):void
		{
			_controller.showNextWindow(MenuData.MAP_WINDOW_VIEW);
		}
		
		private function mClickToGame(e:MouseEvent):void
		{
			_controller.goToGame();
		}
	}
}