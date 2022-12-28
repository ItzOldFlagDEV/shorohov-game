package;

import flixel.system.FlxSound;
import flixel.util.FlxColor;
#if sys
import sys.io.File;
#end
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import haxe.Json;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;
import DataHandler.GetZoom;

class PlayState extends State
{
	// OBJS VARS
	var shorohov:ShorohovPlayer;
	var coinTxt:FlxText;
	var hpTxt:FlxText;
	var bgJS:FlxSprite;
	var bg:FlxSprite;

	// curLevel DATA
	public static var coinMin:Int;
	public static var coinMax:Int;
	public static var curShorohov:String;
	public static var health:Int;
	public static var curBg:String;
	public static var curLevel:String;

	var shorohovSizes:Array<Float> = [];
	var shorohovSize:Float;

	// PLAYERS PREFS
	var damageBoost:Int = FlxG.save.data.damageBoosterLvl;
	#if mobile
	// MOBILE
	var size:Int = 72;
	var backButton:FlxText;
	#end

	// OTHER
	public var ls:Int = 0;

	public function new(?level:String = null)
	{
		if (level != null)
			LevelData.load(level);
		else
		{
			var bgs:Array<String> = ['default', 'tokyo_ghoul', 'naruto'];
			var shorohovs:Array<String> = ['default', 'kaneki', 'naruto'];

			var randomCoins:Array<Int> = [Std.int((FlxG.random.int(100, 120) * (FlxG.save.data.totalPlayedLevels * 1.5))), Std.int((FlxG.random.int(300, 330) * (FlxG.save.data.totalPlayedLevels * 1.75)))];
			var randomShorohov:String = shorohovs[FlxG.random.int(FlxG.random.int(0, shorohovs.length - 1))];
			var randomHP:Int = Std.int(FlxG.random.int(100, 150) * (FlxG.save.data.totalPlayedLevels * 1.25));
			var randomBG:String = bgs[FlxG.random.int(FlxG.random.int(0, bgs.length - 1))];
	
			coinMin = randomCoins[0];
			coinMax = randomCoins[1];
			curShorohov = randomShorohov;
			health = randomHP;
			curLevel = 'generated';
			curBg = randomBG;

			trace('\n  >> Generated: \n  >> MinCoins: $coinMin\n  >> MaxCoins: $coinMax\n  >> Shorohov: $curShorohov\n  >> Health: $health\n  >> CurLevel: $curLevel\n  >> CurBg: $curBg');
		}
		ls = FlxG.save.data.language;

		super();

		bg = new FlxSprite().loadGraphic(Paths.bgImages(curBg));
		bg.screenCenter();
		bg.scale.set(FlxG.width / 1280, FlxG.height / 720);
		add(bg);

		shorohov = new ShorohovPlayer(0, 0, curShorohov);
		shorohov.screenCenter();
		shorohov.scale.set(GetZoom() * 1.5, GetZoom() * 1.5);
		add(shorohov);

		coinTxt = new FlxText(0, 0, 0, DataHandler.playstateCoins[ls] + FlxG.save.data.coin, Std.int(32 * GetZoom()));
		coinTxt.screenCenter(X);
		coinTxt.font = Paths.fontTTF('font1');
		coinTxt.borderQuality = 1;
        coinTxt.borderSize = 2;
        coinTxt.borderStyle = OUTLINE;
        coinTxt.borderColor = FlxColor.BLACK;
		coinTxt.y = FlxG.height - (6 + coinTxt.size);
		add(coinTxt);

		hpTxt = new FlxText(0, 0, 0, DataHandler.playstateHealthLeft[ls] + health, Std.int(32 * GetZoom()));
		hpTxt.screenCenter(X);
		hpTxt.font = Paths.fontTTF('font1');
		hpTxt.borderQuality = 1;
        hpTxt.borderSize = 2;
        hpTxt.borderStyle = OUTLINE;
        hpTxt.borderColor = FlxColor.BLACK;
		hpTxt.y = 6;
		add(hpTxt);

		#if mobile
		// Mobile
		backButton = new FlxText(0, 0, 0, 'BACK', size);
		add(backButton);

		// BACK BUTTON POSITION
		backButton.x = FlxG.width - backButton.width + 5;
		backButton.y = FlxG.height - backButton.height + 5;
		#end

		#if desktop
		DiscordClient.changePresence('${DataHandler.discordPlayStatePart1[ls]}: ${curLevel}', '${DataHandler.discordPlayStatePart2[ls]} ${health}');
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (health <= 0)
		{
			FlxG.switchState(new MainMenuState());
		}

		if (FlxG.mouse.overlaps(shorohov))
		{
			if (FlxG.mouse.justPressed)
			{
				health -= 1 * damageBoost;
				hpTxt.text = DataHandler.playstateHealthLeft[ls] + health;
				#if desktop
				DiscordClient.changePresence('${DataHandler.discordPlayStatePart1[ls]}: ${curLevel}', '${DataHandler.discordPlayStatePart2[ls]} ${health}');
				#end

				FlxG.save.data.coin += (1 * FlxG.save.data.coinsBoosterLvl);
				coinTxt.text = DataHandler.playstateCoins[ls] + FlxG.save.data.coin;
				coinTxt.screenCenter(X);
				shorohov.animation.play('Crying');

				FlxG.save.flush();
			}

			if (FlxG.mouse.justReleased)
			{
				shorohov.animation.play('Normal');
			}
		}

		if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}
