package game.core.data.tables
{
	public class MobsStaticTable implements IStaticTable
	{
		
		private const _items:			Vector.<MobsStaticTableItem> = new Vector.<MobsStaticTableItem>;
		
		public function MobsStaticTable()
		{
			
		}
		
		public function parse(value:String, type:String):void
		{
			if(type == "xml") parseXMLData(value);
			else parseJSONData(value);
		}
		
		
		public function getItems():Vector.<MobsStaticTableItem>
		{
			return _items;
		}
		
		
		private function parseXMLData(str:String):void
		{
			var xml:XML = new XML(str);
			
			var par:String, mobs:XMLList, mobsList:XML, mobItem:MobsStaticTableItem;
			
			mobs = xml.mobs;
			
			for(par in mobs.*)
			{
				mobsList = mobs.*[par];
				
				mobItem = new MobsStaticTableItem();
				mobItem.ability = String( mobsList.@ability );
				mobItem.armor = String( mobsList.@armor );
				mobItem.bounty = Number( mobsList.@bounty );
				mobItem.description = String( mobsList.description );
				mobItem.hp = Number( mobsList.@hp );
				mobItem.id = uint( mobsList.@id );
				mobItem.level = int( mobsList.@level );
				mobItem.skin = String( mobsList.@skin );
				mobItem.title = String( mobsList.title );
				mobItem.vulnerability = String( mobsList.@vulnerability );
				
				_items.push(mobItem);
			}
		}
		
		private function parseJSONData(str:String):void
		{
			
		}
	}
}