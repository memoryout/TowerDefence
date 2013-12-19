package game.core.session
{
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IMapData;
	
	public class WorldGlobalData implements IGlobalMapData
	{
		public function WorldGlobalData()
		{
		}
		
		public function getMaps():Vector.<IMapData>
		{
			return null;
		}
	}
}