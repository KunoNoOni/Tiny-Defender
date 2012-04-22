package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var tilemap:FlxTilemap;
		private var player:Player;
		private var rbc:RedBloodCells;
		private var rbc2:RedBloodCells;
		private var rbc3:RedBloodCells;
		private var bg:FlxSprite = new FlxSprite();
		private var emitter:FlxEmitter;
		private var b:Bullet;
		private var eBullet:Bullet;
		private var greenV:GreenVirus;
		private var blueV:BlueVirus;
		private var cyanV:CyanVirus;
		private var lightgreenV:LightGreenVirus;
		private var orangeV:OrangeVirus;
		private var yellowV:YellowVirus;
		private var pinkV:PinkVirus;
		private var purpleV:PurpleVirus;
		private var grayV:GrayVirus;
		private var brownV:BrownVirus;
		private var t:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false
		private var playerDead:Boolean = false;
		private var bulletGroup:FlxGroup = new FlxGroup();
		private var bulletGroup2:FlxGroup = new FlxGroup();
		private var lfmb:LeftFootMiniBoss;
		private var llmb:LeftLegMiniBoss;
		private var rlmb:RightLegMiniBoss;
		private var rfmb:RightFootMiniBoss;
		private var cmb:ChestMiniBoss;
		private var lamb:LeftArmMiniBoss;
		private var ramb:RightArmMiniBoss;
		private var hfbs:HeadFinalBossShowdown;
		private var eBulletID:int = 0;
		private var areaText:FlxText;
		private var stageText:FlxText;
		private var playerText:FlxText;
		private var bossDead:Boolean = false;
		private var flashFadePlayed:Boolean = false;
		
						
		override public function create():void
		{	
			bg.loadGraphic(Registry.bground,false,false,400,800);
			add(bg);
			
			initRBCs();
			
			player = new Player(20,25);
			add(player);
			
			initPlayerBullets();

			initViruses()
			initMiniBoss();

			tilemap = new FlxTilemap();
			tilemap.loadMap(new Registry[Registry.areas[Registry.currLvl]],Registry.cellWalls,8,8,0,0,1,1);
			add(tilemap);
			
			Registry.displayingText = true;
			displayText(Registry.currArea,Registry.currStage);
			//trace("Area: "+Registry.currArea);
			//trace("Stage: "+Registry.currStage);
			//trace("Level: "+Registry.currLvl);
		}	
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("M"))
			{
				Registry.muteMusic = true;
			}
			
			if(FlxG.keys.justPressed("U"))
			{
				Registry.muteMusic = false;
			}
		
			if(Registry.muteMusic)
			{
				FlxG.music.volume = 0;
			}
			else
			{
				FlxG.music.volume = 1;
			}
			
			if(playerDead)
			{
				delay(1);
				if(!timerSet)
				{
					resetGame();
				}
			}
			
			if(Registry.playerLives < 0)
			{
				playerDead = false;
				if(!flashFadePlayed)
				{
					flashFade();
				}
				delay(1);
				if(!timerSet)
				{
					FlxG.switchState(new GameOver());
				}
			}
			
			if(Registry.displayingText)
			{
				delay(2);
				if(!timerSet)
				{
					Registry.displayingText = false;
					playerText.visible = false;
					areaText.visible = false;
					stageText.visible = false;
				}
			}
			
			if(bossDead)
			{
				
				delay(2);
				if(!flashFadePlayed)
				{
					flashFade();
				}
				if(!timerSet)
				{
					Registry.area1MiniBoss = false;
					Registry.area2MiniBoss = false;
					Registry.area3MiniBoss = false;
					Registry.area4MiniBoss = false;
					Registry.area5MiniBoss = false;
					Registry.area6MiniBoss = false;
					Registry.area7MiniBoss = false;
					bossDead = false;
					flashFadePlayed = false;
					Registry.currArea++;
					Registry.currStage++;
					Registry.currLvl++;
					FlxG.resetState();
				}
			}
			
			if(Registry.wonGame)
			{
				if(!flashFadePlayed)
				{
					flashFade();
				}
				delay(2);
				if(!timerSet)
				{
					Registry.area8MiniBoss = false;
					FlxG.switchState(new GameOver());
				}
			}
			
			if(Registry.difficulty == 1)
			{
				FlxG.overlap(player,Registry.rbcGroup, boom);
			}
			
			
			FlxG.overlap(player,Registry.greenVirusGroup,boom);
			FlxG.overlap(player,Registry.blueVirusGroup,boom);
			FlxG.overlap(player,Registry.cyanVirusGroup,boom);
			FlxG.overlap(player,Registry.lightgreenVirusGroup,boom);
			FlxG.overlap(player,Registry.orangeyellowVirusGroup,boom);
			FlxG.overlap(player,Registry.pinkVirusGroup,boom);
			FlxG.overlap(player,Registry.purpleVirusGroup,boom);
			FlxG.overlap(player,Registry.graybrownVirusGroup,boom);
			
			FlxG.overlap(player,lfmb,boom);
			FlxG.overlap(player,llmb,boom);
			FlxG.overlap(player,rlmb,boom);
			FlxG.overlap(player,rfmb,boom);
			FlxG.overlap(player,cmb,boom);
			FlxG.overlap(player,lamb,boom);
			FlxG.overlap(player,ramb,boom);
			FlxG.overlap(player,hfbs,boom);
			
			FlxG.overlap(bulletGroup,Registry.greenVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.blueVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.cyanVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.lightgreenVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.orangeyellowVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.pinkVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.purpleVirusGroup,cleanse);
			FlxG.overlap(bulletGroup,Registry.graybrownVirusGroup,cleanse);
	
			FlxG.overlap(bulletGroup,lfmb,bossDown);
			FlxG.overlap(bulletGroup,llmb,bossDown);
			FlxG.overlap(bulletGroup,rlmb,bossDown);
			FlxG.overlap(bulletGroup,rfmb,bossDown);
			FlxG.overlap(bulletGroup,cmb,bossDown);
			FlxG.overlap(bulletGroup,lamb,bossDown);
			FlxG.overlap(bulletGroup,ramb,bossDown);
			FlxG.overlap(bulletGroup,hfbs,bossDown);
			
			super.update();
			
			FlxG.collide(player,tilemap);
		}
		
		private function boom(p:FlxSprite, e:FlxSprite):void
		{
			FlxG.play(Registry.explodeShip,0.5);
			p.kill();
			--Registry.playerLives;
			playerDead = true;
			emitter = new FlxEmitter(p.x,p.y);
			emitter.makeParticles(Registry.shipBits,5,16,true,0);
			add(emitter);
			emitter.start(true,1);
		}
		
		private function cleanse(b:FlxSprite,e:FlxSprite):void
		{
			
			b.kill();
			e.kill();
			FlxG.play(Registry.explodeVirus,0.5);
			e.velocity.y = 0;
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(vBits,8,0,true);
			add(emitter);
			emitter.start(true, 1);
			
			switch (Registry.currArea)
			{
				
				case 1:
				{
					if(Registry.greenVirusGroup.getFirstAlive() == null && Registry.currStage == 3)
					{
						//trace("Moving to Boss Stage");
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area1MiniBoss = true;
					}
					else if(Registry.greenVirusGroup.getFirstAlive() == null && Registry.currStage < 3)
					{
						//trace("Moving to Next Stage");
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 2:
				{
					if(Registry.blueVirusGroup.getFirstAlive() == null && Registry.currStage == 9)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area2MiniBoss = true;
					}
					else if(Registry.blueVirusGroup.getFirstAlive() == null && Registry.currStage < 9)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 3:
				{
					if(Registry.cyanVirusGroup.getFirstAlive() == null && Registry.currStage == 15)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area3MiniBoss = true;
					}
					else if(Registry.cyanVirusGroup.getFirstAlive() == null && Registry.currStage < 15)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 4:
				{
					if(Registry.lightgreenVirusGroup.getFirstAlive() == null && Registry.currStage == 19)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area4MiniBoss = true;
					}
					else if(Registry.lightgreenVirusGroup.getFirstAlive() == null && Registry.currStage < 19)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 5:
				{
					if(Registry.orangeyellowVirusGroup.getFirstAlive() == null && Registry.currStage == 23)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area5MiniBoss = true;
					}
					else if(Registry.orangeyellowVirusGroup.getFirstAlive() == null && Registry.currStage < 23)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 6:
				{
					if(Registry.pinkVirusGroup.getFirstAlive() == null && Registry.currStage == 28)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area6MiniBoss = true;
					}
					else if(Registry.pinkVirusGroup.getFirstAlive() == null && Registry.currStage < 28)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 7:
				{
					if(Registry.purpleVirusGroup.getFirstAlive() == null && Registry.currStage == 33)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area7MiniBoss = true;
					}
					else if(Registry.purpleVirusGroup.getFirstAlive() == null && Registry.currStage < 33)
					{
						Registry.currStage++;
						Registry.currLvl++;
						FlxG.resetState();
					}
					break;
				}
				case 8:
				{
					if(Registry.graybrownVirusGroup.getFirstAlive() == null && Registry.currStage == 35)
					{
						Registry.currStage++;
						Registry.displayingText = true;
						displayText(Registry.currArea,Registry.currStage);
						Registry.area8MiniBoss = true;
					}
					break;
				}
			}
		}
		
		private function bossDown(b:FlxSprite, e:FlxSprite):void
		{
			b.kill();
			switch (Registry.currArea)
			{
				case 1:
				{
					if(lfmb.bossHealth <=0)
					{
						trace("BOSS DEAD!");
						lfmb.kill();
						FlxG.play(Registry.explodeBoss,1);
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						FlxG.play(Registry.hitHurt,1);
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						lfmb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 2:
				{
					if(llmb.bossHealth <=0)
					{
						llmb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						llmb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 3:
				{
					if(rlmb.bossHealth <=0)
					{
						rlmb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						rlmb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 4:
				{
					if(rfmb.bossHealth <=0)
					{
						rfmb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						rfmb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 5:
				{
					if(cmb.bossHealth <=0)
					{
						cmb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						cmb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 6:
				{
					if(lamb.bossHealth <=0)
					{
						lamb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						lamb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 7:
				{
					if(ramb.bossHealth <=0)
					{
						ramb.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						bossDead = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						ramb.bossHealth -= Registry.bdamage;
					}
					break;
				}
				case 8:
				{
					if(hfbs.bossHealth <=0)
					{
						hfbs.kill();
						emitter = new FlxEmitter(e.x+8,e.y+8);
						emitter.makeParticles(vBits,32,0,true);
						add(emitter);
						emitter.start(true, 1);
						Registry.wonGame = true;
					}
					else
					{
						emitter = new FlxEmitter(e.x,e.y);
						emitter.makeParticles(vBits,8,0,true);
						add(emitter);
						emitter.start(true, 1);
						hfbs.bossHealth -= Registry.bdamage;
					}
					break;
				}
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
		
		private function resetGame():void
		{
			Registry.rbcGroup.clear();
			Registry.rbcGroup2.clear();;
			bulletGroup.clear();;
			Registry.greenVirusGroup.clear();
			Registry.blueVirusGroup.clear();
			Registry.cyanVirusGroup.clear();
			Registry.lightgreenVirusGroup.clear();
			Registry.orangeyellowVirusGroup.clear();
			Registry.pinkVirusGroup.clear();
			Registry.purpleVirusGroup.clear();
			Registry.graybrownVirusGroup.clear();
			Registry.area1MiniBoss = false;
			Registry.area2MiniBoss = false;
			Registry.area3MiniBoss = false;
			Registry.area4MiniBoss = false;
			Registry.area5MiniBoss = false;
			Registry.area6MiniBoss = false;
			Registry.area7MiniBoss = false;
			FlxG.resetState();
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
		
		private function initPlayerBullets():void
		{
			for(var v:int = 0;v<20;v++)
			{
				b = new Bullet(-20,-20);
				bulletGroup.add(b);
			}
			
			player.bulletArray = bulletGroup.members;
			add(bulletGroup);
		}
		
		private function initViruses():void
		{
			switch (Registry.currArea)
			{
				case 1:
				{
					for(var a:int = 0;a<50;a++)
					{
						greenV = new GreenVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.greenVirusGroup.add(greenV);
						add(greenV);
					}
					break;
				}
				case 2:
				{
					for(var b:int = 0;b<50;b++)
					{
						blueV = new BlueVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.blueVirusGroup.add(blueV);
						add(blueV);
					}
					break;
				}
				case 3:
				{
					for(var c:int = 0;c<50;c++)
					{
						cyanV = new CyanVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.cyanVirusGroup.add(cyanV);
						add(cyanV);
					}
					break;
				}
				case 4:
				{
					for(var d:int = 0;d<50;d++)
					{
						lightgreenV = new LightGreenVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.lightgreenVirusGroup.add(lightgreenV);
						add(lightgreenV);
					}
					break;
				}
				case 5:
				{
					for(var e:int = 0;e<25;e++)
					{
						orangeV = new OrangeVirus(Math.random()*23+8,Math.random()*27-40);
						yellowV = new YellowVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.orangeyellowVirusGroup.add(orangeV);
						Registry.orangeyellowVirusGroup.add(yellowV);
						add(orangeV);
						add(yellowV);
					}
					break;
				}
				case 6:
				{
					for(var f:int = 0;f<50;f++)
					{
						pinkV = new PinkVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.pinkVirusGroup.add(pinkV);
						add(pinkV);
					}
					break;
				}
				case 7:
				{
					for(var g:int = 0;g<50;g++)
					{
						purpleV = new PurpleVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.purpleVirusGroup.add(purpleV);
						add(purpleV);
					}
					break;
				}
				case 8:
				{
					for(var h:int = 0;h<25;h++)
					{
						grayV = new GrayVirus(Math.random()*23+8,Math.random()*27-40);
						brownV = new BrownVirus(Math.random()*23+8,Math.random()*27-40);
						Registry.graybrownVirusGroup.add(grayV);
						Registry.graybrownVirusGroup.add(brownV);
						add(grayV);
						add(brownV);
					}
					break;
				}
			}
		}
		
		private function initMiniBoss():void
		{
			switch (Registry.currArea)
			{
				case 1:
				{
					lfmb = new LeftFootMiniBoss(9,-5);
					add(lfmb);
					break;
				}
				case 2:
				{
					llmb = new LeftLegMiniBoss(9,-5);
					add(llmb);
					break;
				}
				case 3:
				{
					rlmb = new RightLegMiniBoss(9,-5);
					add(rlmb);
					break;
				}
				case 4:
				{
					rfmb = new RightFootMiniBoss(9,-5);
					add(rfmb);
					break;
				}
				case 5:
				{
					cmb = new ChestMiniBoss(9,-5);
					add(cmb);
					break;
				}
				case 6:
				{
					lamb = new LeftArmMiniBoss(9,-5);
					add(lamb);
					break;
				}
				case 7:
				{
					ramb = new RightArmMiniBoss(9,-5);
					add(ramb);
					break;
				}
				case 8:
				{
					hfbs = new HeadFinalBossShowdown(9,-5);
					add(hfbs);
					break;
				}
			}
		}
		
		private function flashFade():void
		{
			FlxG.play(Registry.flash,0.8);
			FlxG.flash(0xffffffff,1);
			FlxG.fade(0xFF000000,1);
			flashFadePlayed = true;
		}
		
		private function displayText(area:int,stage:int):void
		{
			
			playerText = new FlxText(25,15,300,"Lives: "+Registry.playerLives);
			playerText.setFormat(null,24,0x0000FF);
			add(playerText);
			
			areaText = new FlxText(25,65,300,Registry.areaText[area]);
			areaText.setFormat(null,24,0xFFFFFF);
			add(areaText);

			stageText = new FlxText(25,135,300,Registry.stageText[stage]);
			stageText.setFormat(null,24,0xFFFFFF);
			add(stageText);
			
			if(Registry.currStage == 4 || Registry.currStage == 10 || Registry.currStage == 16 || Registry.currStage == 20 || Registry.currStage == 24 || Registry.currStage == 29
				|| Registry.currStage == 34 || Registry.currStage == 36)	
			{
				FlxG.playMusic(Registry.boss);
			
			}
			else	
			{
				FlxG.playMusic(Registry.play);
			}
		}
	}
}

