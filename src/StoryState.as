package
{
	import org.flixel.*;
	
	public class StoryState extends FlxState
	{
		//Variables got here
		private var rbc:RedBloodCells;
		private var rbc2:RedBloodCells;
		private var rbc3:RedBloodCells;
		private var tilemap:FlxTilemap;
		private var bg:FlxSprite = new FlxSprite();
		private var t:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false
		private var switchScreen:Boolean = false
		
		public function StoryState()
		{
			super();
		}
		
		override public function create():void
		{
			bg.loadGraphic(Registry.bground,false,false,400,800);
			add(bg);
			
			initRBCs();
			
			tilemap = new FlxTilemap();
			tilemap.loadMap(new Registry[Registry.areas[1]],Registry.cellWalls,8,8,0,0,1,1);
			add(tilemap);
			
			var instruct1:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-225, 300, "Viruses have invaded Humans");
			instruct1.setFormat(null,15,0xFFFFFF, "center");
			add(instruct1);
			
			var logo1:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-85, 300, "It your job to eradicate them!");
			logo1.setFormat(null,15,0xFFFFFF, "center");
			add(logo1);
			
			var logo2:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-65, 300, "You'll be shrunken down to");
			logo2.setFormat(null,15,0xFFFFFF, "center");
			add(logo2);
			
			var logo3:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-45, 300, "microscopic size and injected");
			logo3.setFormat(null,15,0xFFFFFF, "center");
			add(logo3);
			
			var logo4:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-25, 300, "into the blood stream.");
			logo4.setFormat(null,15,0xFFFFFF, "center");
			add(logo4);
			
			var logo5:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-5, 300, "GOOD LUCK!");
			logo5.setFormat(null,15,0xFFFFFF, "center");
			add(logo5);
			
			var logo6:FlxText = new FlxText(FlxG.width*0.5-175,FlxG.height*0.5+25, 350, "Arrow Keys to Move");
			logo6.setFormat(null,15,0xFFFFFF, "center");
			add(logo6);
			
			var logo7:FlxText = new FlxText(FlxG.width*0.5-180,FlxG.height*0.5+50, 350, "Space to Fire");
			logo7.setFormat(null,15,0xFFFFFF, "center");
			add(logo7);
			
			var instruct3:FlxText = new FlxText(FlxG.width*0.5-175,FlxG.height-30, 350, "PRESS [x] TO GET INJECTED");
			instruct3.setFormat(null,15,0xFFFFFF, "center");
			add(instruct3);
		}
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("X"))
			{
				switchScreen = true;
				FlxG.play(Registry.flash,0.8);
			}
			
			if(switchScreen)
			{
				
				FlxG.flash(0xffffffff,2);
				FlxG.fade(0xFF000000,2);
				delay(2);
				if(!timerSet)
				{
					FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5
				}
			}
			
			super.update();
		}
		
		private function initRBCs():void
		{
			for(var i:int = 0;i<20;i++)
			{
				rbc = new RedBloodCells(Math.random()*23+8,Math.random()*27-20)
				Registry.rbcGroup.add(rbc);
				add(rbc);
			}
			
			for(var ii:int = 0;ii<20;ii++)
			{
				rbc2 = new RedBloodCells(Math.random()*23+8,Math.random()*27-20)
				rbc2.velocity.y = Math.random()*10+20;
				rbc2.alpha = .8;
				Registry.rbcGroup2.add(rbc2);
				add(rbc2);
			}
			
			for(var iii:int = 0;iii<20;iii++)
			{
				rbc3 = new RedBloodCells(Math.random()*23+8,Math.random()*27-20)
				rbc3.velocity.y = Math.random()*10+10;
				rbc3.alpha = .6;
				Registry.rbcGroup3.add(rbc3);
				add(rbc3);
			}
		}
		
		private function delay(howlong:int):void
		{	
			if(!timerSet)
			{
				t.start(howlong);
			}
			timerSet = true;
			if(t.finished)
			{
				t.stop();
				timerSet = false;
			}			
		}
	}
}