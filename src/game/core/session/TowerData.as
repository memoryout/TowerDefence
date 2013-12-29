package game.core.session
{
	import game.core.data.StaticTowerData;
	import game.interfaces.ITowerData;

	public class TowerData implements ITowerData
	{
		private var _towersData:	StaticTowerData;
		
		public function TowerData()
		{
		}
		
		public function setStaticData(data:StaticTowerData):void
		{
			_towersData = data;
		}
		
		//--------------------- interface -----------------
		public function get id():uint
		{
			return _towersData.id;
		}
		
		public function get damage():Number
		{
			return _towersData.damage;
		}
		
		public function get speed():Number
		{
			return _towersData.speed;
		}
		
		public function get range():int
		{
			return _towersData.range;
		}
		
		public function get aoe():String
		{
			return _towersData.aoe;
		}
		
		public function get level():uint
		{
			return _towersData.level;
		}
		
		public function get type():String
		{
			return _towersData.type;
		}
		
		public function get cost():Number
		{
			return _towersData.cost;
		}
		
		public function get skill():String
		{
			return _towersData.type;
		}
		
		public function get skin():String
		{
			return _towersData.skin;
		}
		
		public function get title():String
		{
			return _towersData.title;
		}
		
		public function get description():String
		{
			return _towersData.description;
		}
	}
}