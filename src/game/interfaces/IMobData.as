package game.interfaces
{
	public interface IMobData
	{
		function get id():uint;		
		function get level():int;		
		
		function get hp():int;
		function get armor():String;	
		function get vulnerability():String;
		function get ability():String;
		function get bounty():Number;		
		
		function get skin():String;		
		function get title():String;
		function get description():String;	
	}
}