package game.core.game.data
{
	import game.core.game.data.notifications.NotificationData;
	import game.core.game.data.notifications.NotificationType;
	import game.core.game.world.mobs.SimpleMobObject;

	public class ActiveGameStateData
	{
		public var mobsList:			Vector.<SimpleMobObject>;
		
		public var coreTime:			uint;
		public var coreFrame:			uint;
		
		public var currentFrameTime:	uint;
		public var viewTime:			uint;
		
		public const notifications:		Vector.<NotificationData> = new Vector.<NotificationData>;
		
		public function ActiveGameStateData()
		{
			
		}
		
		
		public function startNewGame():void
		{
			mobsList = new Vector.<SimpleMobObject>;
			notifications.length = 0;
			
			coreTime = 0;
			coreFrame = 0;
			viewTime = 0;
		}
		
		
		public function flushNotifications():void
		{
			notifications.length = 0;
		}
		
		
		public function addMob(mob:SimpleMobObject):void
		{
			mobsList.push(mob);
			
			var notification:NotificationData = new NotificationData();
			notification.type = NotificationType.CREATE_MOB;
			notification.data = mob;
			
			notifications.push(notification);
		}
	}
}