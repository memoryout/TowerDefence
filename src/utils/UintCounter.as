package utils
{
	public class UintCounter
	{
		private static var _counter:		uint = 1;
		
		public static function getId():uint
		{
			return _counter ++;
		}
	}
}