package game.core.session.tables
{
	import game.core.data.tables.WorldsStaticTableItem;
	import game.interfaces.data.IWorldData;
	import game.interfaces.data.IWorldPointData;
	
	public class StaticWorldData implements IWorldData
	{
		private var _data:			WorldsStaticTableItem;
		
		private var _point:			Vector.<IWorldPointData>;
		private var _isLocked:		Boolean;
		
		public function StaticWorldData()
		{
			_point = new Vector.<IWorldPointData>;
			_isLocked = false;
		}
		
		
		public function setStaticData(data:WorldsStaticTableItem):void
		{
			_data = data;
			
			var i:int, point:StaticWorldPointData;
			for(i = 0; i < _data.points.length; i++)
			{
				point = new StaticWorldPointData();
				point.setStaticData( _data.points[i] );
				_point.push( point );
			}
			
		}
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get image():String
		{
			return _data.image;
		}
		
		public function get description():String
		{
			return _data.description;
		}
		
		public function get title():String
		{
			return _data.title;
		}
		
		
		public function get isLocked():Boolean
		{
			return _isLocked;
		}
		
		
		public function getPoints():Vector.<IWorldPointData>
		{
			return _point;
		}
	}
}