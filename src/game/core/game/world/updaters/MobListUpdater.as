package game.core.game.world.updaters
{
	import game.core.game.objects.mob.SimpleMobObject;

	public class MobListUpdater
	{
		public static const _mobList:			Vector.<SimpleMobObject> = new Vector.<SimpleMobObject>;
		
		private var _l:	uint;
		private var _i:	uint;
		
		public function MobListUpdater()
		{
			
		}
		
		
		public function pushMob(mob:SimpleMobObject):void
		{
			_mobList.push( mob );
			_l = _mobList.length;
		}
		
		public function getMobList():Vector.<SimpleMobObject>
		{
			return _mobList;
		}
		
		public function update(ms:Number):void
		{
			for(_i = 0; _i < _l; _i++)
			{
				_mobList[_i].move(ms);
			}
		}
	}
}