package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxInputText;

class ConsoleSubState extends FlxSubState
{
	var currentCoomand:String = '';
	var commandLine:FlxUIInputText;

	var isEnable:Bool = true;

	public static var typedCommands:Array<String> = [];

	public function new()
	{
		super();

		if (isEnable)
		{
			var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.GRAY);
			bg.alpha = 0.35;
			add(bg);

			var applyButton:FlxButton = new FlxButton(0, 0, "Apply", function()
			{
				currentCoomand = commandLine.text;
				typedCommands.push(currentCoomand);
				applyCommand(currentCoomand);
				commandLine.text = '';
			});
			applyButton.x = FlxG.width - applyButton.width;
			add(applyButton);

			commandLine = new FlxUIInputText(0, 0, Std.int(FlxG.width - (applyButton.width + 5)), Std.int(applyButton.height - 8));
			add(commandLine);

			commandLine.y = FlxG.height - commandLine.height;
			applyButton.y = FlxG.height - applyButton.height;
		}
        else
        {
            close();
        }
	}

	function applyCommand(command:String)
	{
		switch (command.toLowerCase())
		{
			case 'close':
				close();
			case 'switch_mm':
				FlxG.switchState(new MainMenuState());
			case 'switch_ts':
				FlxG.switchState(new TitleState());
			case 'add_coins':
				FlxG.save.data.coin += 20000000;
			case 'kill_shorohov':
				PlayState.health -= PlayState.health;
			case 'reset_busters':
				FlxG.save.data.damageBoosterLvl = 1;
				FlxG.save.data.coinsBoosterLvl = 1;
			case 'reset_coins':
				FlxG.save.data.coin = 0;
			case 'flxg_save':
				FlxG.save.flush();
			case 'switch_force_visible':
				StoreState.forceVisible = !StoreState.forceVisible;
			#if sys
			case 'exit':
				Sys.exit(1);
			#end
			default:
				trace('Unknown command: ' + command.toLowerCase());
		}
	}

	override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            close();
        }

		if (FlxG.keys.justPressed.ENTER)
		{
			currentCoomand = commandLine.text;
			typedCommands.push(currentCoomand);
			applyCommand(currentCoomand);
			commandLine.text = '';
		}
    }
}
