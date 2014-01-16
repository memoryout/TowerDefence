package game.interfaces.data
{
	public interface IMapData
	{
		function get id():uint;
		function get mesh():Vector.<Vector.<int>>;
		function get towers():Vector.<uint>;
		function get waves():IWaveData;
		function get image():String;
		function get balance():Number;
		function get life():Number;
	}
}