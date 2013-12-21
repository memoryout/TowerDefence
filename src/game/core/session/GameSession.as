package game.core.session
{
	import game.core.data.StaticMapData;

	public class GameSession
	{
		private static const _this:			GameSession = new GameSession();
		
		
		private const _userInfo:			UserInfo = new UserInfo();
		
		private const _globalMapData:		WorldGlobalData = new WorldGlobalData();
		
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
		
	}
}