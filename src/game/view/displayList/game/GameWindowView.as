package game.view.displayList.game
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	
	import game.view.displayList.menu.PrimaryWindow;
	
	public class GameWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:		String = "GameWindow";
		
		private const BALANCE_TXT_NAME:	String = "balance_txt";
		private const LIFE_TXT_NAME:	String = "life_txt";
		private const WAVE_TXT_NAME:	String = "wave_txt";
		
		private const BUTTON_CONTIANER_NAME:String = "buttonContainer";
		
		private var _controller:		GameWindowController;
		
		private var _buttonContianer:	MovieClip;
		
		private var _contentContainer:	Sprite;
		
		private var _balanceTxt:		TextField;
		private var _lifeTxt:			TextField;
		private var _waveTxt:			TextField;
		
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
		
		public function addContainerToView():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			_contentContainer.addChild(_viewElement);
			
			_balanceTxt = _viewElement.getChildByName(BALANCE_TXT_NAME) as TextField;
			_lifeTxt 	= _viewElement.getChildByName(LIFE_TXT_NAME) as TextField;
			_waveTxt 	= _viewElement.getChildByName(WAVE_TXT_NAME) as TextField;
		}
		
		private function mClick(e:MouseEvent):void
		{
			
		}
		
		public function initMainElements(obj:Object):void
		{
			trace(obj);
			_balanceTxt.text = obj.balance.toString();
			_lifeTxt.text    = obj.life.toString();
			_waveTxt.text    = obj.wave.toString();
			
		}
	}
}