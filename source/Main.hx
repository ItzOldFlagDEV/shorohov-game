package;

import flixel.FlxG;
import openfl.display.FPS;
import flixel.FlxGame;
import openfl.display.Sprite;
#if CRASH_HANDLER
import openfl.events.UncaughtErrorEvent;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
import lime.app.Application;
#end

class Main extends Sprite
{
	var zoom:Float = 1;

	public function new()
	{
		super();

		FlxG.save.bind('shoroh', '7GC');

		addChild(new FlxGame(0, 0, TitleState, zoom, 60, 60, true));

		defaultData();

		FlxG.drawFramerate = Std.int(FlxG.save.data.framerate) - 10;
		FlxG.updateFramerate = Std.int(FlxG.save.data.framerate) - 10;
		FlxG.drawFramerate = FlxG.save.data.framerate;
		FlxG.updateFramerate = FlxG.save.data.framerate;
	}

	function defaultData()
	{
		if (FlxG.save.data.framerate == null)
			FlxG.save.data.framerate = 60;

		if (FlxG.save.data.language == null)
			FlxG.save.data.language = 0;

		if (FlxG.save.data.coin == null)
			FlxG.save.data.coin = 0;

		if (FlxG.save.data.damageBoosterLvl == null)
			FlxG.save.data.damageBoosterLvl = 1;
	}

	#if CRASH_HANDLER
	function onCrash(e:UncaughtErrorEvent):Void
	{
		var errMsg:String = "";
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);

		errMsg = "\nUncaught Error: \n"
			+ e.error
			+ '\n';
			
		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		Sys.println(errMsg);

		Application.current.window.alert(errMsg, "Error!");
		Sys.exit(1);
	}
	#end
}
