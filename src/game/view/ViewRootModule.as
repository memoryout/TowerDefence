package game.view
{
	import flash.display.Stage;
	import flash.display3D.Context3DRenderMode;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	import game.view.dispatcher.ViewDispatcher;
	import game.view.displayList.DisplayListMainAppScreen;
	import game.view.interfaces.IMainAppScreen;
	
	public class ViewRootModule extends ViewDispatcher implements IViewRootModule
	{
		private var _stage:				Stage;
		
		private var _isInit:			Boolean;
		
		private var _mainView:			IMainAppScreen;
		
		public function ViewRootModule()
		{
			super();
			
			_isInit = false;
		}
		
		
		public function init( stage:Stage ):void
		{
			_stage = stage;
			
			_stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, handlerContext3DCreated);
			_stage.stage3Ds[0].addEventListener(ErrorEvent.ERROR, handlerErrorCreateContext3D);
			
			_stage.stage3Ds[0].requestContext3D( Context3DRenderMode.AUTO );
		}
		
		
		public function get isInitComplete():Boolean
		{
			return _isInit;
		}
		
		
		public function get mainAppScreen():IMainAppScreen
		{
			return _mainView;
		}
		
		
		private function handlerContext3DCreated(e:Event):void
		{
			_stage.stage3Ds[0].removeEventListener(Event.CONTEXT3D_CREATE, handlerContext3DCreated);
			_stage.stage3Ds[0].removeEventListener(ErrorEvent.ERROR, handlerErrorCreateContext3D);
			
			// create Starling based engine;
			
			createDisplayListView();
			
			initComplete();
		}
		
		
		private function handlerErrorCreateContext3D(e:ErrorEvent):void
		{
			_stage.stage3Ds[0].removeEventListener(Event.CONTEXT3D_CREATE, handlerContext3DCreated);
			_stage.stage3Ds[0].removeEventListener(ErrorEvent.ERROR, handlerErrorCreateContext3D);
			
			// create DisplayList based engine;
			
			createDisplayListView();
			
			initComplete();
		}
		
		
		private function createDisplayListView():void
		{
			_mainView = new DisplayListMainAppScreen();
			_mainView.init( _stage );
		}
		
		
		private function initComplete():void
		{
			_isInit = true;
			this.dispachEvent( ViewRootEvents.VIEW_INIT_COMPLETE, this );
		}
	}
}