package game.core.data
{
	import game.interfaces.IMapData;
	import game.interfaces.IMapPoint;
	import game.interfaces.IPriceData;
	
	public class MapData implements IMapData
	{
		private var _title:			String;
		private var _description:	String;
		private var _id:			uint;
		private var _locked:		Boolean;
		private var _image:			String;
		
		private var _points:		Vector.<IMapPoint>;
		
		public function MapData()
		{
			_points = new Vector.<IMapPoint>;
		}
		
		public function setTitle(value:String):void
		{
			_title = value;
		}
		
		
		public function setDescription(value:String):void
		{
			_description = value;
		}
		
		
		public function setId(value:uint):void
		{
			_id = value;
		}
		
		
		public function setLocked(value:Boolean):void
		{
			_locked = value;
		}
		
		
		public function setPriceForOpen(price:IPriceData):void
		{
			
		}
		
		public function addMapPoint(mapPoint:MapPoint):void
		{
			_points.push(mapPoint);
		}
		
		
		public function setImage(value:String):void
		{
			_image = value;
		}
		
		//------------------------ interface -------------------
		
		public function get title():String
		{
			return null;
		}
		
		public function get description():String
		{
			return null;
		}
		
		public function get id():uint
		{
			return 0;
		}
		
		public function get isLocked():Boolean
		{
			return false;
		}
		
		public function getOpenPrice():IPriceData
		{
			return null;
		}
		
		public function getPointsData():Vector.<IMapPoint>
		{
			return _points;
		}
		
		public function get image():String
		{
			return _image;
		}
	}
}