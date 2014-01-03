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
			var data:Object = new Object();
			
			try
			{
				data = JSON.parse(str);
				
				parseWorldData(data);
			}
			catch(e:Error)
			{
				trace(e);
				return;
			}		
			
			this.sendMessage( StaticDataManagerCommands.EVENT_PARSING_COMPLETE);
		}		
		
		private function parseWorldData(data:Object):void
		{
			var world:Object = data.world;
			var pointsData:Object;
			
			var par:String, mapData:StaticMapData, pointData:StaticMapPointData, par2:String;
			
			for(par in world)
			{
				if( world[par])
				{
					mapData = new StaticMapData();
					mapData.id 			= uint(world[par].id);
					mapData.image 		= String(world[par].image);
					
					mapData.title 		= String( world[par].title);
					mapData.description = String( world[par].desciption);
					
					pointsData = world[par].points;
					
					for(par2 in pointsData)
					{
						pointData = new StaticMapPointData();
						pointData.x 	= int(pointsData[par2].x);
						pointData.y 	= int(pointsData[par2].y);
						pointData.id 	= uint(pointsData[par2].id);
						pointData.mapId = uint(pointsData[par2].map);
						pointData.title = String(pointsData[par2].title);
						pointData.stars = int(pointsData[par2].stars);
						
						mapData.points.push( pointData );
					}
					
					_maps.push( mapData );
				}
			}
			
			var towers:Object = data.towers;
			var towerData:StaticTowerData;
			
			for(par in towers)
			{
				if( towers[par])
				{
					towerData = new StaticTowerData();
					towerData.id 			= uint(  towers[par].id );
					towerData.damage 		= Number( towers[par].damage );
					towerData.speed 		= Number( towers[par].speed );
					towerData.range 		= Number( towers[par].range );
					towerData.aoe 			= String( towers[par].aoe );
					towerData.level 		= uint(   towers[par].level );
					towerData.type 			= String( towers[par].type );
					
					towerData.skin 			= String( towers[par].skin );
					towerData.title 		= String( towers[par].title );
					towerData.description 	= String( towers[par].description );
					
					_towers.push( towerData );
				}
			}
			
			var mobs:Object = data.mobs;
			var mobData:StaticMobData;
			
			for(par in mobs)
			{
				if( mobs[par] )
				{
					mobData = new StaticMobData();
					
					mobData.id 				= uint(   mobs[par].id );
					mobData.level 			= int( 	  mobs[par].level );
					mobData.hp 				= int(	  mobs[par].hp );
					mobData.armor 			= String( mobs[par].armor );
					mobData.vulnerability 	= String( mobs[par].vulnerability );
					mobData.ability 		= String( mobs[par].ability );
					mobData.bounty 			= Number( mobs[par].bounty );
					
					mobData.skin 			= String( mobs[par].skin );
					mobData.title 			= String( mobs[par].title );
					mobData.description 	= String( mobs[par].description );
					
					
					_mobs.push( mobData );
				}
			}
			
			var games:Object = data.game;
			var waves:Object, towersList:Object, mobsList:Object = new Object();
			var gameData:StaticGameData, waveData:StaticWaveData;
			var waveModeData:Vector.<int>;
			
			for(par in games)
			{
				if( games[par])
				{
					gameData = new StaticGameData();
					gameData.id 		= uint(   games[par].id );
					gameData.balance 	= Number( games[par].balance );
					gameData.image 		= String( games[par].image );
					gameData.life	 	= uint(   games[par].life );
					gameData.wave 		= uint(   games[par].wave );
					
					for (par2 in games[par].map) 
					{
						var row:Vector.<int> = new Vector.<int>;
						
						for(var par3:String in games[par].map[par2])
						{
							row.push(games[par].map[par2][par3])
						}
						gameData.map.push(row);
					}					
										
					waves =  games[par].waves;
					
					for(par2 in waves)
					{
						waveData = new StaticWaveData();
						waveData.id 		= uint( waves[par2].id );
						waveData.quantity 	= uint( waves[par2].quantity );
						waveData.time 		= uint( waves[par2].time );
						waveData.startTime 	= uint( waves[par2].startTime );
						
						mobsList = waves[par2].mobs;
						
						waveModeData = new Vector.<int>;
						waveModeData.push(mobsList.id);
						
						waveData.mob = waveModeData;
						
						gameData.waves.push( waveData );	
					}
					
					towersList = games[par].towers;
					
					for(par2 in towersList)
					{
						gameData.towers.push( uint(par2));
					}
					
					_games.push( gameData );
				}
			}
		}
	}
}