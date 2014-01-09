package game.core.data
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.core.data.tables.MobsStaticTable;
	import game.core.data.tables.TowersStaticTable;
	import game.core.data.tables.TowersStaticTableItem;
	import game.core.data.tables.WorldsStaticTable;
	import game.task.TaskEvent;
	
	public class StaticDataManager extends BroadcastModule
	{
		private var _towersTable:				TowersStaticTable;
		private var _mobsTable:					MobsStaticTable;
		private var _worlds:					WorldsStaticTable;
		
		public function StaticDataManager()
		{
			super();
			
			initListener();
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( StaticDataManagerCommands.PARSE_STATIC_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_ALL_MAPS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_MOBS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_TOWERS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_GAMES_DATA );
		}
		
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case StaticDataManagerCommands.PARSE_STATIC_DATA:
				{
					parseData(message.data as String)
					break;
				}
					
				case StaticDataManagerCommands.GET_ALL_MAPS_DATA:
				{
					//message.data = _maps;
					break;
				}
					
				case StaticDataManagerCommands.GET_MOBS_DATA:
				{
					//message.data = _mobs;
					break;
				}
					
				case StaticDataManagerCommands.GET_TOWERS_DATA:
				{
					//message.data = _towers;
					break;
				}
					
				case StaticDataManagerCommands.GET_GAMES_DATA:
				{
					//message.data = _games;
					break;
				}
			}
		}
		
		
		
		
		
		private function parseData(str:String):void
		{
			var parser:TableParser = new TableParser();
			parser.addListener(TaskEvent.COMPLETE, handlerParsingComplete);
			parser.run( str );
		}	
				
		private function parseWorldDataXML(xml:XML):void
		{
			
		}
		
		
		private function handlerParsingComplete(task:TableParser):void
		{
			switch(task.tableName)
			{
				case "towers":
				{
					_towersTable = task.table as TowersStaticTable;
					break;
				}
					
				case "mobs":
				{
					_mobsTable = task.table as MobsStaticTable;
					break;
				}
					
				case "worlds":
				{
					_worlds = task.table as WorldsStaticTable;
					break;
				}
			}
		}
		
		
		private function parseWorldData(data:Object):void
		{
			
		}
	}
}