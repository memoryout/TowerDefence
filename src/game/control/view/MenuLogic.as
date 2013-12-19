package game.control.view
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.view.displayList.menu.MenuData;
	import game.view.events.MenuEvents;

	public class MenuLogic extends BroadcastModule
	{
		public function MenuLogic()
		{
			super();		
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				/*case MenuEvents.SHOW_WINDOW:
				{
					
					break;
				}*/
			}
		}
	}
}