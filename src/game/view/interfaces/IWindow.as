package game.view.interfaces
{
	public interface IWindow
	{
		function open():void;
		function close(callBack:Function = null):void;
	}
}