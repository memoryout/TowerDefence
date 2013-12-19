package game.core.data
{
	import game.interfaces.IMapPoint;
	
	public class MapPoint implements IMapPoint
	{
		private var _x:			int;
		private var _y:			int;
		
		private var _id:		uint;
		private var _title:		String;
		private var _mapId:		uint;
		
		
		public function MapPoint()
		{
			
		}
		
		public function setX(value:int):void
		{
			_x = value;
		}
		
		public function setY(value:int):void
		{
			_y = value;
		}
		
		public function setId(value:uint):void
		{
			_id = value;
		}
		
		public function setTitle(value:String):void
		{
			_title = value;
		}
		
		public function setMapId(value:uint):void
		{
			_mapId = value;
		}
		
		
		public function get x():int
		{
			return _x;
		}
		
		public function get y():int
		{
			return _y;
		}
		
		public function get id():uint
		{
			return _id;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function get mapId():uint
		{
			return _mapId;
		}
	}
}