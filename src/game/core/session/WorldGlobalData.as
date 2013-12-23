package game.core.session
{
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IMapData;
	
	public class WorldGlobalData implements IGlobalMapData
	{
		private var _maps:				Vector.<GameMapData>;
		
		public function WorldGlobalData()
		{
			_maps = new Vector.<GameMapData>;
		}
		
		
		public function addMap(mapData:GameMapData):void
		{
			_maps.push( mapData );
		}
		
		public function getMaps():Vector.<IMapData>
		{
			var v:Vector.<IMapData> = new Vector.<IMapData>;
			var i:int;
			for(i = 0; i < _maps.length; i++)
			{
				v.push(_maps[i] as IMapData);
			}
			
			return v;
		}
	}
}