package game.core.data.tables
{
	public class WorldsStaticTableItem
	{
		public var id:				uint;
		public var image:			String;
		public var description:		String;
		public var title:			String;
		
		public const points:		Vector.<WorldsStaticTableItemPoint> = new Vector.<WorldsStaticTableItemPoint>;
		

		public function WorldsStaticTableItem()
		{
		}
	}
}