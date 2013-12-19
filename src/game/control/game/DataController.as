package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.core.session.GameSession;
	import game.interfaces.IUserInfo;
	
	public class DataController extends BroadcastModule
	{
		public function DataController()
		{
			super();
			
			initListener();
		}
		
		
		public function initDefaultUser():void
		{
			
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_MAP_DATA );
			this.addMessageListener( GameCommands.GET_USER_INFO );
		}
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case GameCommands.GET_MAP_DATA:
				{
					
					break;
				}
					
				case GameCommands.GET_USER_INFO:
				{
					message.data = GameSession.get().userInfo as IUserInfo;
					break;
				}
			}
		}
	}
}