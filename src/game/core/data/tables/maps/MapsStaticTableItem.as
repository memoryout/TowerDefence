package game.core.data.tables.maps
{
	public class MapsStaticTableItem
	{
		public var id:				uint;
		public var mesh:			Vector.<Vector.<int>> = new Vector.<Vector.<int>>;
		
		public var towers:			Vector.<uint> = new Vector.<uint>;
		public var waves:			Vector.<MapsStaticTableItemWave> = new Vector.<MapsStaticTableItemWave>;
		
		public var image:			String;
		public var life:			Number;
		
		public function MapsStaticTableItem()
		{
		}
	}
}