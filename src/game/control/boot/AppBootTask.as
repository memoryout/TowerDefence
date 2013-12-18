package game.control.boot
{
	import flash.display.Stage;
	
	import game.control.view.MainViewController;
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	import game.view.IViewRootModule;
	import game.view.ViewRootEvents;
	
	public class AppBootTask extends SimpleTask
	{
		private var _viewController:		MainViewController;
		
		public function AppBootTask()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var stage:Stage = args[0] as Stage;
			var viewRoot:IViewRootModule = args[1] as IViewRootModule;
			
			_viewController = args[2] as MainViewController;
			
			viewRoot.addEventListener(ViewRootEvents.VIEW_INIT_COMPLETE, handlerViewInitComplete);
			viewRoot.init( stage );
		}
		
		private function handlerViewInitComplete(data:* = null):void
		{
			var viewRoot:IViewRootModule = data as IViewRootModule;
			viewRoot.removeEventListener(ViewRootEvents.VIEW_INIT_COMPLETE, handlerViewInitComplete);
			
			_viewController.setMainAppScreen( viewRoot.mainAppScreen );
			_viewController.showDefaultPreloader();
			
			loadGameSource();
			
			trace("handlerViewInitComplete");
		}
		
		
		private function loadGameSource():void
		{
			var loader:SourceLoader = new SourceLoader();
			loader.addListener(TaskEvent.COMPLETE, handlerSourceLoadComplete);
			loader.run( TowerDefenceData.SOURCE_LOCAL_URL );
		}
		
		private function handlerSourceLoadComplete(task:SimpleTask):void
		{
			task.destroy();
			
			loadSavedData();
		}
		
		
		private function loadSavedData():void
		{
			var savedDataLoader:LoadSavedData = new LoadSavedData();
			savedDataLoader.addListener( TaskEvent.COMPLETE, handlerSavedDataLoaded);
			savedDataLoader.addListener( TaskEvent.ERROR, handlerErrorLoadSaveData);
			savedDataLoader.run( TowerDefenceData.SAVED_DATA_URL );
		}
		
		
		private function handlerSavedDataLoaded(task:SimpleTask):void
		{
			task.destroy();
			
			this.dispachLocalEvent( TaskEvent.COMPLETE, this );
		}
		
		
		private function handlerErrorLoadSaveData(task:SimpleTask):void
		{
			task.destroy();
			
			this.dispachLocalEvent( TaskEvent.COMPLETE, this );
		}
	}
}