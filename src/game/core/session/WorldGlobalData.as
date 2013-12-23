package game.core.session
{
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IMapData;
	
	public class WorldGlobalData implements IGlobalMapData
	{
		private var _maps:				Vector.<GameMapData>;
		private var _IMaps:				Vector.<IMapData>;
		
		public function WorldGlobalData()
		{
			_maps = new Vector.<GameMapData>;
			_IMaps = new Vector.<IMapData>;
		}
		
		
		public function addMap(mapData:GameMapData):void
		{
			_maps.push( mapData );
			_IMaps.push( mapData )
		}
		
		public function getMaps():Vector.<IMapData>
		{
			return _IMaps;
		}
	}
}