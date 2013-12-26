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
			
			_mainWindowView = new GameWindowView(_contentContainer);
			_contentContainer.addChild(_mainWindowView);
			
			initMessages();
		}
		
		private function initMessages():void
		{
			this.addMessageListener( GameEvents.START_GAME );
		}
		
		private function initMainElements(obj:Object):void
		{
			_mainWindowView.addContainerToview();
			
			trace(obj);
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case GameEvents.START_GAME:
				{
					initMainElements(message.data);
					break;
				}
			}
		}
	}
}