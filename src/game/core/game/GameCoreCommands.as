package game.core.game
{
	import utils.UintCounter;

	public class GameCoreCommands
	{
		public static const LOAD_GAME:			uint = UintCounter.getId();
		public static const START_GAME:			uint = UintCounter.getId();
		
		public static const PAUSE_GAME:			uint = UintCounter.getId();
		public static const RESUME_GAME:		uint = UintCounter.getId();
		
		public static const FINISH_GAME:		uint = UintCounter.getId();
		
		public static const CLEAR_GAME:			uint = UintCounter.getId();
	}
}