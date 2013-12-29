package game.core.data
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	public class StaticDataManager extends BroadcastModule
	{
		private const _maps:			Vector.<StaticMapData> = new Vector.<StaticMapData>;
		
		private const _towers:			Vector.<StaticTowerData> = new Vector.<StaticTowerData>;
		private const _mobs:			Vector.<StaticMobData> = new Vector.<StaticMobData>;
		private const _games:			Vector.<StaticGameData> = new Vector.<StaticGameData>;
		
		public function StaticDataManager()
		{
			super();
			
			initListener();
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( StaticDataManagerCommands.PARSE_STATIC_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_ALL_MAPS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_MOBS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_TOWERS_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_GAMES_DATA );
		}
		
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case StaticDataManagerCommands.PARSE_STATIC_DATA:
				{
					parseData(message.data as String)
					break;
				}
					
				case StaticDataManagerCommands.GET_ALL_MAPS_DATA:
				{
					message.data = _maps;
					break;
				}
					
				case StaticDataManagerCommands.GET_MOBS_DATA:
				{
					message.data = _mobs;
					break;
				}
					
				case StaticDataManagerCommands.GET_TOWERS_DATA:
				{
					message.data = _towers;
					break;
				}
					
				case StaticDataManagerCommands.GET_GAMES_DATA:
				{
					message.data = _games;
					break;
				}
			}
		}
		
		
		
		private function parseData(str:String):void
		{
			var xml:XML;
			
			try
			{
				xml = new XML(str);
				
				parseWorldData(xml);
			}
			catch(e:Error)
			{
				trace(e);
				return;
			}
			
			
			
			
			this.sendMessage( StaticDataManagerCommands.EVENT_PARSING_COMPLETE);
		}
		
		
		
		private function parseWorldData(xml:XML):void
		{
			var world:XMLList = xml.world;
			var pointsXML:XMLList;
			
			var par:String, mapData:StaticMapData, pointData:StaticMapPointData, par2:String;
			for(par in world.*)
			{
				if( world.*[par].name() == "map" )
				{
					mapData = new StaticMapData();
					mapData.id = uint(world.*[par].@id);
					mapData.image = String(world.*[par].@image);
					
					mapData.title = String( world.*[par].title);
					mapData.description = String( world.*[par].desciption);
					
					pointsXML = world.*[par].points;
					
					for(par2 in pointsXML.*)
					{
						pointData = new StaticMapPointData();
						pointData.x = int(pointsXML.*[par2].@x);
						pointData.y = int(pointsXML.*[par2].@y);
						pointData.id = uint(pointsXML.*[par2].@id);
						pointData.mapId = uint(pointsXML.*[par2].@map);
						pointData.title = String(pointsXML.*[par2].@title);
						pointData.stars = int(pointsXML.*[par2].@stars);
						
						mapData.points.push( pointData );
					}
					
					_maps.push( mapData );
				}
			}
			
			var towers:XMLList = xml.towers;
			var towerData:StaticTowerData;
			
			for(par in towers.*)
			{
				if( towers.*[par].name() == "tower" )
				{
					towerData = new StaticTowerData();
					towerData.id = uint( towers.*[par].@id );
					towerData.damage = Number( towers.*[par].@damage );
					towerData.speed = Number( towers.*[par].@speed );
					towerData.range = Number( towers.*[par].@range );
					towerData.aoe = String( towers.*[par].@aoe );
					towerData.level = uint( towers.*[par].@level );
					towerData.type = String( towers.*[par].@type );
					
					towerData.skin = String( towers.*[par].skin );
					towerData.title = String( towers.*[par].title );
					towerData.description = String( towers.*[par].description );
					
					_towers.push( towerData );
				}
			}
			
			var mobs:XMLList = xml.mobs;
			var mobData:StaticMobData;
			
			for(par in mobs.*)
			{
				if( mobs.*[par].name() == "mob" )
				{
					mobData = new StaticMobData();
					
					mobData.id = uint( mobs.*[par].@id );
					mobData.level = int( mobs.*[par].@level );
					mobData.hp = int( mobs.*[par].@hp );
					mobData.armor = String( mobs.*[par].@armor );
					mobData.vulnerability = String( mobs.*[par].@vulnerability );
					mobData.ability = String( mobs.*[par].@ability );
					mobData.bounty = Number( mobs.*[par].@bounty );
					
					mobData.skin = String( mobs.*[par].skin );
					mobData.title = String( mobs.*[par].title );
					mobData.description = String( mobs.*[par].description );
					
					
					_mobs.push( mobData );
				}
			}
			
			var games:XMLList = xml.games;
			var waves:XMLList;
			var towersList:XMLList;
			var mobsList:XMLList;
			var gameData:StaticGameData, waveData:StaticWaveData;
			var waveModeData:StaticWaveMobData;
			
			for(par in games.*)
			{
				if( games.*[par].name() == "game" )
				{
					gameData = new StaticGameData();
					gameData.id = uint( games.*[par].@id );
					gameData.balance = Number( games.*[par].@balance );
					gameData.image = String( games.*[par].@image );
					
					waves =  games.*[par].waves;
					
					for(par2 in waves.*)
					{
						waveData = new StaticWaveData();
						waveData.id = uint( waves.*[par].@id );
						waveData.quantity = uint( waves.*[par].@quantity );
						waveData.time = uint( waves.*[par].@time );
						waveData.startTime = uint( waves.*[par].@startTime );
						
						mobsList = waves.*[par].mob;
						
						waveModeData = new StaticWaveMobData();
						waveModeData.id = mobsList.@id;
						
						waveData.mob = waveModeData;
						
						gameData.waves.push( waveData );	
					}
					
					towersList = games.*[par].towers;
					
					for(par2 in towersList.*)
					{
						gameData.towers.push( towersList.*[par2].@id );
					}
					
					_games.push( gameData );
				}
			}
		}
	}
}