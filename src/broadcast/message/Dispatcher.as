package broadcast.message
{
	import broadcast.IBroadcastModule;
	
	import flash.utils.Dictionary;

	public class Dispatcher
	{	
		private var _messageList:				Object;
		
		
		public function Dispatcher()
		{
			_messageList = new Object();
		}
		
		
		public function addMessageListener(message:uint, module:IBroadcastModule):void
		{
			if(!_messageList[message]) _messageList[message] = new Vector.<IBroadcastModule>;
			
			var v:Vector.<IBroadcastModule> = _messageList[message];
			
			if( v.indexOf(module) != -1) return;
			
			v.push(module);
		}
		
		
		public function removeMessageListener(message:uint, module:IBroadcastModule):void
		{
			if(!_messageList[message]) return;
			
			var v:Vector.<IBroadcastModule> = _messageList[message];
			var index:int = v.indexOf(module)
			
			if( index != -1)
			{
				v.splice(index, 1);
			}
			
			if(v.length == 0) delete _messageList[message];
		}
		
		
		public function sendMessage(message:uint, data:* = null):MessageData
		{	
			if(!_messageList[message]) return null;
			
			var messageData:MessageData = new MessageData(message, data);
			
			var v:Vector.<IBroadcastModule> = _messageList[message];
			var i:int;
			
			for(i = 0; i < v.length; i++) v[i].receiveMessage( messageData );
			
			return messageData;
		}
	}
}