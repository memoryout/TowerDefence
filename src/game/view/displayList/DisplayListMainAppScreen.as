package game.view.displayList
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import game.view.displayList.menu.MenuWindowController;
	import game.view.displayList.menu.MenuWindowView;
	import game.view.displayList.preloader.DefaultPreloader;
	import game.view.interfaces.IMainAppScreen;
	
	public class DisplayListMainAppScreen extends Sprite implements IMainAppScreen
	{
		private var _defaultPreloader:			DefaultPreloader;
		
		private var _menuWindowController:		MenuWindowController;
		
		private var _contentContainer:			Sprite;
		
		private var _sourceWidth:				Number;
		private var _sourceHeight:				Number;
		
		public function DisplayListMainAppScreen()
		{
			super();
		}
		
		public function init(stage:Stage):void
		{
			stage.addChild( this );
			
			_contentContainer = new Sprite();
			this.addChild( _contentContainer );
		}
		
		public function setSourceSize(width:uint, height:uint):void
		{
			_sourceWidth = width;
			_sourceHeight = height;
			
			fitContentToScreen();
		}
		
		
		public function showDefaultPreloaderScreen():void
		{
			_defaultPreloader = new DefaultPreloader();
			_contentContainer.addChild( _defaultPreloader );
		}
		
		public function removeDefaultPreloader():void
		{
			if(_defaultPreloader && _contentContainer.contains( _defaultPreloader ) ) _contentContainer.removeChild( _defaultPreloader );
			_defaultPreloader = null;
		}
		
		public function addMenu():void
		{			
			_menuWindowController = new MenuWindowController(_contentContainer);			
		}	
		
		private function fitContentToScreen():void
		{
			var screenWidht:uint, screenHeight:uint, contentWidth:Number, contentHeight:Number, scale:Number;
			
			screenWidht = Math.max(this.stage.fullScreenWidth, this.stage.fullScreenHeight);
			screenHeight = Math.min(this.stage.fullScreenWidth, this.stage.fullScreenHeight);
						
			//contentWidth = Math.min( screenWidht, _sourceWidth );
			contentWidth =  screenWidht;
			
			scale = contentWidth / _sourceWidth;
			
			contentHeight = _sourceHeight * scale;
			
			if( contentHeight > screenHeight)
			{
				contentHeight = screenHeight;
				scale = screenHeight / _sourceHeight;
				contentWidth = _sourceWidth * scale;
			}
			
			_contentContainer.scaleX = _contentContainer.scaleY = scale;
			
			_contentContainer.x = (screenWidht - contentWidth) >> 1;
			_contentContainer.y = (screenHeight - contentHeight) >> 1;
		}
	}
}