package game.core.data.tables
{
	import game.core.data.tables.IStaticTable;
	
	public class TowersStaticTable implements IStaticTable
	{
		private const _items:			Vector.<TowersStaticTableItem> = new Vector.<TowersStaticTableItem>;
		
		public function TowersStaticTable()
		{
			
		}
		
		public function parse(value:String, type:String):void
		{
			if(type == "xml") parseXMLData(value);
			else parseJSONData(value);
		}
		
		
		public function getItems():Vector.<TowersStaticTableItem>
		{
			return _items;
		}
		
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, towers:XMLList, towerList:XML, towerItem:TowersStaticTableItem;
			
			towers = xml.towers;
			
			for(par in towers.*)
			{
				towerList = towers.*[par];
				
				towerItem = new TowersStaticTableItem();
				towerItem.id = uint( towerList.@id );
				towerItem.aoe = String( towerList.@aoe );
				towerItem.cost = Number( towerList.@cost );
				towerItem.damage = Number( towerList.@damage );
				towerItem.description = String( towerList.description );
				towerItem.level = uint( towerList.@level );
				towerItem.range = Number( towerList.@range );
				towerItem.skill = String( towerList.@skill );
				towerItem.skin = String( towerList.@skin );
				towerItem.speed = Number( towerList.@speed );
				towerItem.title = String( towerList.title );
				towerItem.type = String( towerList.@type );
				
				_items.push(towerItem);
			}
		}
		
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}