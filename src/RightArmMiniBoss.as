package
{
	import org.flixel.*;
	
	public class RightArmMiniBoss extends FlxSprite
	{
		
		private var t:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false;
		public var bossHealth:int = 400;
		
		public function RightArmMiniBoss(X:Number=0, Y:Number=0)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.ramb,false,false,16,16);
			
			velocity.x =0;
		}
		
		override public function update():void
		{
			
			if(Registry.area7MiniBoss && y < 10)
			{
				velocity.y = 50;
			}
			
			if(y >= 10 && velocity.x == 0)
			{
				velocity.y = 0;
				delay(1);
				if(!timerSet)
				{
					velocity.x = 50;
				}
				
			}
			
			if(x > 248 && velocity.x != 0)
			{	
				velocity.x = -50;
			}
			
			if(x < 56 && velocity.x != 0)
			{
				velocity.x = 50;
			}
			
			super.update();
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