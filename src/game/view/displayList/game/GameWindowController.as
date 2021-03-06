package game.view.displayList.game
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import flash.display.Sprite;
	
	import game.view.events.GameEvents;
	import game.view.events.MenuEvents;

	public class GameWindowController extends BroadcastModule
	{
		private var _contentContainer:	Sprite;
		private var _mainWindowView:	GameWindowView;
		
		public function GameWindowController(contentContainer:Sprite)
		{
			_contentContainer = contentContainer;
			
			_mainWindowView = new GameWindowView(_contentContainer, this);
			_contentContainer.addChild(_mainWindowView);
			
			initMessages();
		}
		
		private function initMessages():void
		{
			this.addMessageListener( GameEvents.INIT_GAME );
			this.addMessageListener( GameEvents.UPDATE_MOBS_NOTIFICATION );
			this.addMessageListener( GameEvents.UPDATE_MOBS_MOVE );			
		}
		
		private function initMainElements(obj:Object):void
		{
			_mainWindowView.addContainerToView();
			_mainWindowView.initMainElements(obj);			
		}
		
		public function startGame():void
		{
			this.sendMessage(GameEvents.START_GAME, null);
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case GameEvents.INIT_GAME:
				{
					initMainElements(message.data);
					break;
				}
				
				case GameEvents.UPDATE_MOBS_NOTIFICATION:
				{
					_mainWindowView.updateMobsNotification(message.data);
					break;
				}	
					
				case GameEvents.UPDATE_MOBS_MOVE:
				{
					_mainWindowView.updateMobMove(message.data);
					break;
				}	
			}
		}
	}
}