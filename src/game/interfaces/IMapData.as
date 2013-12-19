package game.interfaces
{
	public interface IMapData
	{
		function get title():String;
		function get description():String;
		function get id():uint;
		
		function get isLocked():Boolean;
		function get image():String;
		
		function getOpenPrice():IPriceData;
		function getPointsData():Vector.<IMapPoint>;
		
	}
}