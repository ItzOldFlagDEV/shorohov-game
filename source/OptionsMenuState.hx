package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import DataHandler.GetZoom;

class OptionsMenuState extends State
{
	public var ls:Int = 0;

	var selectStart:String = '>  ';
	var selectEnd:String = '  <';

	var optionsArray:Array<String>;

	var languagesArray:Array<String>;
	static var curSelected:Int = 0;

	var optionsTxt:FlxText;

	#if mobile
	var size:Int = 72;

	var backButton:FlxText;
	var upButton:FlxText;
	var downButton:FlxText;
	var acceptButton:FlxText;
	#end

	public function new()
	{
		super();

		ls = FlxG.save.data.language;

		optionsArray = [DataHandler.optionsFpsCap[ls], DataHandler.optionsLanguage[ls]];
		languagesArray = [DataHandler.optionsEnglish[ls], DataHandler.optionsRussian[ls]];

		var bg:RandomBGSprite = new RandomBGSprite(true);
        bg.screenCenter();
        add(bg);

		optionsTxt = new FlxText(0, 0, 0, "", Std.int(32 * GetZoom()));
		optionsTxt.alignment = CENTER;
		optionsTxt.font = Paths.fontTTF('font1');
		optionsTxt.borderQuality = 1;
        optionsTxt.borderSize = 2;
        optionsTxt.borderStyle = OUTLINE;
        optionsTxt.borderColor = FlxColor.BLACK;
		add(optionsTxt);

		for (i in 0...optionsArray.length)
		{
			if (curSelected == i)
			{
				if (i == 0)
					optionsTxt.text += selectStart + '${optionsArray[i]}: ${FlxG.save.data.framerate}' + selectEnd;
				else if (i == 1)
					optionsTxt.text += selectStart + '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}' + selectEnd;
				else
					optionsTxt.text += selectStart + '${optionsArray[i]}' + selectEnd;
			}
			else
			{
				if (i == 0)
					optionsTxt.text += '${optionsArray[i]}: ${FlxG.save.data.framerate}';
				else if (i == 1)
					optionsTxt.text += '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}';
				else
					optionsTxt.text += '${optionsArray[i]}';
			}

			optionsTxt.text += '\n';
		}

		optionsTxt.screenCenter();

		#if mobile
		// Mobile
		backButton = new FlxText(0, 0, 0, 'BACK', size);
		add(backButton);
		upButton = new FlxText(0, 0, 0, 'UP', size);
		add(upButton);
		downButton = new FlxText(0, 0, 0, 'DOWN', size);
		add(downButton);
		acceptButton = new FlxText(0, 0, 0, 'ACCEPT', size);
		add(acceptButton);

		// BACK BUTTON POSITION
		backButton.x = FlxG.width - backButton.width + 5;
		backButton.y = acceptButton.y;

		// ACCEPT BUTTON POSITION
		acceptButton.x = FlxG.width - acceptButton.width + 5;
		acceptButton.y = FlxG.height - acceptButton.height + 5;

		// UP BUTTON POSITION
		upButton.x = 5;
		upButton.y = downButton.y;

		// DOWN BUTTON POSITION
		downButton.x = 5;
		downButton.y = FlxG.height - downButton.height + 5;
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.W #if mobile || FlxG.mouse.overlaps(upButton) && FlxG.mouse.justPressed #end)
		{
			optionsTxt.text = '';
			curSelected--;

			if (curSelected < 0)
				curSelected = optionsArray.length - 1;

			for (i in 0...optionsArray.length)
			{
				if (curSelected == i)
				{
					if (i == 0)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${FlxG.save.data.framerate}' + selectEnd;
					else if (i == 1)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}' + selectEnd;
					else
						optionsTxt.text += selectStart + '${optionsArray[i]}' + selectEnd;
				}
				else
				{
					if (i == 0)
						optionsTxt.text += '${optionsArray[i]}: ${FlxG.save.data.framerate}';
					else if (i == 1)
						optionsTxt.text += '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}';
					else
						optionsTxt.text += '${optionsArray[i]}';
				}
				optionsTxt.text += '\n';
			}

			optionsTxt.screenCenter();
			trace(curSelected);
		}
		if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
		{
			optionsTxt.text = '';
			curSelected++;

			if (curSelected > optionsArray.length - 1)
				curSelected = 0;

			for (i in 0...optionsArray.length)
			{
				if (curSelected == i)
				{
					if (i == 0)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${FlxG.save.data.framerate}' + selectEnd;
					else if (i == 1)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}' + selectEnd;
					else
						optionsTxt.text += selectStart + '${optionsArray[i]}' + selectEnd;
				}
				else
				{
					if (i == 0)
						optionsTxt.text += '${optionsArray[i]}: ${FlxG.save.data.framerate}';
					else if (i == 1)
						optionsTxt.text += '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}';
					else
						optionsTxt.text += '${optionsArray[i]}';
				}
				optionsTxt.text += '\n';
			}

			optionsTxt.screenCenter();
			trace(curSelected);
		}

		if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
		{
			if (curSelected == 0)
			{
				#if mobile
				FlxG.save.data.framerate += 10;
				if (FlxG.save.data.framerate > 120)
					FlxG.save.data.framerate = 60;
				#else
				if (FlxG.keys.pressed.SHIFT)
					if (FlxG.save.data.framerate >= 900)
						FlxG.save.data.framerate += 1000 - FlxG.save.data.framerate;
					else
						FlxG.save.data.framerate += 100;
				else
					FlxG.save.data.framerate += 10;

				if (FlxG.save.data.framerate > 1000)
					FlxG.save.data.framerate = 60;
				#end

				FlxG.drawFramerate = FlxG.save.data.framerate;
				FlxG.updateFramerate = FlxG.save.data.framerate;
				FlxG.save.flush();
			}
			else if (curSelected == 1)
			{
				FlxG.save.data.language += 1;
				if (FlxG.save.data.language > languagesArray.length - 1)
					FlxG.save.data.language = 0;
				updateTextLanguage();
				FlxG.save.flush();
			}
			else
				trace('idk');

			optionsTxt.text = '';
			
			for (i in 0...optionsArray.length)
			{
				if (curSelected == i)
				{
					if (i == 0)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${FlxG.save.data.framerate}' + selectEnd;
					else if (i == 1)
						optionsTxt.text += selectStart + '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}' + selectEnd;
					else
						optionsTxt.text += selectStart + '${optionsArray[i]}' + selectEnd;
				}
				else
				{
					if (i == 0)
						optionsTxt.text += '${optionsArray[i]}: ${FlxG.save.data.framerate}';
					else if (i == 1)
						optionsTxt.text += '${optionsArray[i]}: ${languagesArray[FlxG.save.data.language]}';
					else
						optionsTxt.text += '${optionsArray[i]}';
				}
				optionsTxt.text += '\n';
			}

			optionsTxt.screenCenter();
		}

		if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
		{
			FlxG.save.flush();
			FlxG.switchState(new MainMenuState());
		}
	}

	function updateTextLanguage()
	{
		FlxG.save.flush();
		FlxG.switchState(new OptionsMenuState());
	}
}
