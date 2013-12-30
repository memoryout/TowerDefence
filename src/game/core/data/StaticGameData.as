package game.core.data
{
	public class StaticGameData
	{
		public var map:					Vector.<Vector.<int>> = new Vector.<Vector.<int>>;
		public var towers:				Vector.<uint> = new Vector.<uint>;
		public var waves:				Vector.<StaticWaveData> = new Vector.<StaticWaveData>;
		
		public var id:					uint;
		public var balance:				Number;
		public var image:				String;
		
		public function StaticGameData()
		{
		}
	}
}