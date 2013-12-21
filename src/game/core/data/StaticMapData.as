package game.core.data
{
	import game.interfaces.IMapData;
	import game.interfaces.IMapPoint;
	import game.interfaces.IPriceData;
	
	public class StaticMapData
	{
		public var title:			String;
		public var description:		String;
		public var id:				uint;
		public var locked:			Boolean;
		public var image:			String;
		
		public var points:			Vector.<StaticMapPointData> = new Vector.<StaticMapPointData>;
	}
}