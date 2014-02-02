package game.core.game.world
{
	public class Environment
	{
		private const _movable1:			MoveObjectUpdater = new MoveObjectUpdater();
		private const _movable2:			MoveObjectUpdater = new MoveObjectUpdater();
		
		private const _create:				CreateObjectUpdater = new CreateObjectUpdater();
		
		private const _update:				Vector.<EnvironmentObject> = new Vector.<EnvironmentObject>;
		
		public function Environment()
		{
			
		}
		
		
		public function addObject(object:EnvironmentObject):void
		{
			if(object.isMovable() == EnvironmentDataConstants.MOVABLE_MOB) _movable1.push( object );
			if(object.isMovable() == EnvironmentDataConstants.MOVABLE_BULLET) _movable2.push( object );
			
			if( object.isCanCreate() ) _create.push( object );
		}
		
		
		public function removeObject(id:uint):void
		{
			
		}
		
		
		public function update(ms:Number):void
		{
			_create.update(ms);
			
			_movable1.update(ms);
			_movable2.update(ms);
		}
	}
}