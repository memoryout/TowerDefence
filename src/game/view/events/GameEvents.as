package game.view.events
{
	import utils.UintCounter;

	public class GameEvents
	{
		public static const INIT_GAME:		uint = UintCounter.getId();
		public static const START_GAME:		uint = UintCounter.getId();
		
		public static const UPDATE_MOBS_NOTIFICATION:	uint = UintCounter.getId();
		public static const UPDATE_MOBS_MOVE:			uint = UintCounter.getId();
	}
}