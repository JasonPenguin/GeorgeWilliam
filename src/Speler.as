package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	/**
	 * ...
	 * @author Elroy
	 */
	public class Speler extends MovieClip
	{
		//Tekst
		public var Restart:TextField = new TextField();
		
		// Booleans
		public var verveeld:Boolean, slapen:Boolean, verloren:Boolean = false;
		
		// int
		public var honger:int = 100, dikheid:int = 0;
		public var verveling:int = 0;
		public var moeheid:int = 0;
		
		// Timer
		public var tijdklokje:Timer;
		public var slaapklokje:Timer;
		
		// MovieClips
		public var player_1:MovieClip;
		private var kaboem:MovieClip = new _Kaboem();
		private var rook:MovieClip = new _Smoke();
		
		public static var Save_array:Array; // wordt naar save class gestuurd
		
		private var praten:Function;
		
		public function Speler(soort_monster:int = 1, seconde:int = 10, praten:Function = null) 
		{
			// Functie praten
			this.praten = praten;
			
			// tijdklokje (een soort update waarin de variabelen veranderen)
			tijdklokje = new Timer(seconde * 1000, 0);
			tijdklokje.start();
			tijdklokje.addEventListener(TimerEvent.TIMER, tiktak);
			
			// slaapklokje (voor de slaapfunctie van de speler)
			slaapklokje = new Timer(1000, moeheid);
			slaapklokje.addEventListener(TimerEvent.TIMER, uitrusten);
			slaapklokje.addEventListener(TimerEvent.TIMER_COMPLETE, wakker);
			
			switch (soort_monster) 
			{
				//1 blij
				//2 moe
				//3 niet blij
				//4 honger
				//5 slaap
				//6 verveeld
				//7 erg verveeld
				case 1:
				default:
					player_1 = new _George
					addChild(player_1)
					honger = 100;
					dikheid = 0;
					verveeld = false;
					player_1.hoofd.stop();
					player_1.lichaam.stop();
				break;
				case 2:
					player_1 = new _William
					addChild(player_1)
					honger = 100;
					dikheid = 0;
					verveeld = false;
					player_1.hoofd.stop();
					player_1.lichaam.stop();
				break;
			}
		}
		
		// soort van global time waarin variabelen omlaag of omhoog gaan
		private function tiktak(e:TimerEvent):void
		{
			if (honger > 0) honger -= 10; 
			
			if (dikheid > 0) dikheid -= 10; // als de speler vet heeft dan valt hij af
			if (dikheid < 50) player_1.lichaam.gotoAndStop(1); // buik 1 (normaal)
			if (dikheid > 50 && dikheid < 100) player_1.lichaam.gotoAndStop(2); // buik 2 (beetje dik)
			
			if (!slapen)
			{
				if (moeheid < 150) moeheid += 5; // limit = 150
				if (verveling < 200) verveling += 10; // limit = 200
				
				if (verveling > 80) player_1.hoofd.gotoAndStop(6); // verveeld
				if (verveling > 120) player_1.hoofd.gotoAndStop(7); // erg verveeld
				if (verveling < 80 && dikheid < 50) player_1.hoofd.gotoAndStop(1); // hij kijkt weer blij als hij dun is en plezier heeft
				
				if (honger < 50) player_1.hoofd.gotoAndStop(4); // honger gezicht
			}
			
			trace("honger =", honger);
			trace("moeheid =", moeheid);
			trace("dikheid =", dikheid);
			trace("verveling =", verveling, verveeld);
			
			praten();
			if (verveling >= 200) dood("verveeld");
		}
		
		public function aaien():void
		{
			if (verveling > 0 && !slapen && !verloren)
			{
				// gaat random zodat het niet te snel omlaag gaat
				if (Math.random() < .25) verveling --;
				
				praten("dit vindt ik lekker");
			}
			else 
			{
				praten("zo is het wel weer genoeg");
			}
		}
		
		//slaapfunctie start de "slaap timer" 
		public function Bedtijd():void
		{
			if (moeheid > 0 && !slapen && !verloren)
			{
				slaapklokje.repeatCount = moeheid;
				slaapklokje.reset();
				slaapklokje.start();
				slapen = true;
				player_1.hoofd.gotoAndStop(5); // slapen
			}
			
		}
		
		//speler word wakker
		private function wakker(e:TimerEvent):void 
		{
			slapen = false;
			player_1.hoofd.gotoAndStop(1); // kijkt weer normaal
		}
		
		//moeheid gaat omlaag
		private function uitrusten(e:TimerEvent):void 
		{
			moeheid --;
		}
		
		//eet functie
		public function eten(honger:int):void
		{
			if (!verloren)
			{
				if (this.honger > 100 && dikheid < 200) dikheid += 5; // hij wordt dikker
				praten("Jummy Jummy")
				if (!slapen && this.honger < 250)
				{
					this.honger += honger;
					
					if (this.honger < 50 && moeheid < 80) player_1.hoofd.gotoAndStop(4); // hongerig gezicht
					if (this.honger > 100) player_1.hoofd.gotoAndStop(1); // normaal gezicht
					
					if (dikheid > 50 && dikheid < 100)
					{
						player_1.lichaam.gotoAndStop(2);
						if (moeheid < 80) player_1.hoofd.gotoAndStop(3); // kijkt niet blij als hij niet moe is
						praten("ik zit nu wel vol");
					}
					
					if (dikheid > 100)
					{
						player_1.lichaam.gotoAndStop(3);
						if (moeheid < 80) player_1.hoofd.gotoAndStop(3); // kijkt niet blij als hij niet moe is
						praten("dit is wel een beetje teveel");
					}
				}
				
				if (dikheid >= 200) dood("te dik");
			}
		}
		
		public function Opslaan():void
		{
			Save_array = new Array(honger,moeheid,dikheid,verveling);
		}
		
		public function Laden():void
		{
			
			honger = Save_array[0];
			moeheid = Save_array[1];
			dikheid = Save_array[2];
			verveling = Save_array[3];
			verveeld = Save_array[4];
			
			if (dikheid > 50 && dikheid < 100 && !slapen)
			{
				player_1.lichaam.gotoAndStop(2);
				if (moeheid < 80) player_1.hoofd.gotoAndStop(3); // kijkt niet blij als hij niet moe is
			}
			
			if (dikheid > 100 && !slapen)
			{
				player_1.lichaam.gotoAndStop(3);
				if (moeheid < 80) player_1.hoofd.gotoAndStop(3); // kijkt niet blij als hij niet moe is
			}
		}
		
		private function dood(hoe:String="te dik"):void 
		{
			verloren = true;
			player_1.alpha = 0; // speler is er niet meer
			tijdklokje.removeEventListener(TimerEvent.TIMER, tiktak);
			
			switch(hoe)
			{
				case "te dik":
					addChild(kaboem);
					kaboem.scaleX = 4;
					kaboem.scaleY = 4;
					praten(" ");
					addEventListener(Event.ENTER_FRAME, animatieExplosie);
					break;
				case "verveeld":
					praten("ik kom nooit meer terug");
					addChild(rook); // een verdwijn wolkje
					addEventListener(Event.ENTER_FRAME, animatieRook);
					break;
			}
		}
		

		
		private function animatieRook(e:Event):void 
		{
			if (rook.currentFrame == rook.totalFrames) {
				removeChild(rook);
				removeEventListener(Event.ENTER_FRAME, animatieRook);
			}
		}
		
		private function animatieExplosie(e:Event):void 
		{
			if (kaboem.currentFrame == kaboem.totalFrames) {
				removeChild(kaboem);
				removeEventListener(Event.ENTER_FRAME, animatieExplosie);
			}
		}
		
	}

}