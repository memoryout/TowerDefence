package game.interfaces.data.game
{
	import game.interfaces.data.IMapData;
	import game.interfaces.data.ITowerData;
	import game.interfaces.data.IWaveData;

	public interface IGameMapData
	{
		function get staticMapData():IMapData;
	}
}