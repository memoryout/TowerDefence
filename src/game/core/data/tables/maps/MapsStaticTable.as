package game.core.data.tables.maps
{
	import game.core.data.tables.IStaticTable;
	
	public class MapsStaticTable implements IStaticTable
	{
		
		private const _items:		Vector.<MapsStaticTableItem> = new Vector.<MapsStaticTableItem>;
		
		public function MapsStaticTable()
		{
			
		}
		
		public function parse(value:String, type:String):void
		{
			if(type == "xml") parseXMLData(value);
			else parseJSONData(value);
		}
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, maps:XMLList, mapList:XML, mapItem:MapsStaticTableItem, par2:String, waves:XMLList, waveItem:MapsStaticTableItemWave;
			var meshList:XMLList, rowArr:Array, i:int, rowV:Vector.<int>;
			
			maps = xml.maps;
			
			for(par in maps.*)
			{
				mapList = maps.*[par];
				
				mapItem = new MapsStaticTableItem();
				mapItem.id = uint( mapList.@id );
				
				meshList = mapList.mesh;
				
				for(par2 in meshList.*)
				{
					rowArr = String(meshList.*[par2].*).split(",");
					
					rowV = new Vector.<int>;
					
					for(i = 0; i < rowArr.length; i++)
					{
						rowV.push( rowArr[i] );
					}
					
					mapItem.mesh.push( rowV );
				}
				
				meshList = mapList.towers;
				
				for(par2 in meshList.*)
				{
					mapItem.towers.push( uint(meshList.*[par].@id) );
				}
				
				
				
				_items.push( mapItem );
			}
		}
		
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}