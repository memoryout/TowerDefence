package game.control.boot
{
	import flash.display.Stage;
	
	import game.task.SimpleTask;
	import game.view.IViewRootModule;
	import game.view.ViewRootEvents;
	
	public class AppBootTask extends SimpleTask
	{
		public function AppBootTask()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var stage:Stage = args[0] as Stage;
			var viewRoot:IViewRootModule = args[1] as IViewRootModule;
			
			viewRoot.addEventListener(ViewRootEvents.VIEW_INIT_COMPLETE, handlerViewInitComplete);
			viewRoot.init( stage );
		}
		
		private function handlerViewInitComplete(data:* = null):void
		{
			trace("handlerViewInitComplete");
		}
	}
}