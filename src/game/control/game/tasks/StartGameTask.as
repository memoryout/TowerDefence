package game.control.game.tasks
{
	import game.control.game.MainGameController;
	import game.task.SimpleTask;
	
	public class StartGameTask extends SimpleTask
	{
		public function StartGameTask()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var mapId:uint = args[0];
			
			var mainGameController:MainGameController = getSharedModule( MainGameController.MODULE_NAME) as MainGameController;
			mainGameController.initNewGame( mapId );
		}
	}
}