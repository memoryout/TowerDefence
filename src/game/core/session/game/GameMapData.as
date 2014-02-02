package game.core.session.game
{
	import game.interfaces.data.IMapData;
	import game.interfaces.data.game.IGameMapData;

	public class GameMapData implements IGameMapData
	{
		private var _staticMapData:				IMapData;
		
		public function GameMapData()
		{
			
		}
		
		
		public function setStaticMapData():void
		{
			//_staticMapData = mapData;
		}
		
		
		public function setPath():void
		{
			
		}
		
		
		public function get staticMapData():IMapData
		{
			return _staticMapData
		}
	}
}