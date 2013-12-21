package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.core.data.StaticDataManagerCommands;
	import game.core.data.StaticMapData;
	import game.core.session.GameMapData;
	import game.core.session.GameSession;
	import game.core.session.WorldGlobalData;
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IUserInfo;
	
	public class DataController extends BroadcastModule
	{
		private var _session:				GameSession;
		
		public function DataController()
		{
			super();
			
			initListener();
		}
		
		
		public function initDefaultUser():void
		{
			
		}
		
		
		
		public function initSessionData():void
		{
			_session = GameSession.get();
			
			var staticMapData:Vector.<StaticMapData>;
			var messageData:MessageData;
			var globalMapData:WorldGlobalData;
			
			messageData = this.sendMessage( StaticDataManagerCommands.GET_ALL_MAPS_DATA );
			staticMapData = messageData.data;
			
			globalMapData = _session.worldData;
			
			var i:int, sessionMapData:GameMapData;
			for(i = 0; i < staticMapData.length; i++)
			{
				sessionMapData = new GameMapData();
				sessionMapData.setStaticData( staticMapData[i] );
				globalMapData.addMap( sessionMapData );
			}
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_GLOBAL_MAP_DATA );
			this.addMessageListener( GameCommands.GET_MAP_DATA );
			this.addMessageListener( GameCommands.GET_USER_INFO );
		}
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case GameCommands.GET_GLOBAL_MAP_DATA:
				{
					message.data = _session.worldData as IGlobalMapData;
					break;
				}
					
				case GameCommands.GET_USER_INFO:
				{
					message.data = _session.userInfo as IUserInfo;
					break;
				}
			}
		}
	}
}