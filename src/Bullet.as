package
{
	import org.flixel.*;
	
	public class Bullet extends FlxSprite
	{
		
		public function Bullet(X:Number=0, Y:Number=0)
		{
			super(X*8,Y*8);
			loadGraphic(Registry.bullet,false,false,2,1);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}