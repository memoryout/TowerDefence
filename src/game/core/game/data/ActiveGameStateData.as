package game.core.game.data
{
	import game.core.game.data.notifications.NotificationData;
	import game.core.game.data.notifications.NotificationType;
	import game.core.game.objects.mob.SimpleMobObject;
	import game.core.game.world.Environment;

	public class ActiveGameStateData
	{
		public var coreTime:			uint;
		public var coreFrame:			uint;
		
		public var currentFrameTime:	uint;
		public var viewTime:			uint;
		
		private var _environment:		Environment;
		
		public function ActiveGameStateData()
		{
			
		}
		
		
		public function setEnvironment(environment:Environment):void
		{
			_environment = environment;
		}
		
		
		public function startNewGame():void
		{
			coreTime = 0;
			coreFrame = 0;
			viewTime = 0;
		}
		
		
		public function flushNotifications():void
		{
			_environment.getNotificationList().length = 0;
		}
		
		
		public function get notifications():Vector.<NotificationData>
		{
			return _environment.getNotificationList();
		}
		
		
		public function get mobsList():Vector.<SimpleMobObject>
		{
			return _environment.getMobList();
		}
	}
}