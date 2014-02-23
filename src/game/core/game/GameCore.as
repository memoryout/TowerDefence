package game.core.game
{
	import game.core.data.tables.maps.MapsStaticTableItemWave;
	import game.core.game.data.ActiveGameStateData;
	import game.core.game.data.InitGameData;
	import game.core.game.world.Environment;
	import game.core.game.world.EnvironmentObject;
	
	import utils.updater.Updater;

	public class GameCore
	{
		private const _environment:			Environment = new Environment();
		
		private var _activeGameData:		ActiveGameStateData;
		private var _initGameData:			InitGameData;
		
		private var _waveManager:			WaveManager;
		
		private var _currentGameTime:		uint;
		private var _lastUpdateTime:		uint;
		
		
		public function GameCore()
		{
			_waveManager = new WaveManager();
			
		}
		
		public function loadGame(initGameData:InitGameData):void
		{
			_initGameData = initGameData;
			_activeGameData = new ActiveGameStateData();
			
			_waveManager.setEnvironment( _environment );
			_waveManager.setGameData( _initGameData );
			_waveManager.setGameStatusObject( _activeGameData );
			
			_activeGameData.setEnvironment( _environment );
		}
		
		
		public function startGame():void
		{
			_currentGameTime = 0;
			
			_activeGameData.startNewGame();
			_waveManager.startGame();
			
			
			
			updateTotalGameState();
			//shiftTime(GameCoreConstants.UPDATE_PERIOD);
			//shiftTime(2000);
			//updateTotalGameState();
			
			startTimer();
		}
		
		public function get gameStateObject():ActiveGameStateData
		{
			return _activeGameData;
		}
		
		
		
		
		public function addTower(tower:EnvironmentObject):void
		{
			_environment.addObject( tower );
		}
		
		
		
		
		
		
		private function updateTotalGameState():void
		{
			_waveManager.updateState( _currentGameTime );
		}
		
		
		private function shiftTime(ms:Number):void
		{
			_currentGameTime += ms;
		}
		
		
		
		
		private function stopTimer():void
		{
			Updater.get().removeListener( update );
		}
		
		
		private function startTimer():void
		{
			Updater.get().addListener( update );
		}
		
		
		private function update(ms:Number):void
		{
			_currentGameTime += ms * GameCoreConstants.TIME_MULTIPLIER;
			_lastUpdateTime += ms * GameCoreConstants.TIME_MULTIPLIER;
			
			_activeGameData.coreTime = _currentGameTime;
			_activeGameData.viewTime += ms * GameCoreConstants.TIME_MULTIPLIER;
			_activeGameData.currentFrameTime = ms;
			
			if(_lastUpdateTime >= GameCoreConstants.UPDATE_PERIOD)
			{
				_activeGameData.coreFrame ++;
				
				updateTotalGameState();
				
				var c:uint = uint( _lastUpdateTime/GameCoreConstants.UPDATE_PERIOD ) + 1;
				_lastUpdateTime = _lastUpdateTime - c * GameCoreConstants.UPDATE_PERIOD;
			}
			
			_environment.update(ms);
		}
	}
}