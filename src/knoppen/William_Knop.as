package knoppen 
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jaywalker
	 */
	public class William_Knop extends Knop
	{
		
		public static const W_Knop_GEDRUKT:String = "w_knop_gedrukt";
		
		public function William_Knop() 
		{
			art = new _WKnop();
			addChild(art);
			
		}
		
		override public function klik(e:MouseEvent):void 
		{
			// deze wordt aangeroepen in: SpeelScherm
			dispatchEvent(new Event(W_Knop_GEDRUKT, true));
		}
		
	}

}