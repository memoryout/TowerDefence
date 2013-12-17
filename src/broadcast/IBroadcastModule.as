package broadcast
{
	import broadcast.message.MessageData;
	
	import flash.events.IEventDispatcher;

	public interface IBroadcastModule extends IEventDispatcher
	{
		function receiveMessage(message:MessageData):void;
		function destroy():void;
	}
}