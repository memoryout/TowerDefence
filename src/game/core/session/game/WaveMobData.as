package game.core.session.game
{
	import game.core.data.StaticWaveMobData;
	import game.interfaces.IMobData;
	import game.interfaces.IWaveMobData;
	
	public class WaveMobData implements IWaveMobData
	{
		
		private var _mobData:			IMobData;
		private var _waveMobData:		StaticWaveMobData;
		
		public function WaveMobData()
		{
			
		}
		
		public function setStaticData(data:StaticWaveMobData):void
		{
			_waveMobData = data;
		}
		
		public function setModStaticData(mob:IMobData):void
		{
			_mobData = mob;
		}
		
		public function clear():void
		{
			_waveMobData = null;
			_mobData = null;
		}
		
		public function get id():uint
		{
			return _waveMobData.id;
		}
		
		public function get mobData():IMobData
		{
			return _mobData;
		}
	}
}