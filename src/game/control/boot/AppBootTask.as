package game.control.boot
{
	import flash.display.Stage;
	
	import game.control.game.MainGameController;
	import game.control.tasks.LoadGameStaticData;
	import game.control.view.MainViewController;
	import game.core.data.StaticDataManagerCommands;
	import game.errors.ErrorsDescription;
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	import game.view.IViewRootModule;
	import game.view.ViewRootEvents;
	
	public class AppBootTask extends SimpleTask
	{
		private var _viewController:		MainViewController;
		private var _mainGameController:	MainGameController;
		
		public function AppBootTask()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var stage:Stage = args[0] as Stage;
			var viewRoot:IViewRootModule = args[1] as IViewRootModule;
			
			_viewController = args[2] as MainViewController;
			_mainGameController = args[3] as MainGameController;
			
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
		}
		
		//-------------------------------------- load game source -----------
		private function loadGameSource():void
		{
			var loader:SourceLoader = new SourceLoader();
			loader.addListener(TaskEvent.COMPLETE, handlerSourceLoadComplete);
			loader.addListener(TaskEvent.ERROR, handlerErrorLoadSources);
			loader.run( TowerDefenceData.SOURCE_LOCAL_URL );
		}
		
		
		private function handlerErrorLoadSources(task:SimpleTask):void
		{
			task.destroy();
			this.dispachLocalEvent( TaskEvent.ERROR, ErrorsDescription.ERROR_LOAD_GAME_SOURCE_FILE );
		}
		
		private function handlerSourceLoadComplete(task:SimpleTask):void
		{		
			task.destroy();
			
			loadStaticData();
			
			_viewController.removeDefaultPreloader();
		}
		
		
		
		//-------------------------------------- load game static data -----------
		private function loadStaticData():void
		{
			var staticDataLoader:LoadGameStaticData = new LoadGameStaticData();
			staticDataLoader.addListener(TaskEvent.COMPLETE, handlerLoadStaticData);
			staticDataLoader.addListener(TaskEvent.ERROR, handlerErrorLoadStaticData);
			staticDataLoader.run( TowerDefenceData.STATIC_GAME_DATA, _mainGameController );
		}
		
		private function handlerErrorLoadStaticData(error:String):void
		{
			this.dispachLocalEvent( TaskEvent.ERROR, error );
		}
		
		
		private function handlerLoadStaticData(task:LoadGameStaticData):void
		{
			var files:Vector.<String> = task.filesData;
			
			task.destroy();
			
			var i:int;
			for(i = 0; i < files.length; i++)
			{
				this.sendMessage(StaticDataManagerCommands.PARSE_STATIC_DATA, files[i]);
			}
			
			this.dispachLocalEvent( TaskEvent.COMPLETE, this );
		}
	}
}