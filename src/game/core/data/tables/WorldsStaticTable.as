package game.core.data.tables
{
	public class WorldsStaticTable implements IStaticTable
	{
		private const _items:				Vector.<WorldsStaticTableItem> = new Vector.<WorldsStaticTableItem>;
		
		
		public function WorldsStaticTable()
		{
			
		}
		
		public function parse(value:String, type:String):void
		{
			if(type == "xml") parseXMLData(value);
			else parseJSONData(value);
		}
		
		public function getItems():Vector.<WorldsStaticTableItem>
		{
			return _items;
		}
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, worlds:XMLList, worldList:XML, worldItem:WorldsStaticTableItem, par2:String, pointXML:XML, pointItem:WorldsStaticTableItemPoint;
			
			worlds = xml.worlds;
			
			for(par in worlds.*)
			{
				worldList = worlds.*[par];
				
				worldItem = new WorldsStaticTableItem();
				worldItem.id = uint( worldList.@id );
				worldItem.image = String( worldList.@image );
				worldItem.description = String( worldList.description );
				worldItem.title = String( worldList.title );
				
				for(par2 in worldList.points.*)
				{
					pointXML = worldList.points.*[par2];
					
					pointItem = new WorldsStaticTableItemPoint();
					pointItem.id = uint( pointXML.@id );
					pointItem.mapId = uint( pointXML.@mapId );
					pointItem.x = Number( pointXML.@x );
					pointItem.y = Number( pointXML.@y );
					pointItem.title = String( pointXML.@title );
					
					worldItem.points.push( pointItem );
				}
				
				
				_items.push( worldItem );
			}
		}
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}