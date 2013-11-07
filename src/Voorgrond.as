package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Elroy
	 */
	public class Voorgrond extends Sprite
	{
		private var sneeuwFlokje:MovieClip;
		private var timer:Timer;
		private var flokjes:Vector.<MovieClip> = new Vector.<MovieClip>;
		
		private var breed:Number, hoog:Number;
		private var situatie:int;
		private var wolk:MovieClip;
		
		public function Voorgrond(x:Number = 0, y:Number = 0, breed:Number = 0, hoog:Number = 0, situatie:int = 1) 
		{	
			this.x = x;
			this.y = y;
			this.breed = breed;
			this.hoog = hoog;
			this.situatie = situatie; // de situatie hangt af van het gekozen wezen
			
			switch(situatie) // 2 = sneeuwstorm
			{				// 1 = wolk
				case 1:
				default:
					wolk = new _Wolk();
					addChild(wolk);
					wolk.y += 6;
					break;
				case 2:
					timer = new Timer(300, 0);
					timer.addEventListener(TimerEvent.TIMER, tik);
					timer.start();
				break
			}
			
			this.mouseEnabled = false;
			this.mouseChildren = false;
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			switch(situatie)
			{
				case 1:
				default:
					wolk.x ++;
					if (wolk.x > breed) wolk.x = 0 - wolk.width;
					break;
				case 2:
					for (var i:int = 0; i < flokjes.length; i++) 
					{
						flokjes[i].x += flokjes[i].speedX;
						flokjes[i].y += flokjes[i].speedY;
						
						if (flokjes[i].y > hoog || flokjes[i].x > breed)
						{
							removeChild(flokjes[i]);
							flokjes.splice(i,1);
						}
					}
					break;
			}
		}
		
		private function tik(e:TimerEvent):void 
		{
			var beginPos:int = flokjes.length;
			var xPos:int = 0;
			for (var i:int = flokjes.length; i < beginPos + Math.ceil(breed / 18); i++) 
			{
				sneeuwFlokje = new _Flokje();
				
				flokjes.push(sneeuwFlokje);
				flokjes[i].speedX = Math.random() * 3;
				flokjes[i].speedY = 4 + Math.random() * 3;
				flokjes[i].x = (20 * xPos) - 80;
				flokjes[i].y = -flokjes[i].height - Math.random() * 4;
				flokjes[i].width -= Math.random() * 3;
				flokjes[i].height = flokjes[i].width;
				
				addChild(flokjes[i]);
				xPos ++;
			}	
		}	
	}
}