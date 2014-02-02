package game.control.game.tasks
{
	import broadcast.message.MessageData;
	
	import game.control.game.MainGameController;
	import game.core.data.StaticDataManagerCommands;
	import game.core.data.tables.maps.MapsStaticTableItem;
	import game.core.game.GameCoreCommands;
	import game.core.game.data.ActiveGameStateData;
	import game.core.game.data.InitGameData;
	import game.core.parser.MapDataParser;
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class StartGameTask extends SimpleTask
	{
		public var gameStateObject:			ActiveGameStateData;
		
		public function StartGameTask()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var mapId:uint = args[0];
			
			var mainGameController:MainGameController = getSharedModule( MainGameController.MODULE_NAME) as MainGameController;
			mainGameController.initNewGame( mapId );
			
			
			
			var message:MessageData = this.sendMessage( StaticDataManagerCommands.GET_MAP_DATA_BY_ID );
			var mapData:MapsStaticTableItem = message.data as MapsStaticTableItem;
			
			if(mapData)
			{
				var initGameData:InitGameData = MapDataParser.get().createInitGameDataObject( mapData );
				
				this.sendMessage( GameCoreCommands.LOAD_GAME, initGameData);
				
				message = this.sendMessage( GameCoreCommands.START_GAME);
				gameStateObject = message.data as ActiveGameStateData;
				
				this.dispachLocalEvent(TaskEvent.COMPLETE, this);
			}
		}
	}
}