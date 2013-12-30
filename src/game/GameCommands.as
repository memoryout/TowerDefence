package game
{
	import utils.UintCounter;

	public class GameCommands
	{
		public static const GET_USER_INFO:			uint = UintCounter.getId();
		
		public static const GET_GLOBAL_MAP_DATA:	uint = UintCounter.getId();
		public static const GET_MAP_DATA:			uint = UintCounter.getId();
		
		public static const GET_TOWERS_DATA:		uint = UintCounter.getId();
		public static const GET_MOBS_DATA:			uint = UintCounter.getId();
		
		public static const GET_GAME_DATA:		uint = UintCounter.getId();
	}
}