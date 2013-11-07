package knoppen 
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import SpeelScherm;
	import Speler;
	import flash.events.MouseEvent
	
	/**
	 * ...
	 * @author Elroy
	 */
	public class LaadKnop extends Knop
	{
		public var Laad_knop:MovieClip = new _Laden;
		public var speler:Speler;
		
		public function LaadKnop() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(Laad_knop);
			speler = SpeelScherm.speler;
		}
		
		// functie voor het laden
		override public function klik(e:MouseEvent):void 
		{
			Speler.Save_array = OpslaanKnop.saveDataObject.data.SavedStats;
			speler.Laden();	
		}
	}

}