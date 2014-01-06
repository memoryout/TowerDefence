package game.interfaces.data
{
	public interface ITowerData
	{
		function get id():uint;
		function get damage():Number;		
		function get speed():Number;
		function get range():int;
		function get aoe():String;
		function get level():uint;
		function get type():String;
		function get cost():Number;
		function get skill():String;
		
		function get skin():String;
		function get title():String;
		function get description():String;
	}
}