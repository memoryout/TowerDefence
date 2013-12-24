package game.view.displayList.menu.map
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.interfaces.IMapPoint;
	import game.view.displayList.menu.MenuData;
	import game.view.displayList.menu.PrimaryWindow;
	
	public class MapWindowView extends PrimaryWindow
	{
		private const CLASS_NAME:				String = "MapWindow";
		private const POINT_NAME:				String = "MapPoint";
		
		private const BTN_CLOSE_NAME:			String = "BtnClose";
		
		private var _controller:				MapWindowController;
		
		private var btnClose:					MovieClip;
		
		private var primaryPartsOfMapContainer:	MovieClip;
		
		private var initX:						Number;
		private var singleWidth:				Number;
		
		private var _tween_t:					TweenLite;
		
		public function MapWindowView()
		{
			super();
			
			pageName = MenuData.MAP_WINDOW_VIEW;
			
			addLinks();
			addListeners();
			
			_controller = new MapWindowController(this);		
		}
		
		/** 
		 * Init links for main window container and add him to view.
		 * Add link to button "back".
		 */		
		private function addLinks():void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition( CLASS_NAME) as Class;
			var _viewElement:MovieClip = new _viewClass();
			
			addChild(_viewElement);		
			addChildAt(primaryPartsOfMapContainer = new MovieClip(), 0);
			
			btnClose = _viewElement.getChildByName(BTN_CLOSE_NAME) as MovieClip;
		}
		
		/** 
		 * Init listeners.
		 */		
		private function addListeners():void
		{
			btnClose.addEventListener(MouseEvent.CLICK, mClick);
			primaryPartsOfMapContainer.addEventListener(MouseEvent.MOUSE_UP, 	gotoStartGamePopUp);
			primaryPartsOfMapContainer.addEventListener(MouseEvent.MOUSE_DOWN, 	mDownPrimaryPartsOfMapContainer);
			
			primaryPartsOfMapContainer.buttonMode 	= true;
			btnClose.buttonMode 	   				= true;
		}
		
		private function gotoStartGamePopUp(e:MouseEvent):void
		{
			var namePart:Array = e.target.name.split(" ");
			
			if(namePart[0] && namePart[0] == "point") _controller.showNextWindow(MenuData.START_GAME_WINDOW_VIEW);
		}
		
		private function mDownPrimaryPartsOfMapContainer(e:MouseEvent):void
		{
			initX 		= e.stageX - primaryPartsOfMapContainer.x;
			singleWidth	= primaryPartsOfMapContainer.width/primaryPartsOfMapContainer.numChildren; 
			
			primaryPartsOfMapContainer.addEventListener(MouseEvent.MOUSE_MOVE,  moveMaps);
			primaryPartsOfMapContainer.addEventListener(MouseEvent.MOUSE_UP, 	moveEnd);
		}
		
		private function moveMaps(e:MouseEvent):void
		{
			primaryPartsOfMapContainer.y = 0;
			
		
			/*	if(primaryPartsOfMapContainer.x < 0)	*/primaryPartsOfMapContainer.x = e.stageX - initX;		
				
				if(primaryPartsOfMapContainer.x > 0) 
					finalMove(0);
				else if(primaryPartsOfMapContainer.x < (singleWidth*(primaryPartsOfMapContainer.numChildren - 1)*(-1)))
					finalMove( singleWidth*(primaryPartsOfMapContainer.numChildren - 1)*(-1) );	
				
				trace(primaryPartsOfMapContainer.x);
											
		}		
		
		private function finalMove(_x:Number):void
		{
			primaryPartsOfMapContainer.removeEventListener(MouseEvent.MOUSE_MOVE, moveMaps);		
		
			if(_tween_t) _tween_t.kill();
			
			_tween_t = TweenLite.to(primaryPartsOfMapContainer, 0.5, {x:_x});	
		}
		
		private function moveEnd(e:MouseEvent):void
		{
			primaryPartsOfMapContainer.removeEventListener(MouseEvent.MOUSE_MOVE,  moveMaps);			
		}
		
		/**
		 * Call after click button "back".
		 */		
		private function mClick(e:MouseEvent):void
		{
			_controller.showNextWindow(MenuData.MAIN_WINDOW_VIEW);
		}
		
		/**
		 * Create simple part of all map. 
		 * @param id - index forsimple part.
		 * @param title_description - title name and description for her.
		 * @param image_name - class name for imported image for simple part of map.
		 * @param enable_status - part of map is locked or not.
		 * @param points - data about points on simple part of map.
		 * 
		 */		
		public function createPrimaryLocation(id:int, title_description:Array, image_name:String, enable_status:Boolean, points:Vector.<IMapPoint>):void
		{
			// add new element to "primaryPartsOfMapContainer" with name "image_name"
			var _primaryMapClass:Class = ApplicationDomain.currentDomain.getDefinition(image_name) as Class;
			var _primaryMapElement:MovieClip = new _primaryMapClass();
			_primaryMapElement.name = id.toString();				
			
			primaryPartsOfMapContainer.addChild(_primaryMapElement);
			
			// set x coordinates for new element with id > 0
			if(id > 0)
			{
				var zeroElement:MovieClip = primaryPartsOfMapContainer.getChildByName((id-1).toString()) as MovieClip;				
				_primaryMapElement.x = zeroElement.x + zeroElement.width;
			}
			
			for (var i:String in points)
			{
				var _pointMapClass:Class = ApplicationDomain.currentDomain.getDefinition(POINT_NAME) as Class;
				var _pointMapElement:MovieClip = new _pointMapClass();
				_pointMapElement.name = id.toString();		
				
				_primaryMapElement.addChild(_pointMapElement);
				_pointMapElement.x 		= points[i].x;
				_pointMapElement.y 		= points[i].y;
				_pointMapElement.name 	= points[i].title;
				
				for (var j:int = 1; j < 4; j++) 
					(_pointMapElement.getChildByName("star_" + j) as MovieClip).visible = false;
				
				
				for (var k:int = 1; k < points[i].stars + 1; k++) 
					(_pointMapElement.getChildByName("star_" + k) as MovieClip).visible = true;
					
			}
		}
	}
}