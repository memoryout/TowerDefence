package game.core.game.world
{
	import game.core.game.objects.mob.SimpleMobObject;

	public class MoveObjectUpdater
	{
		public static var UPDATE_PERIOD:			uint = 32;
		
		private var _lastUpdateValue:			uint = 0;
		
		private const _objects:					Vector.<EnvironmentObject> = new Vector.<EnvironmentObject>;
		private const _mobs:					Vector.<SimpleMobObject> = new Vector.<SimpleMobObject>;
		private var _l:							uint;
		private var _i:							uint;
		
		public function MoveObjectUpdater()
		{
			_l = 0;
			_i = 0;
			_lastUpdateValue = 0;
		}
		
		
		public function push(object:EnvironmentObject):void
		{
			_objects.push(object);
			_l = _objects.length;
			
			_mobs.push( _objects );
		}
		
		
		public function getObjectList():Vector.<SimpleMobObject>
		{
			return _mobs;
		}
		
		
		public function removeObject(id:uint):void
		{
			
		}
		
		public function update(ms:Number):void
		{
			for(_i = 0; _i < _l; _i++)
			{
				_objects[_i].move(ms);
			}
		}
	}
}