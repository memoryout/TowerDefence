package game.core.parser
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import flash.utils.Dictionary;
	
	import game.core.data.StaticDataManagerCommands;
	import game.core.data.tables.MobsStaticTableItem;
	import game.core.data.tables.maps.MapStaticTableItemPath;
	import game.core.data.tables.maps.MapsStaticTableItem;
	import game.core.data.tables.maps.MapsStaticTableItemWave;
	import game.core.game.data.InitGameData;
	import game.core.game.data.path.PathData;
	import game.core.game.data.path.PathPoint;
	import game.core.game.data.wave.WaveData;
	import game.core.session.GameSession;
	import game.core.session.game.GameMapData;
	import game.interfaces.data.IMapData;

	public class MapDataParser extends BroadcastModule
	{
		private static const _this:				MapDataParser = new MapDataParser();
		
		private var _mapStaticData:				MapsStaticTableItem;
		private var _initGameData:				InitGameData;
		
		private var _pathsCache:				Dictionary
		
		public function MapDataParser()
		{
			
		}
		
		
		public static function get():MapDataParser
		{
			return _this;
		}
		
		
		public function createInitGameDataObject(staticMapData:MapsStaticTableItem):InitGameData
		{
			_mapStaticData = staticMapData;
			
			_initGameData = new InitGameData();
			
			createPaths();
			createWaves();
			
			return _initGameData;
		}
		
		private function createPaths():void
		{
			var i:int, j:int;
			
			var mesh:Vector.<Vector.<int>> = _mapStaticData.mesh;
			
			var points:Dictionary = new Dictionary();
			var mapPoint:MapPathPoint;
			
			for(i = 0; i < mesh.length; i++)
			{
				for(j = 0; j < mesh[i].length; j++)
				{
					if(mesh[i][j] > 0)
					{
						if( mesh[i][j] == 1 )
						{
							// build free area
							continue;
						}
						
						if( mesh[i][j] == 2 )
						{
							// user main base.
							continue;
						}
						
						if( mesh[i][j] >= 5 )
						{
							trace("FindPoint")
							// path points
							mapPoint = new MapPathPoint();
							mapPoint.index = mesh[i][j];
							mapPoint.x = j;
							mapPoint.y = i;
							points[ mesh[i][j] ] = mapPoint;
							continue;
						}
					}
				}
			}
			
			_pathsCache = new Dictionary();
			
			
			var paths:Vector.<MapStaticTableItemPath> = _mapStaticData.paths;
			
			var gamePath:PathData;
			var gamePathPoint:PathPoint;
			
			for(i = 0; i < paths.length; i++)
			{
				gamePath = new PathData();
				gamePath.id = paths[i].id;
				
				for(j = 0; j < paths[i].points.length; j++)
				{
					mapPoint = points[paths[i].points[j]];
					
					if( mapPoint )
					{
						gamePathPoint = new PathPoint();
						gamePathPoint.x = mapPoint.x;
						gamePathPoint.y = mapPoint.y;
						gamePathPoint.index = mapPoint.index;
						
						gamePath.path.push( gamePathPoint );
					}
				}
				
				_pathsCache[gamePath.id] = gamePath;
				_initGameData.paths.push( gamePath );
			}
		}
		
		
		private function createWaves():void
		{
			var waves:Vector.<MapsStaticTableItemWave> = _mapStaticData.waves;
			
			var i:int, waveData:WaveData, messageData:MessageData;
			
			for(i = 0; i < waves.length; i++)
			{
				waveData = new WaveData();
				waveData.data = waves[i];
				
				waveData.path = _pathsCache[waves[i].path];
				
				messageData = this.sendMessage( StaticDataManagerCommands.GET_MOB_DATA_BY_ID, waves[i].id);
				if(messageData.data) waveData.mobStaticData = messageData.data as MobsStaticTableItem;
				
				_initGameData.wavesData.push(waveData);
			}
		}
	}
}