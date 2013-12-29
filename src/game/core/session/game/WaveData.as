package game.core.session.game
{
	import game.core.data.StaticWaveData;
	import game.interfaces.IWaveData;
	import game.interfaces.IWaveMobData;
	
	public class WaveData implements IWaveData
	{
		private var _waveData:			StaticWaveData;
		
		private var mobData:			WaveMobData;
		
		public function WaveData()
		{
			
		}
		
		public function setStaticData(data:StaticWaveData):void
		{
			_waveData = data;
			
			if(mobData) mobData.clear();
			
			mobData.setStaticData( _waveData.mob );
		}
		
		public function get id():uint
		{
			return _waveData.id;
		}
		
		public function get quantity():int
		{
			return _waveData.quantity;
		}
		
		public function get time():Number
		{
			return _waveData.time;
		}
		
		public function get startTime():Number
		{
			return _waveData.startTime;
		}
		
		public function get mobData():IWaveMobData
		{
			return mobData;
		}
	}
}