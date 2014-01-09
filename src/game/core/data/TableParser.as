package game.core.data
{
	import flash.net.URLVariables;
	
	import game.core.data.tables.IStaticTable;
	import game.core.data.tables.MobsStaticTable;
	import game.core.data.tables.TowersStaticTable;
	import game.core.data.tables.WorldsStaticTable;
	import game.core.data.tables.maps.MapsStaticTable;
	import game.task.SimpleTask;
	import game.task.TaskEvent;

	public class TableParser extends SimpleTask
	{
		private var _sourceData:		String;
		
		private var _content:			String;
		private var _type:				String;
		private var _table:				String;
		
		
		private var _staticTable:		IStaticTable;
		
		public function TableParser()
		{
			
		}
		
		override public function run(...args):void
		{
			_sourceData = args[0];
			
			readVariables();
			
			switch(_table)
			{
				case "mobs":
				{
					parseMobsTable();
					break;
				}
					
				case "towers":
				{
					parseTowersTable();
					break;
				}
					
				case "worlds":
				{
					parseWorldsTable();
					break;
				}
					
				case "maps":
				{
					parseMapsTable();
					break;
				}
			}
			
			if(_staticTable) this.dispachLocalEvent(TaskEvent.COMPLETE, this);
			else destroy();
		}
		
		
		public function get tableName():String
		{
			return _table;
		}
		
		
		public function get table():IStaticTable
		{
			return _staticTable;
		}
		
		
		private function readVariables():void
		{
			var vars:Array = _sourceData.split("@");
			
			vars.shift();
			
			var i:int, variable:String, symbol:String;
			for(i = 0; i < vars.length; i++)
			{
				variable = vars[i];
				symbol = variable.charAt( variable.length - 1 );
				while(symbol == "\n" || symbol == "\r")
				{
					variable = variable.slice(0, variable.length - 1);
					symbol = variable.charAt( variable.length - 1 );
				}
				
				vars[i] = variable;
			}
			
			
			var values:Array;
			
			for(i = 0; i < vars.length; i++)
			{
				values = String(vars[i]).split("=");
				
				variable = values.shift();
				symbol = values.join("=");
				
				switch(variable)
				{
					case "type":
					{
						_type = symbol;
						break;
					}
						
					case "table":
					{
						_table = symbol;
						break;
					}
							
					case "content":
					{
						_content = symbol;
						break;
					}
				}
			}
		}
		
		
		override public function destroy():void
		{
			_staticTable = null;
			
			super.destroy();
		}
		
		
		//--------------------------- MOBS TABLE ------------------
		private function parseMobsTable():void
		{
			_staticTable = new MobsStaticTable();
			_staticTable.parse( _content, _type );
		}
		
		
		
		//--------------------------- TOWERS TABLE ------------------
		private function parseTowersTable():void
		{
			_staticTable = new TowersStaticTable();
			_staticTable.parse( _content, _type );
		}
		
		
		
		//--------------------------- WORLDS TABLE ------------------
		private function parseWorldsTable():void
		{
			_staticTable = new WorldsStaticTable();
			_staticTable.parse( _content, _type );
		}
		
		
		//--------------------------- MAPS TABLE ------------------
		private function parseMapsTable():void
		{
			_staticTable = new MapsStaticTable();
			_staticTable.parse( _content, _type );
		}
		
	}
}