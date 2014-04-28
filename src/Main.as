package
{
	import org.flixel.*;
	
	[SWF(width="320", height="480", backgroundColor="#fffffff")]
	
	public class Main extends FlxGame
	{
		public function Main()
		{
			
			super(160, 240, PlayState, 2, 160, 60);
		
			forceDebugger = true;
		
		}
		
	
	}
	
}
