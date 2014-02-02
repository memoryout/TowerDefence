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
		
		
		public function getItemById(id:uint):MapsStaticTableItem
		{
			var i:int;
			i = _items.length;
			while(i--)
			{
				if(_items[i].id == id) return _items[i];
			}
			
			return null;
		}
		
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, maps:XMLList, mapList:XML, mapItem:MapsStaticTableItem, par2:String, waves:XML, waveItem:MapsStaticTableItemWave;
			var meshList:XMLList, rowArr:Array, i:int, rowV:Vector.<int>;
			var path:MapStaticTableItemPath;
			
			maps = xml.maps;
			
			for(par in maps.*)
			{
				mapList = maps.*[par];
				
				mapItem = new MapsStaticTableItem();
				mapItem.id = uint( mapList.@id );
				mapItem.image = String( mapList.@image );
				mapItem.life = Number( mapList.@life );
				
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
				
				meshList = mapList.waves;
				
				for(par2 in meshList.*)
				{
					waves = meshList.*[par2];
					
					waveItem = new MapsStaticTableItemWave();
					waveItem.id = uint( waves.@id );
					waveItem.quantity = uint( waves.@quantity );
					waveItem.startTime = Number( waves.@startTime );
					waveItem.time = Number( waves.@time );
					
					waveItem.mobId = uint( waves.mob.@id );
					waveItem.path = uint( waves.mob.@path);
					
					mapItem.waves.push( waveItem );
				}
				
				meshList = mapList.paths;
				
				for(par2 in meshList.*)
				{
					waves = meshList.*[par2];
					
					path = new MapStaticTableItemPath();
					path.id = uint( waves.@id );
					path.points = convertPoint( String( waves.*[par] ) )
					mapItem.paths.push( path );
				}
				
				_items.push( mapItem );
			}
		}
		
		
		private function convertPoint(value:String):Vector.<uint>
		{
			var v:Vector.<uint>;
			var arr:Array = value.split(",");
			
			v = new Vector.<uint>(arr.length, true);
			
			var i:int;
			for(i = 0; i < arr.length; i++) v[i] = uint(arr[i]);
			return v;
		}
		
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}