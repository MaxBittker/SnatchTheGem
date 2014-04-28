package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var player:Player;
		private var floor:FlxTileblock;
		private var platform:FlxTileblock;
		public var gem:FlxButton;
		public var cursor:FlxEmitter;
		public var sparx:FlxParticle;
		public var hand:FlxSprite;
		public var WAIT:int = 2000+(Math.random()*10000);
		public var bg:FlxSprite;
		public var haha:FlxSound;
		public var CHUNE:FlxSound;
		public var success:int = 0;
		public var React: int = 1000;
		public var score: int = 0;
		public var scoreD: FlxText;
		public var flavor: FlxText;
		public var resetB: FlxButton;
		public var toasty: FlxSound;
		
		[Embed(source = "../assets/gem.png")]public var GemPNG:Class;
		[Embed(source = "../assets/hands.png")]public var Hand:Class;
		[Embed(source = "../assets/back_animated.png")]public var BgPng:Class;
		[Embed(source = "../assets/demon_laugh.mp3")]public var HaHa:Class;
		[Embed(source = "../assets/wizware_1.mp3")]public var tune:Class;
		//[Embed(source = "../assets/stunts.mp3")]public var tune:Class;
		[Embed(source = "../assets/toasty.mp3")]public var Toasty:Class;
		
		
public function myButtonClick():void
{
//Put code you'd like to execute when the button is clicked below

gem.flicker(1.5);
remove(flavor, false);
flavor = new FlxText(94, 200, 100, "YOU GOT IT!");
add(flavor);
if (success == 0)
{
toasty.play();
success = 1;
score = (score + 1);
remove(scoreD, false);
scoreD = new FlxText(150, 0, 20, ((score).toString()));
add(scoreD)
super.update();
}


super.update();

}

public function reset():void
{
gem.x = 999;
hand.frame = 0;
success = 0;
WAIT = 2000 + (Math.random() * 10000);
React= 1000;
score = 0;
remove(scoreD, false);
scoreD = new FlxText(150, 0, 20, ((score).toString()));
remove(flavor, false);

resetB.active = false;
resetB.exists = false;
add(scoreD);
super.update();
FlxG.log("RESET!!!");

}
		
			
		override public function create():void
		{
			//FlxG.bgColor = 0xff111954;
			
			cursor = new FlxEmitter(0, 0, 4);
			scoreD = new FlxText(150, 0, 20, ((score).toString()));
			sparx = new FlxParticle();
			sparx.makeGraphic(4, 4, 0xffffffff);
			
			
			gem = new FlxButton( -1000, 100, "", myButtonClick);
			
			bg = new FlxSprite(0, 0, BgPng);
			bg.loadGraphic(BgPng, true, false, 160, 240, false);
			bg.frames = 3;
			bg.frame = 0;
			bg.addAnimation("anim", [0, 1, 2], 10, true);
			bg.play("anim");
			add(bg);
			add(new FlxText(0,0,100,"SNATCH THE GEM!"));
		
			
			haha = new FlxSound();
			haha.loadEmbedded(HaHa, false, false);
			
			CHUNE = new FlxSound();
			CHUNE.loadEmbedded(tune, true, false);
			
			toasty = new FlxSound();
			toasty.loadEmbedded(Toasty, false, false);
			
			CHUNE.play();
			hand = new FlxSprite(34, 80, Hand);
			hand.loadGraphic(Hand, true, false, 103, 85, false);
			hand.frames = 2;
			hand.frame = 0;
		
			gem.loadGraphic(GemPNG, false, false, 31, 48, false);
		
			resetB = new FlxButton(66, 50, "again?", reset);
			resetB.makeGraphic(50, 20, 0xffffffff, false); 
			
			add(hand);
			sparx.exists = false;
			
			
			add(sparx);
			
			add(gem);
			add(scoreD);
			cursor.add(sparx);
			sparx = new FlxParticle();
			sparx.makeGraphic(1, 4, 0xffffffff);
			cursor.add(sparx);
			sparx = new FlxParticle();
			sparx.makeGraphic(4, 1, 0xffffffff);cursor.add(sparx);
			sparx = new FlxParticle();
			sparx.makeGraphic(1, 4, 0xffffffff);
			cursor.add(sparx);
			add(cursor);
			//cursor.start();
		
		
			
            
			
		}
		
		override public function update():void
		{
			
			if (FlxG.mouse.pressed() == true && (WAIT > 100) && (success == 0))
			{WAIT = 1000 + (Math.random() * 5000); }
			
			WAIT = WAIT - (1000 * FlxG.elapsed);
			if (WAIT < 0)
			{
				
			   hand.frame = 1;
		
				gem.x = 75;
				
			}
			if( WAIT < (-1*React) && success == 0)
			
			{gem.x = 999;
			haha.play();
			remove(flavor, false);
			flavor = new FlxText(94, 200, 200, "TOO SLOW!");
			add(flavor);
			
			add(resetB);
			resetB.active = true;
			resetB.exists = true;
			
			hand.frame = 0; 
			}
			
			cursor.x = FlxG.mouse.screenX*2;	
			cursor.y = FlxG.mouse.screenY*2;	
			
			
			
			if (WAIT < -(React + 2000) && success == 1)
			{
			remove(flavor, false);
			
			if(React > 450)
			{React = (React * .75); }
			else
			{React = React - 20 };
			
			WAIT = 3000 + (Math.random() * 6000);
			success = 0;
			
			gem.x = 999;
			hand.frame = 0;
			
			}
			
			FlxG.log(React);
			
			cursor.emitParticle();
		
			super.update();
		}
		
	}

}