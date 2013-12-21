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
			return _maps as Vector.<IMapData>;
		}
	}
}