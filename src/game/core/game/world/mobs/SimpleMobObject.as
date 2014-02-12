package game.core.game.world.mobs
{
	import game.core.data.tables.MobsStaticTableItem;
	import game.core.game.data.path.PathData;
	import game.core.game.data.path.PathPoint;
	import game.core.game.world.EnvironmentDataConstants;
	import game.core.game.world.EnvironmentObject;
	
	public class SimpleMobObject extends EnvironmentObject
	{
		
		private var _staticData:		MobsStaticTableItem;
		private var _path:				PathData;
		private var _currentPointIndex:	uint;
		private var _nextPoint:			PathPoint;
		private var _currentPoint:		PathPoint;
		
		public var speed:				Number = 200;
		
		public var vx:					Number;
		public var vy:					Number;
		
		public function SimpleMobObject()
		{
			super();
		}
		
		
		public function init():void
		{
			_currentPointIndex = 0;
			
			this.x = _path.path[0].x;
			this.y = _path.path[0].y;
			
			vx = 0;
			vy = 0;
			
			calculateVelocity();
			
			
		}
		
		public function setData(data:MobsStaticTableItem):void
		{
			_staticData = data;
		}
		
		public function getStaticData():MobsStaticTableItem
		{
			return _staticData;
		}
		
		
		public function setPath(path:PathData):void
		{
			_path = path;
		}
		
		
		override public function isMovable():uint
		{
			return EnvironmentDataConstants.MOVABLE_MOB;
		}
		
		
		override public function move(ms:Number):void
		{
			x += vx * ms;
			y += vy * ms;
			
			if(x == _nextPoint.x && y == _nextPoint.y)
			{
				_currentPointIndex ++;
				calculateVelocity();
			}
		}
		
		
		override public function update(ms:Number):void
		{
			
		}
		
		
		
		private function calculateVelocity():void
		{
			if(_currentPointIndex  + 1 < _path.path.length)
			{
				_nextPoint = _path.path[_currentPointIndex + 1];
				_currentPoint = _path.path[_currentPointIndex];
				
				var dx:Number = _nextPoint.x - _currentPoint.x;
				var dy:Number = _nextPoint.y - _currentPoint.y;
				
				var l:Number = Math.sqrt( dx*dx + dy*dy );
				
				var totalTime:Number = l * speed;
				
				vx = dx/totalTime;
				vy = dy/totalTime;
			}
		}
	}
}