package game.core.game.world
{
	public class CreateObjectUpdater
	{
		public static const UPDATE_PERIOD:			uint = 30;
		
		private var _lastUpdateValue:			uint = 0;
		
		private const _objects:				Vector.<EnvironmentObject> = new Vector.<EnvironmentObject>;
		private var _i:						uint;
		private var _l:						uint;
		
		public function CreateObjectUpdater()
		{
			_i = 0;
			_l = 0;
			_lastUpdateValue = 0;
		}
		
		
		public function push(object:EnvironmentObject):void
		{
			_objects.push(object);
			_l = _objects.length;
		}
		
		
		public function removeObject(id:uint):void
		{
			
		}
		
		public function update(ms:Number):void
		{
			_lastUpdateValue += ms;
			
			if(_lastUpdateValue >= UPDATE_PERIOD)
			{
				for(_i = 0; _i < _l; _i++)
				{
					//_objects[_i].create(_lastUpdateValue);
				}
				
				_lastUpdateValue = 0;
			}
		}
	}
}