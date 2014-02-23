package game.core.game.objects.mob
{
	import game.core.data.tables.MobsStaticTableItem;
	import game.core.game.data.path.PathData;
	import game.core.game.data.path.PathPoint;
	import game.core.game.world.Environment;
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
		
		public var dirrection:			uint = MobDirrection.IDLE;
		
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
		
		
		override public function addToEnvironment(environment:Environment):void
		{
			super.addToEnvironment( environment );
			
			calculateVelocity();
		}
		
		
		override public function move(ms:Number):void
		{
			if(ms < 0 || _nextPoint == null) return;
			
			var newX:Number = x;
			var newY:Number = y;
			
			
			if(vx) newX += vx * ms;
			if(vy) newY += vy * ms;
			
			var delatValue:Number = 0;
			var deltaTime:Number = 0;
			
			if(dirrection == MobDirrection.RIGHT && newX >= _nextPoint.x)
			{
				delatValue = _nextPoint.x - x;
				deltaTime = delatValue/vx;
				
				x = _nextPoint.x;
				deltaTime = ms - deltaTime;
				
				if(deltaTime)
				{
					_currentPointIndex ++;
					calculateVelocity();
					move(deltaTime);
					return;
				}
				
			}
			else if(dirrection == MobDirrection.LEFT && newX <= _nextPoint.x)
			{
				delatValue = x - _nextPoint.x;
				deltaTime = delatValue/vx;
				
				x = _nextPoint.x;
				deltaTime = ms - deltaTime;
				
				if(deltaTime)
				{
					_currentPointIndex ++;
					calculateVelocity();
					move(deltaTime);
					return;
				}
			}
			else if(dirrection == MobDirrection.DOWN && newY >= _nextPoint.y)
			{
				delatValue = _nextPoint.y - y;
				deltaTime = delatValue/vy;
				
				y = _nextPoint.y;
				deltaTime = ms - deltaTime;
				
				if(deltaTime)
				{
					_currentPointIndex ++;
					calculateVelocity();
					move(deltaTime);
					return;
				}
			}
			else if(dirrection == MobDirrection.UP && newY <= _nextPoint.y)
			{
				delatValue = y - _nextPoint.y;
				deltaTime = delatValue/vy;
				
				y = _nextPoint.y;
				deltaTime = ms - deltaTime;
				
				if(deltaTime)
				{
					_currentPointIndex ++;
					calculateVelocity();
					move(deltaTime);
					return;
				}
			}
			
			
			
			x = newX;
			y = newY;
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
				 
				if(vx > 0) dirrection = MobDirrection.RIGHT;
				if(vx < 0) dirrection = MobDirrection.LEFT;
				
				if(vy > 0) dirrection = MobDirrection.DOWN;
				if(vy < 0) dirrection = MobDirrection.UP;
			}
			else
			{
				vx = 0;
				vy = 0;
			}
		}
	}
}