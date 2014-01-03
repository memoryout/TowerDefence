package utils.updater
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimerUpdater
	{
		private var _this:				TimerUpdater;
		
		private var _timer:				Timer;
		
		private const _listener:		Vector.<Function> = new Vector.<Function>;
		
		public function TimerUpdater()
		{
			_this = this;
		}
		
		
		public function startTimer(ms:uint):void
		{
			if(_timer)
			{
				_timer.removeEventListener(TimerEvent.TIMER, handlerTimerTick);
				_timer.stop();
			}
			
			_timer = new Timer(ms);
			_timer.addEventListener(TimerEvent.TIMER, handlerTimerTick);
			_timer.start();
		}
		
		
		public function stopTimer():void
		{
			if(_timer)
			{
				_timer.stop();
			}
		}
		
		
		public function addListener(func:Function):void
		{
			var i:int;
			i = _listener.length
			
			while(i--)
			{
				if(_listener[i] == func) return;
			}
			
			_listener.push(func);
		}
		
		
		public function removeListener(func:Function):void
		{
			var i:int;
			i = _listener.length
			
			while(i--)
			{
				if(_listener[i] == func)
				{
					_listener.splice(i, 1);
					return;
				}
			}
		}
		
		
		
		private function handlerTimerTick(e:TimerEvent):void
		{
			var i:int;
			for(i = 0; i < _listener.length; i++)
			{
				_listener[i]();
			}
		}
	}
}