package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import DataHandler.GetZoom;

class SocialsState extends State
{
	public var ls:Int = 0;

	var selectStart:String = '>  ';
	var selectEnd:String = '  <';

	var curSelected:Int = 0;

	var socialTxt:FlxText;

	var socialsArray:Array<DataSocials>;

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

		socialsArray = [
			new DataSocials(DataHandler.socialsGitHubName[ls], DataHandler.socialsGitHubDesc[ls], 'github.com/ItzOldFlagDEV/shorohov-game'),
			new DataSocials(DataHandler.socialsVKName[ls], DataHandler.socialsVKDesc[ls], 'vk.com/shorohovgame')
		];

		var bg:RandomBGSprite = new RandomBGSprite(true);
        bg.screenCenter();
        add(bg);

		socialTxt = new FlxText(0, 0, 0, "", Std.int(32 * GetZoom()));
		socialTxt.alignment = CENTER;
		socialTxt.font = Paths.fontTTF('font1');
		socialTxt.borderQuality = 1;
        socialTxt.borderSize = 2;
        socialTxt.borderStyle = OUTLINE;
        socialTxt.borderColor = FlxColor.BLACK;
		add(socialTxt);

		for (i in 0...socialsArray.length)
		{
			if (curSelected == i)
			{
				socialTxt.text += selectStart + '${socialsArray[i].name} - ${socialsArray[i].whatDo}' + selectEnd;
			}
			else
			{
				socialTxt.text += '${socialsArray[i].name} - ${socialsArray[i].whatDo}';
			}

			socialTxt.text += '\n';
		}

		socialTxt.screenCenter();

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
			socialTxt.text = '';
			curSelected--;

			if (curSelected < 0)
				curSelected = socialsArray.length - 1;

			for (i in 0...socialsArray.length)
			{
				if (curSelected == i)
				{
					socialTxt.text += selectStart + '${socialsArray[i].name} - ${socialsArray[i].whatDo}' + selectEnd;
				}
				else
				{
					socialTxt.text += '${socialsArray[i].name} - ${socialsArray[i].whatDo}';
				}

				socialTxt.text += '\n';
			}

			socialTxt.screenCenter();
			trace(curSelected);
		}
		if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
		{
			socialTxt.text = '';
			curSelected++;

			if (curSelected > socialsArray.length - 1)
				curSelected = 0;

			for (i in 0...socialsArray.length)
			{
				if (curSelected == i)
				{
					socialTxt.text += selectStart + '${socialsArray[i].name} - ${socialsArray[i].whatDo}' + selectEnd;
				}
				else
				{
					socialTxt.text += '${socialsArray[i].name} - ${socialsArray[i].whatDo}';
				}

				socialTxt.text += '\n';
			}

			socialTxt.screenCenter();
			trace(curSelected);
		}

		if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
		{
			for (i in 0...socialsArray.length)
			{
				var stringLink:String = socialsArray[i].link;
				trace(socialsArray[i].link);

				if (curSelected == i)
				{
					#if linux
					Sys.command('/usr/bin/xdg-open', ['https://${stringLink}']);
					#else
					FlxG.openURL('https://${stringLink}');
					#end
				}
			}
		}

		if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}

class DataSocials
{
	public var name:String;
	public var whatDo:String;
	public var link:String;

	public function new(name:String, whatDo:String, link:String)
	{
		this.name = name;
		this.whatDo = whatDo;
		this.link = link;
	}
}
