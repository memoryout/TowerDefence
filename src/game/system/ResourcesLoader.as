package game.system
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class ResourcesLoader extends SimpleTask
	{
		private const FILE_PATH:String = "d:/pinkrhino_git/TowerDefence/bin/";
		private const FILE_NAME:String = "td_res.swf";
		
		public var loader:Loader = new Loader();
		
		public function ResourcesLoader()
		{
			super();					
		}
		
		public function startLoad():void
		{
			loader.load(new URLRequest(FILE_PATH + FILE_NAME));
			
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, 		  complate);
		}
		
		private function progress(e: ProgressEvent):void
		{
//			loadingBar.loadingBar.mask.scaleX = e.bytesLoaded / e.bytesTotal;
//			text.text = Math.round(100 * e.bytesLoaded / e.bytesTotal).toString() + " %";
		}
		
		private function complate(e:Event):void
		{
			trace("loaded");
			this.dispachLocalEvent(TaskEvent.LOAD_COMPLETED, this);
		}
	}
}