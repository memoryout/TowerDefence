package game.view.displayList.menu.map
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.core.data.StaticDataManagerCommands;
	import game.view.events.MenuEvents;

	public class MapWindowController extends BroadcastModule
	{	
		private var _infoWindowView:	MapWindowView;
		
		public function MapWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as MapWindowView;
			
			initListener();
			this.sendMessage(StaticDataManagerCommands.GET_ALL_MAPS_DATA);
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
		
		private function initListener():void
		{
			this.addMessageListener( StaticDataManagerCommands.GET_ALL_MAPS_DATA );
		}
		
		private function updateMap(obj:Object):void
		{
			for (var i:String in obj) 
			{
				var titele_description:Array = [obj[i].title, obj[i].description];					
				
				_infoWindowView.createPrimaryLocation(obj[i].id, titele_description, obj[i].image, obj[i].locked, obj[i].points);
			}			
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case StaticDataManagerCommands.GET_ALL_MAPS_DATA:
				{
					updateMap(message.data);
					break;
				}
			}
		}
	}
}