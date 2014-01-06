package game.core.data.tables
{
	public class WorldsStaticTable implements IStaticTable
	{
		public function WorldsStaticTable()
		{
			
		}
		
		public function parse(value:String, type:String):void
		{
			if(type == "xml") parseXMLData(value);
			else parseJSONData(value);
		}
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, worldList:XML, worldItem:WorldsStaticTableItem;
			
			for(par in xml.*)
			{
				worldList = xml.*[par];
			}
		}
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}