package game.core.data
{
	import broadcast.BroadcastModule;
	import broadcast.message.MessageData;
	
	public class StaticDataManager extends BroadcastModule
	{
		private const _maps:			Vector.<MapData> = new Vector.<MapData>;
		
		
		public function StaticDataManager()
		{
			super();
			
			initListener();
		}
		
		
		private function initListener():void
		{
			this.addMessageListener( StaticDataManagerCommands.PARSE_STATIC_DATA );
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
			
			var par:String, mapData:MapData, pointData:MapPoint, par2:String;
			for(par in world.*)
			{
				if( world.*[par].name() == "map" )
				{
					mapData = new MapData();
					mapData.setId( uint(world.*[par].@id) );
					mapData.setImage( String(world.*[par].@image) );
					
					mapData.setTitle( String( world.*[par].title) );
					mapData.setDescription( String( world.*[par].desciption) );
					
					pointsXML = world.*[par].points;
					
					for(par2 in pointsXML.*)
					{
						pointData = new MapPoint();
						pointData.setX( int(pointsXML.*[par].@x) );
						pointData.setY( int(pointsXML.*[par].@y) );
						pointData.setId( uint(pointsXML.*[par].@id) );
						pointData.setMapId( uint(pointsXML.*[par].@map) );
						pointData.setTitle( String(pointsXML.*[par].@title) );
						
						mapData.addMapPoint( pointData );
					}
					
					_maps.push( mapData );
				}
			}
		}
	}
}