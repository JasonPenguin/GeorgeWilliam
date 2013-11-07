package knoppen 
{
	import flash.events.Event;
	import Speler;
	import SpeelScherm;
	import flash.net.SharedObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Elroy
	 */
	public class OpslaanKnop extends Knop
	{
		public var Opslaan_knop:MovieClip = new _Opslaan;
		public static var saveDataObject:SharedObject = SharedObject.getLocal("test");
		public var speler:Speler;
		
		public function OpslaanKnop() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(Opslaan_knop);
			speler = SpeelScherm.speler;
		}
		
		override public function klik(e:MouseEvent):void 
		{
			if (!speler.verloren)
			{
				speler.Opslaan();
				
				saveDataObject.data.SavedStats = Speler.Save_array;
				saveDataObject.flush();
				saveDataObject.close();
			}
			else
			{
				this.alpha = 0.5;
			}
		}
		
	}

}