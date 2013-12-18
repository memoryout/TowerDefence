package game.view.interfaces
{
	import flash.display.Stage;

	public interface IMainAppScreen
	{
		function init(stage:Stage):void;
		
		function setSourceSize(width:uint, height:uint):void;
		
		function showDefaultPreloaderScreen():void;
		
		function removeDefaultPreloader():void;
	}
}