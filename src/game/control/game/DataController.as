package game.control.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.control.game.map.StaticMapData;
	import game.core.data.StaticDataManagerCommands;
	import game.core.data.tables.MobsStaticTableItem;
	import game.core.data.tables.TowersStaticTableItem;
	import game.core.data.tables.WorldsStaticTableItem;
	import game.core.data.tables.maps.MapsStaticTableItem;
	import game.core.session.GameMapData;
	import game.core.session.GameSession;
	import game.core.session.MobData;
	import game.core.session.TowerData;
	import game.core.session.WorldGlobalData;
	import game.core.session.game.GameData;
	import game.core.session.tables.StaticMobData;
	import game.core.session.tables.StaticTowerData;
	import game.core.session.tables.StaticWorldData;
	import game.interfaces.IUserInfo;
	import game.interfaces.data.IMobData;
	import game.interfaces.data.ITowerData;
	import game.interfaces.data.IWorldData;
	
	public class DataController extends BroadcastModule
	{
		private var _session:				GameSession;
		
		private var _mapData:				StaticMapData;
		
		public function DataController()
		{
			super();
			
			initListener();
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_SESSION_MOBS_DATA );
			this.addMessageListener( GameCommands.GET_SESSION_TOWERS_DATA );
			this.addMessageListener( GameCommands.GET_SESSION_WORLDS_DATA);
			this.addMessageListener( GameCommands.GET_STATIC_MAP_DATA);
			this.addMessageListener( GameCommands.GET_SESSION_TOWER_DATA_BY_ID);
			
			/*this.addMessageListener( GameCommands.GET_GLOBAL_MAP_DATA );
			this.addMessageListener( GameCommands.GET_MAP_DATA );
			this.addMessageListener( GameCommands.GET_USER_INFO );
			this.addMessageListener( GameCommands.GET_MOBS_DATA );
			this.addMessageListener( GameCommands.GET_TOWERS_DATA );
			this.addMessageListener( GameCommands.GET_GAME_DATA );
			this.addMessageListener( GameCommands.GET_GAMES_DATA );*/
		}
		
		public function initDefaultUserSession():void
		{
			_session = GameSession.get();
			
			initSessionWorldsData();
			initSessionTowersData();
			initSessionMobsData();
		}
		
		
		private function initSessionWorldsData():void
		{
			var message:MessageData = this.sendMessage( StaticDataManagerCommands.GET_WORLDS_DATA );
			var staticData:Vector.<WorldsStaticTableItem>, sessionWorldItem:StaticWorldData, sessionWorldVector:Vector.<IWorldData>;
			
			staticData = message.data as Vector.<WorldsStaticTableItem>;
			sessionWorldVector = _session.worldsData;
			
			var i:int;
			for(i = 0; i < staticData.length; i++)
			{
				sessionWorldItem = new StaticWorldData();
				sessionWorldItem.setStaticData( staticData[i] );
				sessionWorldVector.push( sessionWorldItem );
			}
		}
		
		
		private function initSessionTowersData():void
		{
			var message:MessageData = this.sendMessage( StaticDataManagerCommands.GET_TOWERS_DATA );
			var staticData:Vector.<TowersStaticTableItem>, sessionTowerData:StaticTowerData, sessionTowersVector:Vector.<ITowerData>;
			
			staticData = message.data as Vector.<TowersStaticTableItem>;
			sessionTowersVector = _session.towersData;
			
			var i:int;
			for(i = 0; i < staticData.length; i++)
			{
				sessionTowerData = new StaticTowerData();
				sessionTowerData.setStaticData( staticData[i] );
				sessionTowersVector.push( sessionTowerData );
			}
		}
		
		
		private function initSessionMobsData():void
		{
			var message:MessageData = this.sendMessage( StaticDataManagerCommands.GET_MOBS_DATA );
			var staticData:Vector.<MobsStaticTableItem>, sessionMobData:StaticMobData, sessionMobsVector:Vector.<IMobData>;
			
			staticData = message.data as Vector.<MobsStaticTableItem>;
			sessionMobsVector = _session.mobsData;
			
			var i:int;
			for(i = 0; i < staticData.length; i++)
			{
				sessionMobData = new StaticMobData();
				sessionMobData.setStaticData( staticData[i] );
				sessionMobsVector.push( sessionMobData );
			}
		}
		
		
		
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case GameCommands.GET_SESSION_WORLDS_DATA:
				{
					message.data = _session.worldsData;
					break;
				}
					
				case GameCommands.GET_SESSION_TOWERS_DATA:
				{
					message.data = _session.towersData;
					break;
				}
					
					
				case GameCommands.GET_SESSION_TOWER_DATA_BY_ID:
				{
					message.data = this.sendMessage( StaticDataManagerCommands.GET_TOWER_DATA_BY_ID, message.data );
					break;
				}
				
				
				case GameCommands.GET_SESSION_MOBS_DATA:
				{
					message.data = _session.mobsData;
					break;
				}
					
					
				case GameCommands.GET_STATIC_MAP_DATA:
				{
					message.data = getStaticMapData( uint( message.data) )
					break;
				}
				
				
					
					
				
				/*case GameCommands.GET_USER_INFO:
				{
					message.data = _session.userInfo as IUserInfo;
					break;
				}
					
				
					
				
					
				case GameCommands.GET_GAME_DATA:
				{
					message.data = _session.getGameData( uint(message.data) ) ;
					break;
				}
					
				case GameCommands.GET_GAMES_DATA:
				{
					message.data = _session.gamesData;
					break;
				}*/
			}
		}
		
		
		private function getStaticMapData(mapId:uint):StaticMapData
		{
			var message:MessageData = this.sendMessage( StaticDataManagerCommands.GET_MAP_DATA_BY_ID, mapId );
			
			var staticMapData:MapsStaticTableItem = message.data as MapsStaticTableItem;
			
			if(staticMapData)
			{
				if(!_mapData) _mapData = new StaticMapData();
				
				_mapData.setStaticData( staticMapData );
				return _mapData;
			}
			
			return null;
		}
	}
}