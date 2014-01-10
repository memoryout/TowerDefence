package game.core.session.tables
{
	import game.core.data.tables.TowersStaticTableItem;
	import game.interfaces.data.ITowerData;
	
	public class StaticTowerData implements ITowerData
	{
		
		private var _data:			TowersStaticTableItem;
		
		public function StaticTowerData()
		{
			
		}
		
		
		public function setStaticData(data:TowersStaticTableItem):void
		{
			_data = data;
		}
		
		public function get id():uint
		{
			return _data.id;
		}
		
		public function get damage():Number
		{
			return _data.damage;
		}
		
		public function get speed():Number
		{
			return _data.speed;
		}
		
		public function get range():int
		{
			return _data.range;
		}
		
		public function get aoe():String
		{
			return _data.aoe;
		}
		
		public function get level():uint
		{
			return _data.level;
		}
		
		public function get type():String
		{
			return _data.type;
		}
		
		public function get cost():Number
		{
			return _data.cost;
		}
		
		public function get skill():String
		{
			return _data.skill;
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