package game.core.session.game
{
	import game.interfaces.IGameData;
	import game.interfaces.IWaveData;
	
	public class GameData implements IGameData
	{
		public function GameData()
		{
			
		}
		
		
		public function setStaticData():void
		{
			
		}
		
		public function get id():uint
		{
			return 0;
		}
		
		public function get balance():int
		{
			return 0;
		}
		
		public function get image():String
		{
			return null;
		}
		
		public function get waves():Vector.<IWaveData>
		{
			return null;
		}
		
		public function get towers():Vector.<int>
		{
			return null;
		}
	}
}