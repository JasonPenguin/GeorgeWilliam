package knoppen 
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jaywalker
	 */
	public class George_Knop extends Knop
	{
		public static const G_Knop_GEDRUKT:String = "g_knop_gedrukt";
		
		public function George_Knop() 
		{
			art = new _GKnop();
			addChild(art);
		}
		
		override public function klik(e:MouseEvent):void 
		{
			// deze wordt aangeroepen in: SpeelScherm
			dispatchEvent(new Event(G_Knop_GEDRUKT, true));
		}

		
		
		
	}

}