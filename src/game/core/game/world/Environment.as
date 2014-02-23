package game.core.game.world
{
	import game.core.game.data.notifications.NotificationData;
	import game.core.game.data.notifications.NotificationType;
	import game.core.game.data.path.PathData;
	import game.core.game.objects.mob.SimpleMobObject;
	import game.core.game.world.towers.SimpleTower;
	import game.core.game.world.updaters.MobListUpdater;

	public class Environment
	{
		private const _mobList:				MobListUpdater = new MobListUpdater();
		private const _movable2:			MoveObjectUpdater = new MoveObjectUpdater();
		
		private const _create:				CreateObjectUpdater = new CreateObjectUpdater();
		
		private const _update:				Vector.<EnvironmentObject> = new Vector.<EnvironmentObject>;
		
		private const _notificationList:	Vector.<NotificationData> = new Vector.<NotificationData>;
		
		public function Environment()
		{
			
		}
		
		
		public function pushPath(path:PathData):void
		{
			
		}
		
		public function pushMob(mob:SimpleMobObject):void
		{
			_mobList.pushMob( mob );
			
			var notification:NotificationData = new NotificationData();
			notification.type = NotificationType.CREATE_MOB;
			notification.data = mob;
			pushNotification( notification );
			
			
			mob.addToEnvironment( this );
		}
		
		public function pushTower(tower:SimpleTower):void
		{
			
		}
		
		public function pushBullet():void
		{
			
		}
		
		
		public function getPath(id:uint):PathData
		{
			return null;
		}
		
		public function getMob(id:uint):SimpleMobObject
		{
			return null;
		}
		
		public function getTower(id:uint):SimpleTower
		{
			return null;
		}
		
		
		public function getBullet():void
		{
			
		}
		
		
		public function getMobList():Vector.<SimpleMobObject>
		{
			return _mobList.getMobList();
		}
		
		
		public function pushNotification(data:NotificationData):void
		{
			_notificationList.push( data );
		}
		
		
		public function getNotificationList():Vector.<NotificationData>
		{
			return _notificationList;
		}
		
		
		public function addObject(object:EnvironmentObject):void
		{
			if(object.isMovable() == EnvironmentDataConstants.MOVABLE_BULLET) _movable2.push( object );
			
			if( object.isCanCreate() ) _create.push( object );
		}
		
		
		public function removeObject(id:uint):void
		{
			
		}
		
		
		public function update(ms:Number):void
		{
			_create.update(ms);
			
			_mobList.update(ms);
			_movable2.update(ms);
		}
	}
}