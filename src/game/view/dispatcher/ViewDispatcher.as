package game.view.dispatcher
{
	public class ViewDispatcher implements IViewDispacther
	{
		private var _listeners:			Object;
		
		
		public function ViewDispatcher()
		{
			_listeners = new Object();
		}
		
		public function addEventListener(event:uint, listener:Function):void
		{
			if(!_listeners[event]) _listeners[event] = new Vector.<Function>;
			
			var listeners:Vector.<Function> = _listeners[event];
			
			if( listeners.indexOf(listener) != -1 ) return;
			
			listeners.push( listener );
		}
		
		
		public function removeEventListener(event:uint, listener:Function):void
		{
			if(!_listeners[event]) return;
			
			var listeners:Vector.<Function> = _listeners[event];
			var index:int = listeners.indexOf(listener);
			
			if( index != -1 )
			{
				listeners.splice(index, 1);
			}
			
			if(listeners.length == 0) delete _listeners[event];
		}
		
		
		public function dispachEvent(event:uint, data:* = null):void
		{
			if(!_listeners[event]) return;
			
			var listeners:Vector.<Function> = _listeners[event];
			
			var i:int;
			for(i = 0; i < listeners.length; i++) listeners[i]( data );
		}
		
		
		public function destroy():void
		{
			var par:String;
			for(par in _listeners) 
			{
				_listeners[par].length = 0;
				delete _listeners[par];
			}
			
			_listeners = null;
				
		}
	}
}