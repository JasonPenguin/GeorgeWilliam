package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.TextEvent;
	import flash.text.TextFieldType;
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.display.Graphics;
	
	/**
	 * ...
	 * @author Jaywalker
	 */
	public class TextWolk extends Sprite
	{
		//public var tekstwolk:MovieClip = new _TextWolk();
		public var _tekst:TextField = new TextField();
		public var x_positie:int;
		public var y_positie:int;
		public var format:TextFormat = new TextFormat();
		public var _width:int = 200;
		private var tekstballon:MovieClip = new MovieClip();
		
		public function TextWolk(x_positie:int,y_positie:int,tekst:String) 
		{
			tekstballon = new _TextWolk();
			addChild(tekstballon);
			
			format.size = 15;
			format.align = "center";
			
			_tekst.width = _width;
			_tekst.defaultTextFormat = format;
			
			this.x = x_positie;
			this.y = y_positie;
			
			this._tekst.text = tekst
			
			_tekst.width = tekstballon.width;
			_tekst.y = 40;
			
			_tekst.selectable = false;
			addChild(_tekst);
		}
		
		public function Update_text(tekst:String):void
		{
			this._tekst.text = tekst
		}
		

		
	}

}