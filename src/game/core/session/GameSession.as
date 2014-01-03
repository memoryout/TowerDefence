package game.core.session
{
	import game.core.data.StaticMapData;
	import game.core.session.game.GameData;
	import game.interfaces.IGameData;
	import game.interfaces.IMobData;
	import game.interfaces.ITowerData;

	public class GameSession
	{
		private static const _this:			GameSession = new GameSession();
		
		
		private const _userInfo:			UserInfo 			= new UserInfo();
		
		private const _globalMapData:		WorldGlobalData 	= new WorldGlobalData();
		
		private const _mobsData:			Vector.<IMobData> 	= new Vector.<IMobData>;
		private const _towersData:			Vector.<ITowerData> = new Vector.<ITowerData>;
		private const _gamesData:			Vector.<IGameData>  = new Vector.<IGameData>;
		
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
		
		public function get worldData():WorldGlobalData
		{
			return _globalMapData;
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
			return _towersData;
		}
		
		public function get gamesData():Vector.<IGameData>
		{
			return _gamesData;
		}
		
		public function getGameData(gameId:uint):IGameData
		{
			var i:int;
			i = _gamesData.length;
			while(i--)
			{
				if(_gamesData[i].id == gameId) return _gamesData[i];
			}
			
			return null;
		}
	}
}