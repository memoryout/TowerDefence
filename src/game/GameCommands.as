package game
{
	import utils.UintCounter;

	public class GameCommands
	{
		public static const GET_USER_INFO:			uint = UintCounter.getId();
		
		
		public static const GET_SESSION_WORLDS_DATA:	uint = UintCounter.getId();
		public static const GET_SESSION_TOWERS_DATA:	uint = UintCounter.getId();
		public static const GET_SESSION_MOBS_DATA:		uint = UintCounter.getId();
		
		public static const GET_STATIC_MAP_DATA:		uint = UintCounter.getId();
		
		
		
		
		
		public static const GET_GLOBAL_MAP_DATA:	uint = UintCounter.getId();
		
		public static const GET_GAME_DATA:			uint = UintCounter.getId();
		
		public static const GET_GAMES_DATA:			uint = UintCounter.getId();
	}
}