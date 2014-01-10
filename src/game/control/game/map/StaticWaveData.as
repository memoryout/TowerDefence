package game.control.game.map
{
	import game.core.data.tables.maps.MapsStaticTableItemWave;
	import game.interfaces.data.IWaveData;
	
	public class StaticWaveData implements IWaveData
	{
		
		private var _data:			MapsStaticTableItemWave;
		
		public function StaticWaveData()
		{
			
		}
		
		
		public function setStaticData(data:MapsStaticTableItemWave):void
		{
			_data = data;
		}
		
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get startTime():Number
		{
			return _data.startTime;
		}
		
		public function get time():Number
		{
			return _data.time;
		}
		
		public function get quantity():uint
		{
			return _data.quantity;
		}
		
		public function get mobId():uint
		{
			return _data.mobId;
		}
	}
}