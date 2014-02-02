package game.core.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.core.game.data.InitGameData;
	import game.core.game.world.towers.FireTower;
	
	import utils.updater.Updater;
	
	public class GameMainModule extends BroadcastModule
	{
		
		private const _gameCore:				GameCore = new GameCore();
		
		
		public function GameMainModule()
		{
			super();
			
			initListeners();
		}
		
		
		private function initListeners():void
		{
			this.addMessageListener(GameCoreCommands.START_GAME);
			this.addMessageListener(GameCoreCommands.LOAD_GAME);
		}
		
		
		private function loadNewGame(data:InitGameData):void
		{
			_gameCore.loadGame( data );
		}
		
		
		override public function receiveMessage(message:MessageData):void
		{
			var id:uint = message.message;
			
			switch(id)
			{
				case GameCoreCommands.START_GAME:
				{
					_gameCore.startGame();
					message.data = _gameCore.gameStateObject;
					break;
				}
				
				case GameCoreCommands.LOAD_GAME:
				{
					loadNewGame(message.data)
					break;
				}
			}
		}
	}
}