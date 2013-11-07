package knoppen 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Elroy
	 */
	public class EetKnop extends Knop
	{
		//private var appel:MovieClip = new _Appel;
		
		public static const Eet_GEDRUKT:String = "Eet_gedrukt";
		
		public function EetKnop(x:Number = 0, y:Number = 0, voedsel:int = 1) 
		{
			switch(voedsel)
			{
				case 1:
				default:
					art = new _Appel();
					break;
				case 2:
					art = new _Vis();
					art.width /= 2; // vis was te groot :p
					art.height /= 2; //
					break;
			}
			
			this.x = x;
			this.y = y;
			
			addChild(art);
		}
		
		override public function klik(e:MouseEvent):void 
		{
			// deze wordt aangeroepen in: SpeelScherm
			dispatchEvent(new Event(Eet_GEDRUKT, true));
		}
	}

}