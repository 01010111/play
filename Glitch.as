package  
{
	import org.flixel.*
	import flash.media.Sound
	import flash.media.SoundChannel
	import flash.net.URLRequest
	import com.greensock.TweenLite
	
	public class Glitch extends FlxState
	{
		public var floor:int
		public var sense:Number
		public var text1:FlxText
		public var text2:FlxText
		public var level:Number
		private var _gltch:FlxSprite
		private var _sound:Sound
		private var _channel:SoundChannel
		[Embed(source = "../assets/yotg.png")] public static var yotg:Class;
		
		public function Glitch() 
		{
			_sound = new Sound(new URLRequest("noise.mp3"));
			_channel = _sound.play(0,99);
			
			_gltch = new FlxSprite(0, 0);
			_gltch.loadGraphic(yotg, true, false, 250, 166);
			_gltch.addAnimation("0", [0]);
			_gltch.addAnimation("1", [1]);
			_gltch.addAnimation("2", [2]);
			_gltch.addAnimation("3", [3]);
			_gltch.addAnimation("4", [4]);
			_gltch.addAnimation("5", [5]);
			_gltch.addAnimation("6", [6]);
			_gltch.addAnimation("7", [7]);
			_gltch.addAnimation("8", [8]);
			_gltch.addAnimation("9", [9]);
			_gltch.addAnimation("10", [10]);
			_gltch.addAnimation("11", [11]);
			_gltch.addAnimation("12", [12]);
			_gltch.addAnimation("13", [13]);
			_gltch.addAnimation("14", [14]);
			_gltch.addAnimation("15", [15]);
			_gltch.addAnimation("16", [16]);
			_gltch.addAnimation("17", [17]);
			_gltch.addAnimation("18", [18]);
			_gltch.addAnimation("19", [19]);
			_gltch.addAnimation("20", [20]);
			_gltch.addAnimation("21", [21]);
			_gltch.addAnimation("22", [22]);
			_gltch.addAnimation("23", [23]);
			add(_gltch);
			
			floor = 20;
			
			sense = 2;
			
			text1 = new FlxText(0, 0, FlxG.width, null);
			text1.setFormat(null, 8, 0xffff0000, "left", 0xff000000);
			text1.alpha = 0;
			add(text1);
			
			text2 = new FlxText(0, 0, FlxG.width, null);
			text2.setFormat(null, 8, 0xffff0000, "right", 0xff000000);
			text2.alpha = 0;
			add(text2);
			
			// Disable Pause
			FlxG.lostFocusCallback = function():void {};
			FlxG.gotFocusCallback = function():void {};
		}
		
		override public function update():void
		{
			text1.text = "FLOOR:" + floor;
			
			text2.text = "SENSE:" + sense;
			
			level = FlxU.floor(((_channel.leftPeak + _channel.rightPeak) / 2) * 100);
			super.update();
			
			if (level < floor + (sense * 1)) _gltch.play("0");
			else if (level < floor + (sense * 1)) _gltch.play("1");
			else if (level < floor + (sense * 2)) _gltch.play("2");
			else if (level < floor + (sense * 3)) _gltch.play("3");
			else if (level < floor + (sense * 4)) _gltch.play("4");
			else if (level < floor + (sense * 5)) _gltch.play("5");
			else if (level < floor + (sense * 6)) _gltch.play("6");
			else if (level < floor + (sense * 7)) _gltch.play("7");
			else if (level < floor + (sense * 8)) _gltch.play("8");
			else if (level < floor + (sense * 9)) _gltch.play("9");
			else if (level < floor + (sense * 10)) _gltch.play("10");
			else if (level < floor + (sense * 11)) _gltch.play("11");
			else if (level < floor + (sense * 12)) _gltch.play("12");
			else if (level < floor + (sense * 13)) _gltch.play("13");
			else if (level < floor + (sense * 14)) _gltch.play("14");
			else if (level < floor + (sense * 15)) _gltch.play("15");
			else if (level < floor + (sense * 16)) _gltch.play("16");
			else if (level < floor + (sense * 17)) _gltch.play("17");
			else if (level < floor + (sense * 18)) _gltch.play("18");
			else if (level < floor + (sense * 19)) _gltch.play("19");
			else if (level < floor + (sense * 20)) _gltch.play("20");
			else if (level < floor + (sense * 21)) _gltch.play("21");
			else if (level < floor + (sense * 22)) _gltch.play("22");
			else _gltch.play("23");
			
			if (FlxG.keys.justReleased("UP"))
			{
				if (floor < 70) floor = floor + 1;
				text1.alpha = 1;
				TweenLite.to(text1, 2, { alpha:0 } );
			}
			
			if (FlxG.keys.justReleased("DOWN"))
			{
				if (floor > 0) floor = floor - 1;
				text1.alpha = 1;
				TweenLite.to(text1, 2, { alpha:0 } );
			}
			
			if (FlxG.keys.justReleased("LEFT"))
			{
				if (sense > 1.1) sense = (FlxU.floor((sense - 0.1)*10))/10;
				text2.alpha = 1;
				TweenLite.to(text2, 2, { alpha:0 } );
			}
			
			if (FlxG.keys.justReleased("RIGHT"))
			{
				if (sense < 4) sense = (FlxU.floor((sense + 0.1)*10))/10;
				text2.alpha = 1;
				TweenLite.to(text2, 2, { alpha:0 } );
			}
			
			//FlxG.watch(this, "level", "Level");
		}
		
	}

}