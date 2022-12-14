package;

import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end

class SocialsSubState extends FlxSubState
{
	public var ls:Int = 0;

	var selectStart:String = '>  ';
	var selectEnd:String = '  <';

	var curSelected:Int = 0;

	var socialTxt:FlxText;

	var socialsArray:Array<Data>;

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

		#if desktop
		DiscordClient.changePresence('Checking our socials', '');
		#end

		ls = FlxG.save.data.language;

		socialsArray = [
			new Data(LanguageHandler.socialsGitHubName[ls], LanguageHandler.socialsGitHubDesc[ls], 'github.com/ItzOldFlagDEV/shorohov-game'),
			new Data(LanguageHandler.socialsVKName[ls], LanguageHandler.socialsVKDesc[ls], 'vk.com/shorohovgame')
		];

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.height * 3, FlxG.width * 3, FlxColor.BLACK);
		bg.alpha = 0.85;
		bg.screenCenter();
		add(bg);

		socialTxt = new FlxText(0, 0, 0, "", 32);
		socialTxt.alignment = CENTER;
		socialTxt.font = Paths.fontTTF('font1');
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
			#if desktop
			DiscordClient.changePresence('Browsing in menu', '');
			#end
			close();
		}
	}
}

class Data
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
