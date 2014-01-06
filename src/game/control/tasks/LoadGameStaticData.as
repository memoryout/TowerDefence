package game.control.tasks
{
	import broadcast.message.MessageData;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import game.control.game.MainGameController;
	import game.core.data.StaticDataManagerCommands;
	import game.errors.ErrorsDescription;
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class LoadGameStaticData extends SimpleTask
	{
		private var _urls:							Vector.<String>;
		private var _files:							Vector.<String>;
		
		private var _loader:						URLLoader;
		
		public function LoadGameStaticData()
		{
			super();
		}
		
		override public function run(...args):void
		{
			_urls = args[0];
			
			_files = new Vector.<String>;
			
			loadNextFile();
		}
		
		
		public function get filesData():Vector.<String>
		{
			return _files;
		}
		
		
		private function loadNextFile():void
		{
			if(_urls.length)
			{
				_loader = new URLLoader();
				_loader.addEventListener(Event.COMPLETE, handlerLoadData);
				_loader.addEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
				_loader.load( new URLRequest(_urls.shift()) );
			}
			else
			{
				this.dispachLocalEvent( TaskEvent.COMPLETE, this );
			}
		}
		
		
		private function handlerErrorLoadData(e:IOErrorEvent):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadData);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			
			_loader = null;
			
			this.dispachLocalEvent( TaskEvent.ERROR, ErrorsDescription.ERROR_LOAD_GAME_STATIC_DATA );
			this.destroy();
		}
		
		
		private function handlerLoadData(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadData);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			
			_files.push( e.currentTarget.data as String);
			
			_loader = null;
			
			loadNextFile();
		}
		
		
		override public function destroy():void
		{
			_urls = null;
			_files = null;
			
			if(_loader)
			{
				_loader.removeEventListener(Event.COMPLETE, handlerLoadData);
				_loader.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			}
			
			_loader = null;
			
			super.destroy();
		}
	}
}