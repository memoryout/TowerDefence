package game.core.session
{
	import game.core.data.StaticMapData;
	import game.core.data.StaticMobData;
	import game.interfaces.IMobData;

	public class MobsData implements IMobData
	{
		private var _mobsData:			StaticMobData;
		
		public function MobsData()
		{
		}
		
		public function setStaticData(data:StaticMobData):void
		{
			_mobsData = data;
		}
		
		//--------------------- interface -----------------
		public function get id():uint
		{
			return _mobsData.id;
		}
		
		public function get level():int
		{
			return _mobsData.level;
		}
		
		public function get hp():int
		{
			return _mobsData.hp;
		}
		
		public function get armor():String
		{
			return _mobsData.armor;
		}
		
		public function get vulnerability():String
		{
			return _mobsData.vulnerability;
		}
		
		public function get ability():String
		{
			return _mobsData.vulnerability;
		}
		
		public function get bounty():Number
		{
			return _mobsData.bounty;
		}
		
		public function get skin():String
		{
			return _mobsData.skin;
		}
		public function get title():String
		{
			return _mobsData.title;
		}
		public function get description():String
		{
			return _mobsData.description;
		}
	}
}