package
{
	import org.flixel.*;
	
	public class BlueVirus extends FlxSprite
	{
		public function BlueVirus(X:Number=0, Y:Number=0)
		{
			super(X*8,Y*8);
			loadGraphic(Registry.blueVirus,false,false,8,8);
			velocity.y = Math.random()*10+40;
			velocity.x = 0;
		}
		
		override public function update():void
		{
			if(y>240)
			{
				y=-20;
				x=(Math.random()*23+8)*8;
			}
			
			super.update();
		}
	}
}