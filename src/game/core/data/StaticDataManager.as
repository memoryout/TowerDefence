package game.core.data
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	public class StaticDataManager extends BroadcastModule
	{
		private const _maps:			Vector.<StaticMapData> = new Vector.<StaticMapData>;
		
		
		public function StaticDataManager()
		{
			super();
			
			initListener();
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( StaticDataManagerCommands.PARSE_STATIC_DATA );
			this.addMessageListener( StaticDataManagerCommands.GET_ALL_MAPS_DATA );
		}
		
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case StaticDataManagerCommands.PARSE_STATIC_DATA:
				{
					parseData(message.data as String)
					break;
				}
					
				case StaticDataManagerCommands.GET_ALL_MAPS_DATA:
				{
					message.data = _maps;
					break;
				}
			}
		}
		
		
		
		private function parseData(str:String):void
		{
			var xml:XML;
			
			try
			{
				xml = new XML(str);
				
				parseWorldData(xml);
			}
			catch(e:Error)
			{
				trace(e);
				return;
			}
			
			
			
			
			this.sendMessage( StaticDataManagerCommands.EVENT_PARSING_COMPLETE);
		}
		
		
		
		private function parseWorldData(xml:XML):void
		{
			var world:XMLList = xml.world;
			var pointsXML:XMLList;
			
			var par:String, mapData:StaticMapData, pointData:StaticMapPointData, par2:String;
			for(par in world.*)
			{
				if( world.*[par].name() == "map" )
				{
					mapData = new StaticMapData();
					mapData.id = uint(world.*[par].@id);
					mapData.image = String(world.*[par].@image);
					
					mapData.title = String( world.*[par].title);
					mapData.description = String( world.*[par].desciption);
					
					pointsXML = world.*[par].points;
					
					for(par2 in pointsXML.*)
					{
						pointData = new StaticMapPointData();
						pointData.x = int(pointsXML.*[par].@x);
						pointData.y = int(pointsXML.*[par].@y);
						pointData.id = uint(pointsXML.*[par].@id);
						pointData.mapId = uint(pointsXML.*[par].@map);
						pointData.title = String(pointsXML.*[par].@title);
						
						mapData.points.push( pointData );
					}
					
					_maps.push( mapData );
				}
			}
		}
	}
}