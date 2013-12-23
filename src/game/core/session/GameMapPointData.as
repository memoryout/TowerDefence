package game.core.session
{
	import game.core.data.StaticMapPointData;
	import game.interfaces.IMapPoint;
	
	public class GameMapPointData implements IMapPoint
	{
		private var _pointData:				StaticMapPointData;
		
		public function GameMapPointData()
		{
			
		}
		
		
		public function setStaticData(pointData:StaticMapPointData):void
		{
			_pointData = pointData;
		}
		
		public function get x():int
		{
			return _pointData.x;
		}
		
		public function get y():int
		{
			return _pointData.y;
		}
		
		public function get id():uint
		{
			return _pointData.id;
		}
		
		public function get title():String
		{
			return _pointData.title;
		}
		
		public function get mapId():uint
		{
			return _pointData.mapId;
		}
		
		public function get stars():uint
		{
			return 0;
		}
	}
}