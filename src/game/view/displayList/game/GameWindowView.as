package game.view.displayList.game
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.ui.Mouse;
	
	import game.view.displayList.menu.PrimaryWindow;
	
	public class GameWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:				String = "GameWindow";
		
		private const BALANCE_TXT_NAME:			String = "balance_txt";
		private const LIFE_TXT_NAME:			String = "life_txt";
		private const WAVE_TXT_NAME:			String = "wave_txt";
		
		private const BUTTON_CONTIANER_NAME:	String = "buttonContainer";
		
		private var _controller:				GameWindowController;
		
		private var _buttonContianer:			MovieClip;	
		private var _contentContainer:			Sprite;		
		private var _towersContainer:			Sprite;
		private var _selectedTower:				MovieClip;
		
		
		private var _balanceTxt:				TextField;
		private var _lifeTxt:					TextField;
		private var _waveTxt:					TextField;
		
		private var possibkePositionOnMap:		Vector.<Vector.<int>>;
		
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
			_balanceTxt.text = obj.balance.toString();
			_lifeTxt.text    = obj.life.toString();
			_waveTxt.text    = obj.wave.toString();			
			
			/// add background to view
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( obj.game_bg.toString()) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			_contentContainer.addChildAt(_viewElement, 0);
			
			
			setTowers(obj.towers_skin);
		}
		
		private function setTowers(towers:Array):void
		{
			_towersContainer = new Sprite();
			
			for (var i:int = 0; i < towers.length; i++) 
			{
				var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition(towers[i]) as Class;
				var _viewElement:MovieClip = new _viewClass();
								
				_towersContainer.addChild(_viewElement);
				_viewElement.x = i*_viewElement.width;				
				_viewElement.name = towers[i];
			}
			
			_towersContainer.buttonMode = true;

			_contentContainer.addChild(_towersContainer);
			_towersContainer.y = 420;
			
			_towersContainer.addEventListener(MouseEvent.MOUSE_DOWN, addClickedTower);
		}
		
		private function addClickedTower(e:MouseEvent):void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition(e.target.name) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			_selectedTower = _viewElement;
			
			_contentContainer.addChild(_selectedTower);
			_selectedTower.x = e.target.x;
			_selectedTower.y = _towersContainer.y;
			
			_contentContainer.addEventListener(MouseEvent.MOUSE_MOVE, towerMove);
			_contentContainer.addEventListener(MouseEvent.MOUSE_UP,   towerUp);
		}
		
		private function towerMove(e:MouseEvent):void
		{
			_selectedTower.x = e.stageX - _selectedTower.width/2;
			_selectedTower.y = e.stageY -_selectedTower.height/2;			
		}
		
		private function towerUp(e:MouseEvent):void
		{
			_contentContainer.removeEventListener(MouseEvent.MOUSE_MOVE, towerMove);
		}		
	}
}