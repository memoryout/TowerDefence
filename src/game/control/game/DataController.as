package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.core.data.StaticDataManagerCommands;
	import game.core.data.StaticMapData;
	import game.core.data.StaticMobData;
	import game.core.data.StaticTowerData;
	import game.core.session.GameMapData;
	import game.core.session.GameSession;
	import game.core.session.MobData;
	import game.core.session.TowerData;
	import game.core.session.WorldGlobalData;
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IMobData;
	import game.interfaces.ITowerData;
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
			
			
			
			
			var staticTowersData:Vector.<StaticTowerData>;
			var towerData:TowerData;
			var sessionTowerData:Vector.<ITowerData>;
			
			messageData = this.sendMessage( StaticDataManagerCommands.GET_TOWERS_DATA );
			staticTowersData = messageData.data;
			sessionTowerData = _session.towersData;
			
			for(i = 0; i < staticTowersData.length; i++)
			{
				towerData = new TowerData();
				towerData.setStaticData( staticTowersData[i] );
				
				sessionTowerData.push( towerData );
			}
			
			
			
			var staticMobsData:Vector.<StaticMobData>;
			var mobData:MobData;
			var sessionMobsData:Vector.<IMobData>;
			
			messageData = this.sendMessage( StaticDataManagerCommands.GET_MOBS_DATA );
			staticMobsData = messageData.data;
			sessionMobsData = _session.mobsData;
			
			for(i = 0; i < staticMobsData.length; i++)
			{
				mobData = new MobData();
				mobData.setStaticData( staticMobsData[i] );
				sessionMobsData.push( mobData );
			}
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_GLOBAL_MAP_DATA );
			this.addMessageListener( GameCommands.GET_MAP_DATA );
			this.addMessageListener( GameCommands.GET_USER_INFO );
			this.addMessageListener( GameCommands.GET_MOBS_DATA );
			this.addMessageListener( GameCommands.GET_TOWERS_DATA );
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
					
				case GameCommands.GET_MOBS_DATA:
				{
					message.data = _session.mobsData;
					break;
				}
					
				case GameCommands.GET_TOWERS_DATA:
				{
					message.data = _session.towersData;
					break;
				}
			}
		}
	}
}