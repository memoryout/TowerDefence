package game.control.boot
{
	import game.control.game.MainGameController;
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class StartupModules extends SimpleTask
	{
		private var _mainGameController:			MainGameController;
		
		public function StartupModules()
		{
			super();
		}
		
		override public function run(...args):void
		{
			_mainGameController = args[0] as MainGameController;
			
			_mainGameController.initDefaultUser();
			
			loadSavedData();
		}
		
		
		//-------------------------------------- load saved data -----------
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
			
			_mainGameController.setSavedData( "" );
			
			this.dispachLocalEvent( TaskEvent.COMPLETE, this );	
		}
		
		
		private function handlerErrorLoadSaveData(task:SimpleTask):void
		{
			task.destroy();
			
			_mainGameController.initDefaultUser();
			
			this.dispachLocalEvent( TaskEvent.COMPLETE, this );
		}
	}
}