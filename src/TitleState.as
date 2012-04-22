package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
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
			
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.title);
			bg.loadGraphic(Registry.bground,false,false,400,800);
			add(bg);
			
			initRBCs();
			
			tilemap = new FlxTilemap();
			tilemap.loadMap(new Registry[Registry.areas[1]],Registry.cellWalls,8,8,0,0,1,1);
			add(tilemap);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-110, 200, "Tiny Defender");
			logo.setFormat(null,20,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-50, 300, "PRESS 1 FOR EASY MODE");
			instruct.setFormat(null,15,0xFFFFFF, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-30, 300, "PRESS 2 FOR HARD MODE");
			instruct2.setFormat(null,15,0xFFFFFF, "center");
			add(instruct2);
		}
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("ONE"))
			{
				switchScreen = true;
				Registry.difficulty = 0;
				FlxG.play(Registry.flash,0.8);
			}
			if(FlxG.keys.justPressed("TWO"))
			{
				switchScreen = true;
				Registry.difficulty = 1;
				FlxG.play(Registry.flash,0.8);
			}
			
			if(switchScreen)
			{
				
				FlxG.flash(0xffffffff,2);
				FlxG.fade(0xFF000000,2);
				delay(2);
				if(!timerSet)
				{
					FlxG.switchState(new StoryState());	//<--- using new state change code for flixel 2.5
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