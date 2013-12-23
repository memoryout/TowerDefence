package game.core.session
{
	import game.core.data.StaticMapData;
	import game.interfaces.IMapData;
	import game.interfaces.IMapPoint;
	import game.interfaces.IPriceData;
	
	public class GameMapData implements IMapData
	{
		private var _mapData:			StaticMapData;
		
		private var _locked:			Boolean;
		
		private var _points:			Vector.<GameMapPointData>;
		private var _IPoints:			Vector.<IMapPoint>;
		
		public function GameMapData()
		{
			_locked = true;
			_points = new Vector.<GameMapPointData>;
			_IPoints = new Vector.<IMapPoint>;
		}
		
		
		public function setStaticData(data:StaticMapData):void
		{
			_mapData = data;
			
			var i:int, pointData:GameMapPointData;
			for(i = 0; i < _mapData.points.length; i++)
			{
				pointData = new GameMapPointData();
				pointData.setStaticData( _mapData.points[i] );
				
				_points.push( pointData );
				_IPoints.push( pointData );
			}
		}
				
		
		//--------------------- interface -----------------
		public function get title():String
		{
			return _mapData.title;
		}
		
		public function get description():String
		{
			return _mapData.description;
		}
		
		public function get id():uint
		{
			return _mapData.id;
		}
		
		public function get isLocked():Boolean
		{
			return _locked;
		}
		
		public function get image():String
		{
			return _mapData.image;
		}
		
		public function getOpenPrice():IPriceData
		{
			return null;
		}
		
		public function getPointsData():Vector.<IMapPoint>
		{
			return _IPoints;
		}
	}
}