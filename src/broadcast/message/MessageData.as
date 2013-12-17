package broadcast.message
{
	public class MessageData
	{
		public var data:		*;
		
		
		private var _message:		uint;
		
		public function MessageData(messageId:uint, data:*)
		{
			_message = messageId;
			this.data = data;
		}
		
		public function get message():uint
		{
			return _message;
		}
	}
}