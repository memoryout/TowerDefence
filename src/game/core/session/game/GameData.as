package game.core.session.game
{
	import game.core.data.StaticGameData;
	import game.interfaces.IGameData;
	import game.interfaces.IWaveData;
	
	public class GameData implements IGameData
	{
		private var _gameData:			StaticGameData;
		
		private var _waves:				Vector.<WaveData>;
		private var _IWaves:			Vector.<IWaveData>;
		
		public function GameData()
		{
			_waves  = new Vector.<WaveData>;
			_IWaves = new Vector.<IWaveData>;
		}
		
		public function setStaticData(data:StaticGameData):void
		{
			_gameData = data;
			
			var i:int, waveData:WaveData;
			for(i = 0; i < _gameData.waves.length; i++)
			{
				waveData = new WaveData();
				waveData.setStaticData( _gameData.waves[i] );
				
				_waves.push( waveData );
				_IWaves.push( waveData );
			}
		}
		
		public function get id():uint
		{
			return _gameData.id;
		}
		
		public function get balance():int
		{
			return _gameData.balance;
		}
		
		public function get image():String
		{
			return _gameData.image;
		}
		
		public function get waves():Vector.<IWaveData>
		{
			return _IWaves;
		}
		
		public function get towers():Vector.<uint>
		{
			return _gameData.towers;
		}
	}
}