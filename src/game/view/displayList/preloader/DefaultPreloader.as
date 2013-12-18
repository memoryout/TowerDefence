package game.view.displayList.preloader
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class DefaultPreloader extends Sprite
	{
		public function DefaultPreloader()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, handlerAddedToStage);
		}
		
		
		private function handlerAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, handlerAddedToStage);
			
			var mc:MovieClip = new gDefaultLoader();
			this.addChild( mc );
		}
	}
}