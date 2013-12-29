package game.core.data
{
	import utils.UintCounter;

	public class StaticDataManagerCommands
	{
		public static const PARSE_STATIC_DATA:			uint = UintCounter.getId();
		public static const EVENT_PARSING_COMPLETE:		uint = UintCounter.getId();
		
		public static const GET_ALL_MAPS_DATA:			uint = UintCounter.getId();
		
		public static const GET_MOBS_DATA:				uint = UintCounter.getId();
		public static const GET_TOWERS_DATA:			uint = UintCounter.getId();
		
		public static const GET_GAMES_DATA:				uint = UintCounter.getId();
	}
}