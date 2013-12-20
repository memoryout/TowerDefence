package game.view.displayList.menu.info
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.PrimaryWindow;

	public class InfoWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:String = "InfoWindow";
		
		private var _controller:		InfoWindowController;
		
		public function InfoWindowView()
		{
			super();
			
			addLinks();
			addListeners();
			
			_controller = new InfoWindowController(this);		
		}
		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			addChild(_viewElement);		
		}
		
		private function addListeners():void
		{
			
		}
		
		private function mClick(e:MouseEvent):void
		{
			_controller.showNextWindow(e.target.name);
		}
	}
}