package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import knoppen.George_Knop;
	import knoppen.William_Knop;
	/**
	 * ...
	 * @author Elroy
	 */
	[SWF(width=640, height=480)]
	public class Main extends Sprite
	{
		private var speelscherm:SpeelScherm;
		private var startscherm:StartScherm;
		
		public function Main() 
		{
			startscherm = new StartScherm(stage.stageWidth, stage.stageHeight);
			addChild(startscherm);
			
			startscherm.addEventListener(William_Knop.W_Knop_GEDRUKT, W_handelStartKnop);
			startscherm.addEventListener(George_Knop.G_Knop_GEDRUKT, G_handelStartKnop);
		}
		
		private function G_handelStartKnop(e:Event):void 
		{
			removeChild(startscherm);
			speelscherm = new SpeelScherm(0, 0, stage.stageWidth, stage.stageHeight, 1, 1);
			addChild(speelscherm); // de speelscherm ingestelt voor George
		}
		
		private function W_handelStartKnop(e:Event):void 
		{
			removeChild(startscherm);
			speelscherm = new SpeelScherm(0, 0, stage.stageWidth, stage.stageHeight, 1, 2);
			addChild(speelscherm); // de speelscherm ingestelt voor William
			
		}
		
	}

}