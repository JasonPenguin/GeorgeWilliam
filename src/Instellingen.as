package  
{
	import flash.display.Sprite;
	import knoppen.LaadKnop;
	import knoppen.OpslaanKnop;
	/**
	 * ...
	 * @author Elroy
	 */
	public class Instellingen extends Sprite
	{
		public var opslaan_knop:OpslaanKnop = new OpslaanKnop;
		public var laad_knop:LaadKnop = new LaadKnop;
		
		public function Instellingen() 
		{
			laad_knop.x = 600;
			laad_knop.y = 30;
			addChild(laad_knop);
			
			opslaan_knop.x = 550;
			opslaan_knop.y = 30;
			addChild(opslaan_knop);
		}
		
	}

}