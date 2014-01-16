package game.interfaces.data
{
	public interface IWorldData
	{
		function get id():uint;
		function get image():String;
		function get description():String;
		function get title():String;
		function get isLocked():Boolean;
		
		function getPoints():Vector.<IWorldPointData>
	}
}