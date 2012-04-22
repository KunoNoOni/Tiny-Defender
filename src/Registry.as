package
{
	import org.flixel.*;

	public class Registry
	{
		public static var currLvl:int = 1;
		public static var currArea:int = 1;
		public static var currStage:int = 1;
		public static var playerLives:int = 3;
		public static var difficulty:int = 0;//0 for easy mode, 1 is for hard mode
		public static var rbcGroup:FlxGroup = new FlxGroup();
		public static var rbcGroup2:FlxGroup = new FlxGroup();
		public static var rbcGroup3:FlxGroup = new FlxGroup();
		public static var enemyDead:Boolean = false; 
		public static var greenVirusGroup:FlxGroup = new FlxGroup();
		public static var blueVirusGroup:FlxGroup = new FlxGroup();
		public static var cyanVirusGroup:FlxGroup = new FlxGroup();
		public static var lightgreenVirusGroup:FlxGroup = new FlxGroup();
		public static var orangeyellowVirusGroup:FlxGroup = new FlxGroup();
		public static var pinkVirusGroup:FlxGroup = new FlxGroup();
		public static var purpleVirusGroup:FlxGroup = new FlxGroup();
		public static var graybrownVirusGroup:FlxGroup = new FlxGroup();
		public static var bdamage:int = 10;
		public static var area1MiniBoss:Boolean = false;
		public static var area2MiniBoss:Boolean = false;
		public static var area3MiniBoss:Boolean = false;
		public static var area4MiniBoss:Boolean = false;
		public static var area5MiniBoss:Boolean = false;
		public static var area6MiniBoss:Boolean = false;
		public static var area7MiniBoss:Boolean = false;
		public static var area8MiniBoss:Boolean = false;
		public static var displayingText:Boolean = false;
		public static var wonGame:Boolean = false;
		public static var muteMusic:Boolean = false;
		

		[Embed(source = 'res/sprites/cellwalls.png')] static public var cellWalls:Class;
		[Embed(source = 'res/sprites/player.png')] static public var player:Class;
		[Embed(source = 'res/sprites/bullet.png')] static public var bullet:Class;
		[Embed(source = 'res/sprites/redbloodcells.png')] static public var redBloodCells:Class;
		[Embed(source = 'res/sprites/bluevirus.png')] static public var blueVirus:Class;
		[Embed(source = 'res/sprites/brownvirus.png')] static public var brownVirus:Class;
		[Embed(source = 'res/sprites/cyanvirus.png')] static public var cyanVirus:Class;
		[Embed(source = 'res/sprites/grayvirus.png')] static public var grayVirus:Class;
		[Embed(source = 'res/sprites/greenvirus.png')] static public var greenVirus:Class;
		[Embed(source = 'res/sprites/lightgreenvirus.png')] static public var lightgreenVirus:Class;
		[Embed(source = 'res/sprites/orangevirus.png')] static public var orangeVirus:Class;
		[Embed(source = 'res/sprites/pinkvirus.png')] static public var pinkVirus:Class;
		[Embed(source = 'res/sprites/purplevirus.png')] static public var purpleVirus:Class;
		[Embed(source = 'res/sprites/yellowvirus.png')] static public var yellowVirus:Class;
		[Embed(source = 'res/sprites/leftfootminiboss.png')] static public var lfmb:Class;
		[Embed(source = 'res/sprites/rightfootminiboss.png')] static public var rfmb:Class;
		[Embed(source = 'res/sprites/leftlegminiboss.png')] static public var llmb:Class;
		[Embed(source = 'res/sprites/rightlegminiboss.png')] static public var rlmb:Class;
		[Embed(source = 'res/sprites/chestminiboss.png')] static public var cmb:Class;
		[Embed(source = 'res/sprites/leftarmminiboss.png')] static public var lamb:Class;
		[Embed(source = 'res/sprites/rightarmminiboss.png')] static public var ramb:Class;
		[Embed(source = 'res/sprites/endboss.png')] static public var endBoss:Class;
		[Embed(source = 'res/sprites/backdrop2.png')] static public var bground:Class;
		[Embed(source = 'res/sprites/shipbits.png')] static public var shipBits:Class;
			
		[Embed(source = 'res/levels/left foot/leftfootArea1Stage1.csv', mimeType = 'application/octet-stream')] static public var lfA1S1:Class;
		[Embed(source = 'res/levels/left foot/leftfootArea1Stage2.csv', mimeType = 'application/octet-stream')] static public var lfA1S2:Class;
		[Embed(source = 'res/levels/left foot/leftfootArea1Stage3.csv', mimeType = 'application/octet-stream')] static public var lfA1S3:Class;
		
		[Embed(source = 'res/levels/left leg/leftlegArea2Stage1.csv', mimeType = 'application/octet-stream')] static public var llA2S1:Class;
		[Embed(source = 'res/levels/left leg/leftlegArea2Stage2.csv', mimeType = 'application/octet-stream')] static public var llA2S2:Class;
		[Embed(source = 'res/levels/left leg/leftlegArea2Stage3.csv', mimeType = 'application/octet-stream')] static public var llA2S3:Class;
		[Embed(source = 'res/levels/left leg/leftlegArea2Stage2.csv', mimeType = 'application/octet-stream')] static public var llA2S4:Class;
		[Embed(source = 'res/levels/left leg/leftlegArea2Stage3.csv', mimeType = 'application/octet-stream')] static public var llA2S5:Class;
		
		[Embed(source = 'res/levels/right leg/rightlegArea3Stage1.csv', mimeType = 'application/octet-stream')] static public var rlA3S1:Class;
		[Embed(source = 'res/levels/right leg/rightlegArea3Stage2.csv', mimeType = 'application/octet-stream')] static public var rlA3S2:Class;
		[Embed(source = 'res/levels/right leg/rightlegArea3Stage3.csv', mimeType = 'application/octet-stream')] static public var rlA3S3:Class;
		[Embed(source = 'res/levels/right leg/rightlegArea3Stage2.csv', mimeType = 'application/octet-stream')] static public var rlA3S4:Class;
		[Embed(source = 'res/levels/right leg/rightlegArea3Stage3.csv', mimeType = 'application/octet-stream')] static public var rlA3S5:Class;
		
		[Embed(source = 'res/levels/right foot/rightfootArea4Stage1.csv', mimeType = 'application/octet-stream')] static public var rfA4S1:Class;
		[Embed(source = 'res/levels/right foot/rightfootArea4Stage2.csv', mimeType = 'application/octet-stream')] static public var rfA4S2:Class;
		[Embed(source = 'res/levels/right foot/rightfootArea4Stage3.csv', mimeType = 'application/octet-stream')] static public var rfA4S3:Class;
		
		[Embed(source = 'res/levels/chest/chestArea5Stage1.csv', mimeType = 'application/octet-stream')] static public var cA5S1:Class;
		[Embed(source = 'res/levels/chest/chestArea5Stage2.csv', mimeType = 'application/octet-stream')] static public var cA5S2:Class;
		[Embed(source = 'res/levels/chest/chestArea5Stage3.csv', mimeType = 'application/octet-stream')] static public var cA5S3:Class;
		
		[Embed(source = 'res/levels/left arm/leftarmArea6Stage1.csv', mimeType = 'application/octet-stream')] static public var laA6S1:Class;
		[Embed(source = 'res/levels/left arm/leftarmArea6Stage2.csv', mimeType = 'application/octet-stream')] static public var laA6S2:Class;
		[Embed(source = 'res/levels/left arm/leftarmArea6Stage3.csv', mimeType = 'application/octet-stream')] static public var laA6S3:Class;
		[Embed(source = 'res/levels/left arm/leftarmArea6Stage2.csv', mimeType = 'application/octet-stream')] static public var laA6S4:Class;
		
		[Embed(source = 'res/levels/right arm/rightarmArea7Stage1.csv', mimeType = 'application/octet-stream')] static public var raA7S1:Class;
		[Embed(source = 'res/levels/right arm/rightarmArea7Stage2.csv', mimeType = 'application/octet-stream')] static public var raA7S2:Class;
		[Embed(source = 'res/levels/right arm/rightarmArea7Stage3.csv', mimeType = 'application/octet-stream')] static public var raA7S3:Class;
		[Embed(source = 'res/levels/right arm/rightarmArea7Stage2.csv', mimeType = 'application/octet-stream')] static public var raA7S4:Class;
		
		[Embed(source = 'res/levels/head/headFinalBossShowdown.csv', mimeType = 'application/octet-stream')] static public var hFBS:Class;
		
		public static var areaText:Array = ["null","Area: Left Foot","Area: Left Leg","Area: Right Leg","Area: Right Foot","Area: Chest","Area: Left Arm",
			"Area: Right Arm","Area: Head"];
		public static var stageText:Array = ["null","Stage 1","Stage 2","Stage 3","BOSS STAGE","Stage 1","Stage 2","Stage 3","Stage 4","Stage 5","BOSS STAGE","Stage 1",
			"Stage 2","Stage 3","Stage 4","Stage 5","BOSS STAGE","Stage 1","Stage 2","Stage 3","BOSS STAGE","Stage 1","Stage 2","Stage 3","BOSS STAGE","Stage 1",
			"Stage 2","Stage 3","Stage 4","BOSS STAGE","Stage 1","Stage 2","Stage 3","Stage 4","BOSS STAGE","Stage 1","BOSS STAGE"];
		public static var areas:Array = ["null","lfA1S1","lfA1S2","lfA1S3","llA2S1","llA2S2","llA2S3","llA2S4","llA2S5","rlA3S1","rlA3S2","rlA3S3","rlA3S4","rlA3S5",
			"rfA4S1","rfA4S2","rfA4S3","cA5S1","cA5S2","cA5S3","laA6S1","laA6S2","laA6S3","laA6S4","raA7S1","raA7S2","raA7S3","raA7S4","hFBS"];
		
		[Embed(source = 'res/sounds/Explosion10.mp3')] static public var explodeVirus:Class;
		[Embed(source = 'res/sounds/Explosion4.mp3')] static public var explodeShip:Class;
		[Embed(source = 'res/sounds/Explosion2.mp3')] static public var explodeBoss:Class;
		[Embed(source = 'res/sounds/Hit_Hurt24.mp3')] static public var hitHurt:Class;
		[Embed(source = 'res/sounds/Laser_Shoot2.mp3')] static public var fire:Class;
		[Embed(source = 'res/sounds/Flash.mp3')] static public var flash:Class;
		
		[Embed(source = 'res/sounds/Title.mp3')] static public var title:Class;
		[Embed(source = 'res/sounds/play.mp3')] static public var play:Class;
		[Embed(source = 'res/sounds/Boss.mp3')] static public var boss:Class;
		
		public function Registry()
		{
		}
	}
}