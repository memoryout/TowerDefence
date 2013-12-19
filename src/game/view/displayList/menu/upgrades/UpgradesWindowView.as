package game.view.displayList.menu.upgrades
{
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;
	
	import game.view.displayList.menu.PrimaryWindow;

	public class UpgradesWindowView extends PrimaryWindow
	{		
		private const CLASS_NAME:	String = "UpgradesWindow";
		
		private var _controller:	UpgradesWindowController;		
		
		public function UpgradesWindowView()
		{
			super();
			
			addLinks();
			addListeners();
			
			_controller = new UpgradesWindowController(this);		
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
	}
}