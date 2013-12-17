package game.view
{
	import flash.display.Stage;
	
	import game.view.dispatcher.IViewDispacther;

	public interface IViewRootModule extends IViewDispacther
	{
		function init( stage:Stage ):void;
		function get isInitComplete():Boolean;
	}
}