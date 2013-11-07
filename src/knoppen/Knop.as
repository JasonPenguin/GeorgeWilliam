package knoppen 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.ui.MouseCursor;
	/**
	 * ...
	 * @author Elroy
	 */
	public class Knop extends Sprite
	{
		protected var art:MovieClip; // art moet altijd van een andere class worden toegevoegd
		
		public function Knop() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			if (art != null)
			{
				art.addEventListener(MouseEvent.MOUSE_UP, los);
				art.addEventListener(MouseEvent.MOUSE_DOWN, druk);
				art.addEventListener(MouseEvent.MOUSE_OUT, uit);
				art.addEventListener(MouseEvent.MOUSE_OVER, aan);
				
				art.stop();
			}
			
			this.addEventListener(MouseEvent.CLICK, klik);
			this.buttonMode = true;
		}
		
		public function klik(e:MouseEvent):void 
		{
			
		}
		
		private function aan(e:MouseEvent):void 
		{
			art.gotoAndStop(2);
		}
		
		private function uit(e:MouseEvent):void 
		{
			art.gotoAndStop(1);
		}
		
		private function druk(e:MouseEvent):void 
		{
			art.gotoAndStop(3);
		}
		
		private function los(e:MouseEvent):void 
		{
			art.gotoAndStop(2);
		}
		
	}

}