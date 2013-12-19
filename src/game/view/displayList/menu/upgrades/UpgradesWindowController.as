package game.view.displayList.menu.upgrades
{
	import broadcast.BroadcastModule;

	public class UpgradesWindowController extends BroadcastModule
	{
		private var _upgradesWindowView:	UpgradesWindowView;	
						
		public function UpgradesWindowController(viewComponent:Object=null)
		{
			_upgradesWindowView = viewComponent as UpgradesWindowView;
		}
	}
}