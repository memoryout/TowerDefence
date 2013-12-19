package game.core.session
{
	import game.interfaces.IUserInfo;
	
	public class UserInfo implements IUserInfo
	{
		private var _level:		uint;
		private var _exp:		Number;
		private var _name:		String;
		
		public function UserInfo()
		{
			_level = 1;
			_exp = 0;
			_name = "no name";
		}
		
		
		public function setLevel(value:uint):void
		{
			_level = value;
		}
		
		public function setExp(value:Number):void
		{
			_exp = value;
		}
		
		public function setName(value:String):void
		{
			_name = value;
		}
		
		public function get level():uint
		{
			return _level;
		}
		
		public function get exp():Number
		{
			return _exp;
		}
		
		public function get name():String
		{
			return _name;
		}
	}
}