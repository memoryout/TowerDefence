package game.core.game.world
{
	public class EnvironmentObject
	{
		private static var _objectsId:			uint = 0;
		
		
		private var _id:			uint;
		private var _creationTime:	uint;
		private var _x:				Number;
		private var _y:				Number;
		
		public function EnvironmentObject()
		{
			_id = _objectsId ++;
		}
		
		public function get envObjectID():uint
		{
			return _id;
		}
		
		
		public function set creationTime(value:uint):void
		{
			_creationTime = value;
		}
		
		
		public function get creationTime():uint	
		{
			return _creationTime;
		}
		
		
		public function isMovable():uint
		{
			return EnvironmentDataConstants.MOVABLE_NOT;
		}
		
		public function isCanCreate():Boolean
		{
			return false;
		}
		
		public function move(ms:Number):void
		{
			
		}
		
		
		public function update(ms:Number):void
		{
			
		}
		
		
		public function set x(value:Number):void
		{
			_x = value;
		}
		
		
		public function set y(value:Number):void
		{
			_y = value;
		}
		
		
		public function get x():Number
		{
			return _x;
		}
		
		
		public function get y():Number
		{
			return _y;
		}
	}
}