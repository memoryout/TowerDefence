package game.view.dispatcher
{
	public interface IViewDispacther
	{
		function addEventListener(event:uint, listener:Function):void;
		function removeEventListener(event:uint, listener:Function):void;
		function dispachEvent(event:uint, data:* = null):void;
		function destroy():void;
	}
}