package game.view.displayList.game
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.PrimaryWindow;
	
	public class GameWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:String = "GameWindow";
		
		private const BUTTON_CONTIANER_NAME:String = "buttonContainer";
		
		private var _controller:		GameWindowController;
		
		private var _buttonContianer:	MovieClip;
		
		private var _contentContainer:	Sprite;
		
		public function GameWindowView(contentContainer:Sprite)
		{
			_contentContainer = contentContainer;
			super();
		}
		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
					
//			_buttonContianer = _viewElement.getChildByName(BUTTON_CONTIANER_NAME) as MovieClip;
		}
		
		private function addListeners():void
		{
			/*_buttonContianer.addEventListener(MouseEvent.CLICK, mClick);
			_buttonContianer.buttonMode = true;*/
		}
		
		public function addContainerToview():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			_contentContainer.addChild(_viewElement);
		}
		
		private function mClick(e:MouseEvent):void
		{
			
		}
	}
}