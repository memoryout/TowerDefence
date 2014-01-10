package game.core.session.tables
{
	import game.core.data.tables.WorldsStaticTableItemPoint;
	import game.interfaces.data.IWorldPointData;
	
	public class StaticWorldPointData implements IWorldPointData
	{
		private var _data:			WorldsStaticTableItemPoint;
		
		public function StaticWorldPointData()
		{
			
		}
		
		public function setStaticData(data:WorldsStaticTableItemPoint):void
		{
			_data = data;
		}
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get x():Number
		{
			return _data.x;
		}
		
		public function get y():Number
		{
			return _data.y;
		}
		
		public function get mapId():uint
		{
			return _data.mapId;
		}
		
		public function get stars():Number
		{
			return _data.stars;
		}
		
		public function get title():String
		{
			return _data.title;
		}
	}
}