package game.core.game.data.wave
{
	import game.core.data.tables.MobsStaticTableItem;
	import game.core.data.tables.maps.MapsStaticTableItemWave;
	import game.core.game.data.path.PathData;

	public class WaveData
	{
		public var data:			MapsStaticTableItemWave;
				
		public var mobStaticData:	MobsStaticTableItem;
		
		public var path:			PathData;
		
		public function WaveData()
		{
			
		}
				
		
		public function get time():Number
		{
			return data.time;
		}
		
		public function get startTime():Number
		{
			return data.startTime;
		}
		
		public function get id():Number
		{
			return data.id;
		}
		
		public function get quantity():Number
		{
			return data.quantity;
		}
		
		public function get mobId():Number
		{
			return data.mobId;
		}
	}
}