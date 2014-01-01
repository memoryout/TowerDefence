package game.view.displayList.menu
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	import game.view.interfaces.IWindow;

	public class PrimaryWindow extends Sprite implements IWindow
	{
		private const OPEN_CLOSE_TIME:Number = 0.2;
		
		private var open_tween:		TweenLite;
		private var close_tween:	TweenLite;
		
		public var pageName:		String;
		
		public function PrimaryWindow()
		{
			this.alpha = 0;
		}
		
		public function open():void
		{
			if(open_tween) open_tween.kill();
			
			open_tween = TweenLite.to(this, OPEN_CLOSE_TIME, {alpha:1});
		}
		
		public function close(callBack:Function = null):void
		{
			if(close_tween) close_tween.kill();
			
			close_tween = TweenLite.to(this, OPEN_CLOSE_TIME, {alpha:0, onComplete:callBack});
		}
	}
}