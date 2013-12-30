package game.core.session.game
{
	import game.core.data.StaticWaveData;
	import game.interfaces.IWaveData;
	
	public class WaveData implements IWaveData
	{
		private var _waveData:			StaticWaveData;
		
		public function WaveData()
		{
			
		}
		
		public function setStaticData(data:StaticWaveData):void
		{
			_waveData = data;			
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
		
		public function get mobs():Vector.<int>
		{
			return _waveData.mob;
		}
	}
}