package;

import flixel.FlxG;
import openfl.display.FPS;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	var zoom:Float = 1;

	public function new()
	{
		super();

		FlxG.save.bind('shoroh', '7GC');

		addChild(new FlxGame(0, 0, TitleState, zoom, 60, 60, true));

		addChild(new FPS(5, 5, 0xffffff));

		defaultData();

		FlxG.drawFramerate = FlxG.save.data.framerate;
		FlxG.updateFramerate = FlxG.save.data.framerate;
	}

	function defaultData()
	{
		if (FlxG.save.data.framerate == null)
			FlxG.save.data.framerate = 60;

		if (FlxG.save.data.language == null)
			FlxG.save.data.language = 0;
	}
}
