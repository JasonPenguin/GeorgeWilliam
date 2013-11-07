/*
	param breed:
		Dit is hoe breed het scherm moet zijn. Alle posities van de 
		objecten worden bepaald met behulp van deze parameter.
	param hoog:
		Dit is het zelfde principe van de breed parameter maar dit
		is de hoogte van het scherm.
	param _scale:
		Hiermee kan het scherm vergroot worden.
*/
package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import knoppen.EetKnop;
	import knoppen.OpslaanKnop;
	import knoppen.SlaapKnop;
	/**
	 * ...
	 * @author Elroy
	 */
	public class SpeelScherm extends MovieClip
	{
		
		private var naam:String; // de naam wordt aangepast aan de wezen
		private var Tekstwolk:TextWolk
		
		private var opslaan_knop:OpslaanKnop = new OpslaanKnop();
		public static var speler:Speler; // moet ook in andere classes worden aangeroepen
		private var achtergrond:Achtergrond;
		
		private var instellingen:Instellingen = new Instellingen();
		private var actieMenu:ActieMenu;
		
		private var drukOpSpeler:Boolean = false; // wordt gebruikt voor mouseEvents
		
		private var handCursor:MovieClip = new _Handschoen();
		private var voorgrond:Voorgrond
		
		private var wezen:int;
		
		public function SpeelScherm(x:Number = 0, y:Number = 0, breed:Number = 0, hoog:Number = 0, _scale:Number = 1, wezen:int = 1) 
		{
			// positie
			this.x = x;
			this.y = y;
			
			//Naam doorgeven
			this.wezen = wezen;
			if (wezen == 1) naam = "George";
			if (wezen == 2) naam = "William";
			
			Tekstwolk = new TextWolk(8, 40, "Hallo ik ben " + naam);
			
			// vergroting van het scherm
			this.scaleX = _scale;
			this.scaleY = _scale;
			
			// achtergrond
			achtergrond = new Achtergrond(0, 0, breed, hoog, wezen);
			addChild(achtergrond);
			
			// speler
			speler = new Speler(wezen, 10, praten);
			addChild(speler);
			speler.x = breed / 2; // plaatst speler in het
			speler.y = hoog / 2; // midden van het scherm
			
			// voorgrond
			voorgrond = new Voorgrond(0, 0, breed, hoog, wezen);
			addChild(voorgrond);
			
			// instellingen
			addChild(instellingen);
			
			// actieMenu
			actieMenu = new ActieMenu(0, 0, breed, hoog / 6, 40, 1, 0xFFFFFF, 0x0, 0.5, wezen);
			addChild(actieMenu);
			actieMenu.y = hoog - actieMenu.height; // plaatst onderaan het scherm
			
			// dispatchEvents
			actieMenu.addEventListener(EetKnop.Eet_GEDRUKT, handelEetKnop);
			actieMenu.addEventListener(SlaapKnop.Slaap_GEDRUKT, handelSlaapKnop);
			
			// mouseEvents
			addEventListener(MouseEvent.MOUSE_DOWN, muisIngedrukt);
			addEventListener(MouseEvent.MOUSE_UP, muisLos);
			addEventListener(MouseEvent.MOUSE_MOVE, muisBeweeg);
			
			// andereEvents
			addEventListener(Event.ENTER_FRAME, loop);
			
			// cursor
			addChild(handCursor);
			handCursor.alpha = 0;
			handCursor.stop();
			handCursor.mouseEnabled = false;
			handCursor.mouseChildren = false;
			
			
			//tekstwolk
			addChild(Tekstwolk);
		}
		
		private function handelSlaapKnop(e:Event):void 
		{
			speler.Bedtijd(); // slaapfunctie van speler
		}
		
		private function handelEetKnop(e:Event):void
		{
			speler.eten(5); // param = honger
		}
		
		private function muisIngedrukt(e:MouseEvent):void 
		{
			// als de muis zich op de speler bevind
			if (speler.hitTestPoint(mouseX, mouseY, true)) drukOpSpeler = true;
		}
		
		private function muisLos(e:MouseEvent):void 
		{
			drukOpSpeler = false;
			
			handCursor.gotoAndStop(1); // verandering als je muis loslaat
		}
		
		private function muisBeweeg(e:MouseEvent):void 
		{
			// beweeg de muis om de speler te aaien
			if (drukOpSpeler && speler.hitTestPoint(mouseX, mouseY, true) && !speler.verloren) {
				speler.aaien();
				handCursor.play(); // verandering als je aait
			}
		}
		
		private function loop(e:Event):void 
		{
			// volgt de muis
			handCursor.x = mouseX;
			handCursor.y = mouseY;
			
			// muis verandering van speler aaien
			if (speler.hitTestPoint(mouseX, mouseY, true) && !speler.verloren)
			{
				handCursor.alpha = 1;
				Mouse.hide();
			}
			else if(handCursor.alpha == 1)
			{
				handCursor.alpha = 0;
				Mouse.show();
			}
			
			// dit voorkomt dat drukOpSpeler niet true staat wanneer de muis niet op de speler staat
			if (!speler.hitTestPoint(mouseX, mouseY, true)) {
				drukOpSpeler = false;
				handCursor.gotoAndStop(1);
			}
		}
		
		public function praten(tekst:String = null):void 
		{
			if (tekst != null) Tekstwolk.Update_text(tekst);
			
			if (tekst == null) // standaart teksten als tekst null is
			{
				switch(speler.player_1.hoofd.currentFrame)
				{
					case 1: // blij
						if (Math.random() < .50) Tekstwolk.Update_text("jij bent mijn beste vriend"); // 50% kans op
						else Tekstwolk.Update_text("wat een mooie dag vandaag");				// welke tekst je krijgt
						break;
					case 2: // moe
						if (Math.random() < .50) Tekstwolk.Update_text("ik ben moe"); // 50% kans op
						else Tekstwolk.Update_text("ik val bijna in slaap");		// welke tekst je krijgt
						break;
					case 3: // niet blij
						if (Math.random() < .50) Tekstwolk.Update_text("ik zit te vol"); // 50% kans op
						else Tekstwolk.Update_text("ik ben wat aangekomen");		// welke tekst je krijgt
						break;
					case 4: // honger
						if (Math.random() < .50) Tekstwolk.Update_text("mag ik wat eten?"); // 50% kans op
						else Tekstwolk.Update_text("ik heb honger!");					// welke tekst je krijgt
						break;
					case 5: // slapen
						Tekstwolk.Update_text(" "); // hij praat niet in zijn slaap -.-
						break;
					case 6: // verveeld
						if (Math.random() < .50) Tekstwolk.Update_text("jij bent saai"); // 50% kans op
						else Tekstwolk.Update_text("saaai!");						  // welke tekst je krijgt
						break;
					case 7: // erg verveeld
						if (Math.random() < .50) Tekstwolk.Update_text("misschien ga ik weglopen"); // 50% kans op
						else Tekstwolk.Update_text("ik verveel me dood!");					// welke tekst je krijgt
						break;
				}
			}
		}
		
	}

}