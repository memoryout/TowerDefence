package
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	
	import game.control.AppRootModule;
	
	import utils.updater.Updater;
	
	[SWF(frameRate="60")]
	public class TowerDefence extends Sprite
	{
		private var _appRootModule:			AppRootModule;
		
		private var _updater:				Updater;
		
		public function TowerDefence()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, handlerInvoke);
		}
		
		
		private function handlerInvoke(e:InvokeEvent):void
		{
			NativeApplication.nativeApplication.removeEventListener(InvokeEvent.INVOKE, handlerInvoke);
			
			stage.color = 0x0;
			
			_updater = new Updater();
			
			this.addEventListener(Event.ENTER_FRAME, handlerEnterFrame);
			
			_appRootModule = new AppRootModule();
			_appRootModule.init( this.stage );
		}
		
		
		private function handlerEnterFrame(e:Event):void
		{
			_updater.update();
		}
	}
}