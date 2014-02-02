package game.core.game
{
	import game.core.data.tables.maps.MapsStaticTableItemWave;
	import game.core.game.data.InitGameData;
	import game.core.game.data.wave.WaveData;
	import game.core.game.world.Environment;
	import game.core.game.world.mobs.SimpleMobObject;

	public class WaveManager
	{
		private var _waves:					Vector.<WaveData>;
		private var _environment:			Environment;
		private var _lastUpdateTime:		uint;
		private var _currentTime:			uint;
		
		private var _currentWaveIndex:		uint;
		private var _currentWave:			WaveData;
		
		
		private var _waveMobsAmount:		uint;
		
		public function WaveManager()
		{
			
		}
		
		
		public function setGameData(data:InitGameData):void
		{
			_waves = data.wavesData;
		}
		
		
		public function setEnvironment(env:Environment):void
		{
			_environment = env;
		}
		
		
		public function startGame():void
		{
			_lastUpdateTime = 0;
			_currentWaveIndex = 0;
			_waveMobsAmount = 0;
			
			_currentWave = _waves[_currentWaveIndex];
		}
		
		
		private function createNextMob():void
		{
			if( (_lastUpdateTime + _currentWave.time <= _currentTime) && _waveMobsAmount < _currentWave.quantity)
			{
				_lastUpdateTime += _currentWave.time;
				
				var mob:SimpleMobObject = new SimpleMobObject();
				mob.creationTime = _lastUpdateTime;
				
				mob.setData( _currentWave.mobStaticData );
				mob.setPath( _currentWave.path );
				mob.init();
				
				_environment.addObject( mob );
				
				
				_waveMobsAmount ++;
				
				createNextMob();
			}
		}
		
		
		public function updateState(currentGameTime:uint):void
		{
			_currentTime = currentGameTime;			
			createNextMob();
		}
	}
}