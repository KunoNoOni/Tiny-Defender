package
{
	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class TinyDefender extends FlxGame
	{
		public function TinyDefender()
		{
			super(320,240,TitleState,2);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}