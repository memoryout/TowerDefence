package game.core.session.tables
{
	import game.core.data.tables.MobsStaticTableItem;
	import game.interfaces.data.IMobData;
	
	public class StaticMobData implements IMobData
	{
		private var _data:				MobsStaticTableItem;
		
		public function StaticMobData()
		{
			
		}
		
		
		public function setStaticData(data:MobsStaticTableItem):void
		{
			_data = data;
		}
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get level():int
		{
			return _data.level;
		}
		
		public function get hp():int
		{
			return _data.hp;
		}
		
		public function get armor():String
		{
			return _data.armor;
		}
		
		public function get vulnerability():String
		{
			return _data.vulnerability;
		}
		
		public function get ability():String
		{
			return _data.ability;
		}
		
		public function get bounty():Number
		{
			return _data.bounty;
		}
		
		public function get skin():String
		{
			return _data.skin;
		}
		
		public function get title():String
		{
			return _data.title;
		}
		
		public function get description():String
		{
			return _data.description;
		}
	}
}