package game.view.displayList.menu.main
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.PrimaryWindow;
	
	public class MainWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:String = "MenuWindow";
		
		private const BUTTON_CONTIANER_NAME:String = "buttonContainer";
		
		private var _controller:		MainWindowController;
		
		private var _buttonContianer:	MovieClip;
		
		public function MainWindowView()
		{
			super();
			
			addLinks();
			addListeners();
			
			_controller = new MainWindowController(this);		
		}
		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			addChild(_viewElement);		
			
			_buttonContianer = _viewElement.getChildByName(BUTTON_CONTIANER_NAME) as MovieClip;
		}
		
		private function addListeners():void
		{
			_buttonContianer.addEventListener(MouseEvent.CLICK, mClick);
			_buttonContianer.buttonMode = true;
		}
		
		private function mClick(e:MouseEvent):void
		{
			_controller.showNextWindow(e.target.name);
		}
	}
}