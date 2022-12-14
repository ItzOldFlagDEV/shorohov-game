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

class PlayState extends FlxState
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

	// PLAYERS PREFS
	var damageBoost:Int = 1;
	#if mobile
	// MOBILE
	var size:Int = 72;
	var backButton:FlxText;
	#end

	// OTHER
	public var ls:Int = 0;

	public function new(level:String)
	{
		LevelData.load(level);
		ls = FlxG.save.data.language;

		super();

		bg = new FlxSprite().loadGraphic(Paths.bgImages(curBg));
		bg.screenCenter();
		bg.scale.set(FlxG.width / 1280, FlxG.height / 720);
		add(bg);

		shorohov = new ShorohovPlayer(0, 0, curShorohov);
		shorohov.screenCenter();
		add(shorohov);

		coinTxt = new FlxText(0, FlxG.height - 38, 0, LanguageHandler.playstateCoins[ls] + FlxG.save.data.coin, 32);
		coinTxt.screenCenter(X);
		coinTxt.font = Paths.fontTTF('font1');
		coinTxt.borderQuality = 1;
        coinTxt.borderSize = 2;
        coinTxt.borderStyle = OUTLINE;
        coinTxt.borderColor = FlxColor.BLACK;
		add(coinTxt);

		hpTxt = new FlxText(0, 0, 0, LanguageHandler.playstateHealthLeft[ls] + health, 32);
		hpTxt.screenCenter(X);
		hpTxt.font = Paths.fontTTF('font1');
		hpTxt.borderQuality = 1;
        hpTxt.borderSize = 2;
        hpTxt.borderStyle = OUTLINE;
        hpTxt.borderColor = FlxColor.BLACK;
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
		DiscordClient.changePresence('Playing: ${curLevel}', 'Health left: ${health}');
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
				hpTxt.text = LanguageHandler.playstateHealthLeft[ls] + health;
				#if desktop
				DiscordClient.changePresence('Playing: ${curLevel}', 'Health left: ${health}');
				#end

				FlxG.save.data.coin += 1;
				coinTxt.text = LanguageHandler.playstateCoins[ls] + FlxG.save.data.coin;
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
