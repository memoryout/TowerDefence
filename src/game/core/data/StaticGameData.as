package game.core.data
{
	public class StaticGameData
	{
		public const map:				Vector.<Vector.<int>> = new Vector.<Vector.<int>>;
		public const towers:			Vector.<uint> = new Vector.<uint>;
		public const waves:				Vector.<StaticWaveData> = new Vector.<StaticWaveData>;
		
		public var id:					uint;
		public var balance:				Number;
		public var image:				String;
		
		public function StaticGameData()
		{
		}
	}
}