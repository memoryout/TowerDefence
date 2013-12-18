package game.control
{
	import broadcast.BroadcastModule;
	
	import flash.display.Stage;
	
	import game.control.boot.AppBootTask;
	import game.task.ISimpleTask;
	import game.task.TaskEvent;
	import game.view.IViewRootModule;
	import game.view.ViewRootModule;
	
	public class AppRootModule extends BroadcastModule
	{
		private var _viewModule:			IViewRootModule;
		
		public function AppRootModule()
		{
			super();
		}
		
		public function init(stage:Stage):void
		{
			_viewModule = new ViewRootModule();
			
			var bootTask:AppBootTask = new AppBootTask();
			bootTask.addListener(TaskEvent.COMPLETE, handlerBootComplete);
			
			bootTask.run( stage, _viewModule );
		}
				
		private function handlerBootComplete(task:ISimpleTask):void
		{
			trace("handlerBootComplete");
		}
		
		private function resourcesLoadingComplete(task:ISimpleTask):void
		{
			trace("loaded");
		}
	}
}