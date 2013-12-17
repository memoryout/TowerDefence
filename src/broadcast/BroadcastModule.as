package broadcast
{
	import broadcast.message.Dispatcher;
	import broadcast.message.MessageData;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class BroadcastModule extends EventDispatcher implements IBroadcastModule
	{
		private static const _broadcastDispacther:		Dispatcher = new Dispatcher();
		
		private var _messages:				Object;
		
		
		public function BroadcastModule()
		{
			super();
			
			_messages = new Object();
		}
		
		protected function addMessageListener(messageId:uint):void
		{
			_messages[messageId] = messageId;
			_broadcastDispacther.addMessageListener( messageId, this );
		}
		
		protected function removeMessageListener(messageId:uint):void
		{
			delete _messages[messageId];
			_broadcastDispacther.removeMessageListener( messageId, this );
		}
		
		protected function sendMessage(messageId:uint, data:* = null):MessageData
		{
			return _broadcastDispacther.sendMessage(messageId, data);
		}
		
		
		public function receiveMessage(message:MessageData):void
		{
			
		}
		
		
		public function destroy():void
		{
			var par:String;
			for(par in _messages)
			{
				_broadcastDispacther.removeMessageListener( _messages[par], this );
				delete _messages[par]
			}
			
			_messages = null;
		}
	}
}