package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;
import DataHandler.GetZoom;

class StoryState extends State
{
	var selectStart:String = '>  ';
	var selectEnd:String = '  <';

	public static var levelsArray:Array<String> = [
		'Original shorohov',
		'Naruto shorohov',
		'Tokyo shorohov',
		'Mexico shorohov',
		'Trendy shorohov',
		'Angry shorohov',
		'Skala shorohov',
		'Xmas shorohov',
        'King shorohov',
        'Hell shorohov',
        'Jedi shorohov',
        'Cop shorohov',
        'Old shorohov',
        'Strong shorohov',
        'Killer shorohov',
        'Anime shorohov'
	];

	var curSelected:Int = 0;

	var levelsTxt:FlxText;

	public var ls:Int = 0;

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
		camera.setPosition(0, 0);

		var bg:RandomBGSprite = new RandomBGSprite(true);
		bg.screenCenter();
		add(bg);

		levelsTxt = new FlxText(0, 0, 0, "", Std.int(32 * GetZoom()));
		levelsTxt.alignment = CENTER;
		levelsTxt.borderQuality = 1;
		levelsTxt.font = Paths.fontTTF('font1');
		levelsTxt.borderSize = 2;
		levelsTxt.borderStyle = OUTLINE;
		levelsTxt.borderColor = FlxColor.BLACK;
		add(levelsTxt);

		updateText();

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

	function updateText() 
	{
		if (curSelected < 0)
			curSelected = 0;

		if (curSelected > levelsArray.length - 1)
			curSelected = levelsArray.length - 1;

		for (i in 0...levelsArray.length)
		{
			var currentLevel:Array<String> = DataHandler.storyMenuSongs[i];
			if (curSelected == i)
			{
				levelsTxt.text += selectStart + '${currentLevel[ls]}' + selectEnd;
			}
			else
			{
				levelsTxt.text += '${currentLevel[ls]}';
			}
			levelsTxt.text += '\n';
		}

		levelsTxt.y = (-(curSelected) * Std.int(32 * GetZoom())) * 0.25;
			
		levelsTxt.screenCenter(X);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.W #if mobile || FlxG.mouse.overlaps(upButton) && FlxG.mouse.justPressed #end)
		{
			levelsTxt.text = '';
			curSelected--;
			updateText();
		}
		if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
		{
			levelsTxt.text = '';
			curSelected++;
			updateText();
		}

		if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
		{
			for (i in 0...levelsArray.length)
			{
				FlxG.switchState(new PlayState(levelsArray[curSelected]));
			}
		}

		if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}
