package knoppen 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Elroy
	 */
	public class SlaapKnop extends Knop
	{	
		public static const Slaap_GEDRUKT:String = "Slaap_gedrukt";
		
		public function SlaapKnop(x:Number = 0, y:Number = 0)
		{
			art = new _Bed;
			
			this.x = x;
			this.y = y;
			
			addChild(art);
		}
		
		override public function klik(e:MouseEvent):void 
		{
			// deze wordt aangeroepen in: SpeelScherm
			dispatchEvent(new Event(Slaap_GEDRUKT, true));
		}
		
	}

}