package;

import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.FlxG;
import openfl.Lib;

class State extends FlxState
{
	private var cacheCount:Int;
	private var currentTime:Float;
	private var times:Array<Float>;

	var deltaTime:Float;

	var currentFPS:Float = 0;

	var fpsText:FlxText;
	var fpsBG:FlxSprite;

    var mem:Float;

	override public function create()
	{
		super.create();

		cacheCount = 0;
		currentTime = 0;
		times = [];

		fpsBG = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		fpsBG.alpha = 0.35;
		fpsBG.scrollFactor.set();
		add(fpsBG);

        updateFPSData();
		fpsText = new FlxText(0, 0, 0, "RAM: " + mem + "MB" + "\n" + "FPS: " + currentFPS + "/" + FlxG.save.data.framerate + "\n", Math.round(14 * (FlxG.width / 1280)));
		fpsText.alpha = 1;
		fpsText.borderQuality = 1;
		fpsText.borderSize = 1;
		fpsText.scrollFactor.set();
		fpsText.borderStyle = OUTLINE;
		fpsText.borderColor = FlxColor.BLACK;
        fpsBG.scale.set((fpsText.width + 5) * 2, fpsText.height + 5);
		add(fpsText);

		updateFPS();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.C)
		{
			openSubState(new ConsoleSubState());
		}

        updateFPSData();
	}

    function updateFPSData() 
    {
        var time = Lib.getTimer();
		deltaTime = time - currentTime;

		currentTime += deltaTime;
		times.push(currentTime);

		while (times[0] < currentTime - 1000)
		{
			times.shift();
		}

		var currentCount = times.length;
        mem = Math.abs(FlxMath.roundDecimal(openfl.system.System.totalMemory / 1000000, 1));
		currentFPS = Math.round(currentCount + cacheCount);

		if (currentFPS > FlxG.save.data.framerate)
			currentFPS = FlxG.save.data.framerate;
    }

	function updateFPS()
	{
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			fpsText.text = "RAM: " + mem + "MB" + "\n" + "FPS: " + currentFPS + "/" + FlxG.save.data.framerate + "\n";
			fpsBG.scale.set((fpsText.width + 5) * 2, fpsText.height + 5);
			fpsText.scrollFactor.set();
			fpsBG.scrollFactor.set();
			updateFPS();
		});
	}
}
