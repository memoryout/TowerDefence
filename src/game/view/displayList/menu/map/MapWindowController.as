package game.view.displayList.menu.map
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.core.data.StaticDataManagerCommands;
	import game.interfaces.IGlobalMapData;
	import game.interfaces.IMapData;
	import game.view.events.MenuEvents;

	public class MapWindowController extends BroadcastModule
	{	
		private var _infoWindowView:	MapWindowView;
		
		public function MapWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as MapWindowView;
			
			initListener();
			var message:MessageData = this.sendMessage(GameCommands.GET_GLOBAL_MAP_DATA);
			updateMap(message.data);
			
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);
		}
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_GLOBAL_MAP_DATA );
		}
		
		private function updateMap(obj:IGlobalMapData):void
		{
			var maps:Vector.<IMapData> = obj.getMaps() as Vector.<IMapData>;
			
			var i:int;
			for (i = 0; i < maps.length; i++) 
			{
				var titele_description:Array = [maps[i].title, maps[i].description];					
				
				_infoWindowView.createPrimaryLocation(maps[i].id, titele_description, maps[i].image, maps[i].isLocked, maps[i].getPointsData());
			}			
		}
		
		override public function receiveMessage(message:MessageData):void 
		{			
			switch(message.message)
			{	
				case StaticDataManagerCommands.GET_ALL_MAPS_DATA:
				{
//					updateMap(message.data);
					break;
				}
			}
		}
	}
}