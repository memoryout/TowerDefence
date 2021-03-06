package game.core.session
{
	import game.core.session.game.GameMapData;
	import game.interfaces.data.IMobData;
	import game.interfaces.data.ITowerData;
	import game.interfaces.data.IWorldData;
	import game.interfaces.data.game.IGameMapData;

	public class GameSession
	{
		private static const _this:			GameSession = new GameSession();
		
		
		private const _worlds:				Vector.<IWorldData> = new Vector.<IWorldData>;
		
		private const _towers:				Vector.<ITowerData> = new Vector.<ITowerData>;
		
		private const _mobsData:			Vector.<IMobData> 	= new Vector.<IMobData>;
		
		
		private const _userInfo:			UserInfo 			= new UserInfo();
		
		
		private const _gameMapData:			GameMapData = new GameMapData();
		
		public function GameSession()
		{
			
		}
		
		public static function get():GameSession
		{
			return _this
		}
		
		
		public function init():void
		{
			
		}
		
		
		public function get worldsData():Vector.<IWorldData>
		{
			return _worlds;
		}
				
		
		public function get userInfo():UserInfo
		{
			return _userInfo;
		}
		
		public function get mobsData():Vector.<IMobData>
		{
			return _mobsData;
		}
		
		public function get towersData():Vector.<ITowerData>
		{
			return _towers;
		}
		
		
		public function get gameMapData():IGameMapData
		{
			return _gameMapData;
		}
	}
}