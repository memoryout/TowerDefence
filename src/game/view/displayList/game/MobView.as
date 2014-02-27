package game.view.displayList.game
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.core.game.objects.mob.MobDirection;
	
	public class MobView extends Sprite
	{		
		private const RIGHT_START_LABLE:	String = "right_start";
		private const UP_START_LABLE:		String = "up_start";
		private const DOWN_START_LABLE:		String = "down_start";
		private const LEFT_START_LABLE:		String = "left_start";
		
		private const RIGHT_END_LABLE:		String = "right_end";
		private const UP_END_LABLE:			String = "up_end";
		private const DOWN_END_LABLE:		String = "down_end";
		private const LEFT_END_LABLE:		String = "left_end";
		
		public var currentDirection:int;		
		public var currentGraphicContainer:MovieClip;
		
		public function MobView()
		{
			super();
		}
		
		public function createMobe(mobName:String):void
		{
			var _viewClass:Class = ApplicationDomain.currentDomain.getDefinition(mobName) as Class;
			currentGraphicContainer = new _viewClass();		
			
			this.addChild(currentGraphicContainer);
		}
		
		public function updateDirection(mcObject:Object, direction:int):void
		{	
			var lable:String;
			
			if(direction      == MobDirection.RIGHT) lable = RIGHT_START_LABLE;		
			else if(direction == MobDirection.UP)	 lable = UP_START_LABLE;		
			else if(direction == MobDirection.DOWN)	 lable = DOWN_START_LABLE;		
			
			mcObject.currentGraphicContainer.gotoAndPlay(lable);		
			
			mcObject.addEventListener(Event.ENTER_FRAME, checkCurrentLable);			
		}
		
		public function checkCurrentLable(e:Event):void
		{
			var lable:String = e.currentTarget.currentGraphicContainer.currentFrameLabel;
			
			if(lable 	  == RIGHT_END_LABLE)	lable = RIGHT_START_LABLE;			
			else if(lable == UP_END_LABLE)		lable = UP_START_LABLE;				
			else if(lable == DOWN_END_LABLE)	lable = DOWN_START_LABLE;				
			
			if(lable) e.currentTarget.currentGraphicContainer.gotoAndPlay(lable);
		}
	}
}