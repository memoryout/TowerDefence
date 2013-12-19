package game.control
{
	import broadcast.BroadcastModule;
	
	import flash.display.Stage;
	
	import game.control.boot.AppBootTask;
	import game.control.game.MainGameController;
	import game.control.view.MainViewController;
	import game.control.view.MenuLogic;
	import game.task.ISimpleTask;
	import game.task.TaskEvent;
	import game.view.IViewRootModule;
	import game.view.ViewRootModule;
	import game.view.displayList.menu.MenuData;
	import game.view.events.MenuEvents;
	
	public class AppRootModule extends BroadcastModule
	{
		private var _viewModule:			IViewRootModule;
		
		private var _mainViewController:	MainViewController;
		
		private var _menuLogic:				MenuLogic;
		
		private var _mainGameController:	MainGameController;
		
		public function AppRootModule()
		{
			super();
		}
		
		public function init(stage:Stage):void
		{
			initModules();
			
			var bootTask:AppBootTask = new AppBootTask();
			bootTask.addListener(TaskEvent.COMPLETE, handlerBootComplete);
			
			bootTask.run( stage, _viewModule, _mainViewController, _mainGameController );
		}
		
		
		private function initModules():void
		{
			_viewModule 		= new ViewRootModule();
			_mainViewController = new MainViewController();
			_menuLogic 			= new MenuLogic();
			
			_mainGameController = new MainGameController();
		}
				
		private function handlerBootComplete(task:ISimpleTask):void
		{
			task.destroy();
			
			_mainViewController.initGame();
		}
	}
}