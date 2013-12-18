package game.view
{
	import flash.display.Stage;
	
	import game.view.dispatcher.IViewDispacther;
	import game.view.interfaces.IMainAppScreen;

	public interface IViewRootModule extends IViewDispacther
	{
		function init( stage:Stage ):void;
		function get isInitComplete():Boolean;
		function get mainAppScreen():IMainAppScreen;
	}
}