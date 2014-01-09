package
{
	import flash.filesystem.File;

	public class TowerDefenceData
	{
		public static const SOURCE_LOCAL_URL:			String = "source/source.swf";
		public static const SAVED_DATA_URL:				String = File.applicationStorageDirectory.nativePath + "/save.dat";
		public static const STATIC_GAME_DATA:			Vector.<String> = new <String>[
																						"data/towers.dat",
																						"data/mobs.dat",
																						"data/worlds.dat",
																						"data/maps.dat"
																						];
	}
}