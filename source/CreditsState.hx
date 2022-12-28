package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import DataHandler.GetZoom;

class CreditsState extends State
{
	public var ls:Int = 0;

	var selectStart:String = '>  ';
	var selectEnd:String = '  <';

	var curSelected:Int = 0;

	var creditTxt:FlxText;

	var creditsArray:Array<DataCredits>;

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

		creditsArray = [
			new DataCredits('OldFlag', DataHandler.creditsOldFlag[ls], 'vk.com/oldflagg'),
			new DataCredits('Egor Shorohov', DataHandler.creditsEgor[ls], ''),
			new DataCredits('Maxpool', DataHandler.creditsMaxpool[ls], 'vk.com/lolkekchiburek228'),
			new DataCredits('Listan', DataHandler.creditsListan[ls], 'vk.com/1tsuk1'),
			// new DataCredits('Fox8377', DataHandler.creditsFox[ls], 'vk.com/markin781'),
			new DataCredits('CEO', DataHandler.creditsEvan[ls], 'vk.com/go4hst')
		];

		var bg:RandomBGSprite = new RandomBGSprite(true);
        bg.screenCenter();
        add(bg);

		creditTxt = new FlxText(0, 0, FlxG.width - 128, "", Std.int(32 * GetZoom()));
		creditTxt.alignment = CENTER;
		creditTxt.font = Paths.fontTTF('font1');
		creditTxt.borderQuality = 1;
        creditTxt.borderSize = 2;
        creditTxt.borderStyle = OUTLINE;
        creditTxt.borderColor = FlxColor.BLACK;
		add(creditTxt);

		for (i in 0...creditsArray.length)
		{
			if (curSelected == i)
			{
				creditTxt.text += selectStart + '${creditsArray[i].name} - ${creditsArray[i].whatDo}' + selectEnd;
			}
			else
			{
				creditTxt.text += '${creditsArray[i].name} - ${creditsArray[i].whatDo}';
			}

			creditTxt.text += '\n';
		}

		creditTxt.screenCenter();

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
			creditTxt.text = '';
			curSelected--;

			if (curSelected < 0)
				curSelected = creditsArray.length - 1;

			for (i in 0...creditsArray.length)
			{
				if (curSelected == i)
				{
					creditTxt.text += selectStart + '${creditsArray[i].name} - ${creditsArray[i].whatDo}' + selectEnd;
				}
				else
				{
					creditTxt.text += '${creditsArray[i].name} - ${creditsArray[i].whatDo}';
				}

				creditTxt.text += '\n';
			}

			creditTxt.screenCenter();
			trace(curSelected);
		}
		if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
		{
			creditTxt.text = '';
			curSelected++;

			if (curSelected > creditsArray.length - 1)
				curSelected = 0;

			for (i in 0...creditsArray.length)
			{
				if (curSelected == i)
				{
					creditTxt.text += selectStart + '${creditsArray[i].name} - ${creditsArray[i].whatDo}' + selectEnd;
				}
				else
				{
					creditTxt.text += '${creditsArray[i].name} - ${creditsArray[i].whatDo}';
				}

				creditTxt.text += '\n';
			}

			creditTxt.screenCenter();
			trace(curSelected);
		}

		if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
		{
			for (i in 0...creditsArray.length)
			{
				var stringLink:String = creditsArray[i].link;
				trace(creditsArray[i].link);

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

class DataCredits
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
