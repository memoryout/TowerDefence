package game.interfaces
{
	public interface IGameData
	{
		function get id():uint;
		function get balance():int;
		
		function get waves():Vector.<IWaveData>;
		function get towers():Vector.<int>;
	}
}