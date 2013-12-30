package game.interfaces
{
	public interface IWaveData
	{
		function get id():uint;
		function get quantity():int;
		function get time():Number;
		function get startTime():Number;
		
		function get mobs():Vector.<int>;
	}
}