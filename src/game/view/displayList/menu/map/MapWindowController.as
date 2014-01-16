package game.view.displayList.menu.map
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	import game.GameCommands;
	import game.core.data.StaticDataManagerCommands;
	import game.interfaces.data.IWorldData;
	import game.view.displayList.menu.MenuData;
	import game.view.events.MenuEvents;

	public class MapWindowController extends BroadcastModule
	{	
		private var _infoWindowView:	MapWindowView;
		
		public function MapWindowController(viewComponent:Object=null)
		{
			_infoWindowView = viewComponent as MapWindowView;
			
			initListener();
			var message:MessageData = this.sendMessage(GameCommands.GET_SESSION_WORLDS_DATA);
			updateMap(message.data);
			
		}
		
		public function showNextWindow(windowName:String):void
		{
			sendMessage(MenuEvents.HIDE_WINDOW, MenuData.MAP_WINDOW_VIEW);
			sendMessage(MenuEvents.SHOW_WINDOW, windowName);		
		}
		
		private function initListener():void
		{
			this.addMessageListener( GameCommands.GET_GLOBAL_MAP_DATA );
		}
		
		private function updateMap(worlds:Vector.<IWorldData>):void
		{
			//var maps:Vector.<IMapData> = obj.getMaps() as Vector.<IMapData>;
			
			var i:int;
			for (i = 0; i < worlds.length; i++) 
			{
				var titele_description:Array = [worlds[i].title, worlds[i].description];					
				
				_infoWindowView.createPrimaryLocation(worlds[i].id, titele_description, worlds[i].image, worlds[i].isLocked, worlds[i].getPoints());
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