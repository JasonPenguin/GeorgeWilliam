package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Elroy
	 */
	public class Achtergrond extends Sprite
	{
		private var g:Sprite = new Sprite(); // g = voorgrond
		private var achtergrond:MovieClip;
		
		private var stageEnd:int;
		
		public function Achtergrond(x:Number = 0, y:Number = 0, breed:Number = 0, hoog:Number = 0, soort:int = 1) 
		{
			switch(soort)
			{
				case 1:
				default:
					achtergrond = new _Land();
					break;
				case 2:
					achtergrond = new _Sneeuw();
					break;
			}
			addChild(achtergrond);
			achtergrond.width = breed;
			achtergrond.height = hoog;
			
			g.graphics.beginFill(0xFFFFFF, 0.12);
			g.graphics.drawRect(0, 0, breed, hoog);
			addChild(g);
			
			stageEnd = breed;
		}
		
	}

}