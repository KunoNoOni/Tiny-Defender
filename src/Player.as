package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var bulletArray:Array;
		private var bulletID:int = 0;
		private var bullet:FlxSprite;
		
		
		public function Player(X:Number=0, Y:Number=0)
		{
			super(X*8,Y*8);
			loadGraphic(Registry.player,true,true,8,8);
		}
		
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			
			if(FlxG.keys.LEFT)
			{
				velocity.x = -50;
			}
			
			if(FlxG.keys.RIGHT)
			{
				velocity.x = 50;
			}
			
			if(FlxG.keys.UP)
			{
				velocity.y = -50;
			}
			
			if(FlxG.keys.DOWN)
			{
				velocity.y = 50;
			}
			
			if(FlxG.keys.justPressed('SPACE'))
			{
				FlxG.play(Registry.fire,0.5);
				bullet = bulletArray[bulletID];
				bullet.reset(x + 3,y + 10);
				bullet.velocity.y = -400;
				bulletID++;
				if(bulletID == 20)
				{
					bulletID = 0;
				}
			}

			super.update();
		}
	}
}