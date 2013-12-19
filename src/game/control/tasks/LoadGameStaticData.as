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
		private var _mainGameController:			MainGameController;
		
		public function LoadGameStaticData()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var url:String = args[0];
			
			_mainGameController = args[1];
			
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, handlerLoadData);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			loader.load( new URLRequest(url) );
		}
		
		
		private function handlerErrorLoadData(e:IOErrorEvent):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadData);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			
			this.dispachLocalEvent( TaskEvent.ERROR, ErrorsDescription.ERROR_LOAD_GAME_STATIC_DATA );
			this.destroy();
		}
		
		
		private function handlerLoadData(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, handlerLoadData);
			e.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, handlerErrorLoadData);
			
			parserStaticData(e.currentTarget.data as String);
		}
		
		
		private function parserStaticData(data:String):void
		{
			this.addMessageListener( StaticDataManagerCommands.EVENT_PARSING_COMPLETE );
			this.sendMessage( StaticDataManagerCommands.PARSE_STATIC_DATA, data);
			
			//this.dispachLocalEvent( TaskEvent.COMPLETE, this );
		}
		
		override public function receiveMessage(message:MessageData):void
		{
			switch(message.message)
			{
				case StaticDataManagerCommands.EVENT_PARSING_COMPLETE:
				{
					this.dispachLocalEvent( TaskEvent.COMPLETE, this );
					break;
				}
			}
		}
	}
}