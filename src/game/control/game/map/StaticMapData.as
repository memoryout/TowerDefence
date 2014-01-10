package game.control.game.map
{
	import game.core.data.tables.maps.MapsStaticTableItem;
	import game.interfaces.data.IMapData;
	import game.interfaces.data.IWaveData;
	
	public class StaticMapData implements IMapData
	{
		private var _data:			MapsStaticTableItem;
		
		private var _waves:			Vector.<IWaveData>;
		
		public function StaticMapData()
		{
			
		}
		
		public function setStaticData(data:MapsStaticTableItem):void
		{
			_data = data;
			_waves = new Vector.<IWaveData>;
			
			var i:int, waveItem:StaticWaveData;
			for(i = 0; i < _data.waves.length; i++)
			{
				waveItem = new StaticWaveData();
				waveItem.setStaticData( _data.waves[i] );
				_waves.push( waveItem );
			}
			
		}
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get mesh():Vector.<Vector.<int>>
		{
			return _data.mesh;
		}
		
		public function get towers():Vector.<uint>
		{
			return _data.towers;
		}
		
		public function get waves():IWaveData
		{
			return null;
		}
	}
}