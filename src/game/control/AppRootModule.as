package game.control
{
	import broadcast.BroadcastModule;
	
	import flash.display.Stage;
	
	import game.control.boot.AppBootTask;
	import game.control.view.MainViewController;
	import game.task.ISimpleTask;
	import game.task.TaskEvent;
	import game.view.IViewRootModule;
	import game.view.ViewRootModule;
	
	public class AppRootModule extends BroadcastModule
	{
		private var _viewModule:			IViewRootModule;
		
		private var _mainViewController:	MainViewController;
		
		public function AppRootModule()
		{
			super();
		}
		
		public function init(stage:Stage):void
		{
			initModules();
			
			var bootTask:AppBootTask = new AppBootTask();
			bootTask.addListener(TaskEvent.COMPLETE, handlerBootComplete);
			
			bootTask.run( stage, _viewModule, _mainViewController );
		}
		
		
		private function initModules():void
		{
			_viewModule = new ViewRootModule();
			_mainViewController = new MainViewController();
		}
				
		private function handlerBootComplete(task:ISimpleTask):void
		{
			trace("handlerBootComplete");
			
			_mainViewController.addMenu();
		}
	}
}