/*
 * param x
 * 		de x positie van deze class
 * param y
 * 		de y positie van deze class
 * param breed
 * 		de breedte van deze class
 * param hoog
 * 		de hoogte van deze class
 * param tussenRuimte
 * 		de tussenRuimte van de uiteindes van het scherm
 * param lijnDikte
 * 		de dikte van de lijn die deze class omlijnt
 * param kleur
 * 		de achtergrond kleur van deze class
 * param lijnKleur
 * 		de kleur van de lijn die deze class omlijnt
 * param zichtbaarheid
 * 		de transparantie van de achtergrond kleur
*/
package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import knoppen.EetKnop;
	import knoppen.SlaapKnop;
	/**
	 * ...
	 * @author Elroy
	 */
	public class ActieMenu extends Sprite
	{
		private var eet:EetKnop, slaap:SlaapKnop; // de knoppen
		
		// een lijn om de class heen
		private var omlijn:Sprite = new Sprite();
		
		public function ActieMenu(x:Number = 0, y:Number = 0, breed:Number = 0, hoog:Number = 0, tussenRuimte:int = 40, lijnDikte:int = 1, kleur:uint = 0xFFFFFF, lijnKleur:uint = 0x0, zichtbaarheid:Number = 1, gekozenWezen:int = 1)
		{
			// positie
			this.x = x;
			this.y = y;
			
			// omlijn
			if (lijnDikte > 0) omlijn.graphics.lineStyle(lijnDikte, lijnKleur);
			omlijn.graphics.beginFill(kleur, zichtbaarheid);
			omlijn.graphics.drawRect(0, 0, breed - 1, hoog - 1); // -1 om in het scherm te houden
			omlijn.graphics.endFill();
			addChild(omlijn);
			
			// eetknop
			eet = new EetKnop(0, 0, gekozenWezen);
			addChild(eet);
			eet.x = tussenRuimte; // aan linkerkant van scherm
			eet.y = this.height / 2 - eet.height / 2;
			
			// slaapknop
			slaap = new SlaapKnop();
			addChild(slaap);
			slaap.x = this.width - slaap.width - tussenRuimte; // aan rechterkant van het scherm
			slaap.y = this.height / 2 - slaap.height / 2;
		}
		
	}

}