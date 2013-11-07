package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import knoppen.George_Knop;
	import knoppen.William_Knop;
	
	/**
	 * ...
	 * @author Jaywalker
	 */
	public class StartScherm extends MovieClip
	{
		public static const Knop_GEDRUKT:String = "Knop_gedrukt";
		private var William_knop:William_Knop = new William_Knop();
		private var George_knop:George_Knop = new George_Knop();
		private var Titel:MovieClip = new _Titel();
		private var Titel_achtergrond:MovieClip = new _Titel_achtergrond();
		
		public function StartScherm(breed:int = 0, hoog:int = 0) 
		{
			//titel
			Titel_achtergrond.x = breed / 2; 
			Titel_achtergrond.y = hoog / 2;
			addChild(Titel_achtergrond);
			
			Titel.x = 280;
			Titel.y = 150;
			addChild(Titel);
			
			//knoppen positie
			William_knop.x = 20;
			William_knop.y = 300;
			
			George_knop.x = 230;
			George_knop.y = 300;
			
			addChild(William_knop);
			addChild(George_knop);
			
			this.width = breed;
			this.height = hoog;
		}
		
		
		
		
		
	}

}