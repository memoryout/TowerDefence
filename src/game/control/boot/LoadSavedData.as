package game.control.boot
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import game.task.SimpleTask;
	import game.task.TaskEvent;
	
	public class LoadSavedData extends SimpleTask
	{
		public var data:			ByteArray;
		
		public function LoadSavedData()
		{
			super();
		}
		
		override public function run(...args):void
		{
			var url:String = args[0];
			
			var file:File = new File();
			file.resolvePath( url );
			
			var fs:FileStream = new FileStream();
				
			try
			{
				fs.open(file, FileMode.READ);
				
				data = new ByteArray();
				fs.readBytes( data, 0, fs.bytesAvailable );
				
				this.dispachLocalEvent(TaskEvent.COMPLETE, this );
			}
			catch(e:Error)
			{
				this.dispachLocalEvent(TaskEvent.ERROR, this );
			}
		}
		
		override public function destroy():void
		{
			data = null;
			super.destroy();
		}
	}
}