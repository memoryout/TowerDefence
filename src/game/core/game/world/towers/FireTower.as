package game.core.game.world.towers
{
	import game.core.game.world.EnvironmentDataConstants;
	import game.core.game.world.EnvironmentObject;
	
	public class FireTower extends EnvironmentObject
	{
		private var _creationPeriod:			uint = 5;
		private var _currentTime:			uint;
		
		public function FireTower()
		{
			super();
			_currentTime = 0;
		}
		
		
		override public function isMovable():uint
		{
			return EnvironmentDataConstants.MOVABLE_NOT;
		}
		
		override public function isCanCreate():Boolean
		{
			return true;
		}
		
		
		override public function create(ms:Number):void
		{
			_currentTime += ms;
			
			if(_currentTime >= _creationPeriod)
			{
				captureTarget();
				createBullets();
				
				_currentTime = 0;
			}
			
			
		}
		
		
		private function captureTarget():void
		{
			
		}
		
		private function createBullets():void
		{
			var createAmount:uint = uint( _currentTime / _creationPeriod );
			
			var i:int, time:uint;
			for(i = 0; i < createAmount; i++)
			{
				trace("createButtle", i, time);
				
				time += _creationPeriod;
			}
		}
		
		override public function update(ms:Number):void
		{
			
		}
	}
}