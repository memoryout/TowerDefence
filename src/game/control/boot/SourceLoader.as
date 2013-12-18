package game.control.boot
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class SourceLoader extends SimpleTask
	{
		public function SourceLoader()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var url:String = args[0];
			
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handlerLoadFile);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadFile);
			loader.load( new URLRequest(url), new LoaderContext(false, ApplicationDomain.currentDomain) );
		}
		
		
		private function handlerLoadFile(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadFile);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadFile);
			
			this.dispachLocalEvent(TaskEvent.COMPLETE, this );
		}
		
		
		private function handlerErrorLoadFile(e:IOErrorEvent):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadFile);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadFile);
			
			this.dispachLocalEvent(TaskEvent.ERROR, this );
		}
	}
}