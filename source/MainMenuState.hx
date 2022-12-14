package;

import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end

class MainMenuState extends FlxState
{
    var playText:FlxText;
    var creditsText:FlxText;
    var optionsText:FlxText;
    var shorohovText:FlxText;

    var bg:FlxSprite;

    var size:Int = 72;

    public static var version:String ='0.1';
    var versionText:FlxText;

    override public function create()
    {
        var ls:Int = FlxG.save.data.language;

        #if desktop
		DiscordClient.changePresence('Browsing in menu', '');
		#end
        
        if (FlxG.save.data.coin == null)
			FlxG.save.data.coin = 0;
        
        super.create();

        bg = new FlxBackdrop('assets/images/bgClown.png', 25, 25, true, true);
        bg.scale.set(0.5, 0.5);
        bg.alpha = 0.75;
        add(bg);

        versionText = new FlxText(0, 0, 0, LanguageHandler.mainVersion[ls] + version, Std.int(size / 2));
        versionText.font = Paths.fontTTF('font1');
        versionText.borderQuality = 1;
        versionText.borderSize = 1;
        versionText.borderStyle = OUTLINE;
        versionText.borderColor = FlxColor.BLACK;
        add(versionText);

        versionText.x = 5;
        versionText.y = FlxG.height - versionText.height + 5;

        playText = new FlxText(0, 0, 0, LanguageHandler.mainMenuPlay[ls], size);
        playText.screenCenter(Y);
        playText.font = Paths.fontTTF('font1');
        playText.borderQuality = 1;
        playText.borderSize = 2;
        playText.borderStyle = OUTLINE;
        playText.borderColor = FlxColor.BLACK;
        add(playText);

        creditsText = new FlxText(0, 0, 0, LanguageHandler.mainMenuCredits[ls], size);
        creditsText.screenCenter(Y);
        creditsText.font = Paths.fontTTF('font1');
        creditsText.borderQuality = 1;
        creditsText.borderSize = 2;
        creditsText.borderStyle = OUTLINE;
        creditsText.borderColor = FlxColor.BLACK;
        add(creditsText);

        optionsText = new FlxText(0, 0, 0, LanguageHandler.mainMenuOptions[ls], size);
        optionsText.font = Paths.fontTTF('font1');
        optionsText.borderQuality = 1;
        optionsText.borderSize = 2;
        optionsText.borderStyle = OUTLINE;
        optionsText.borderColor = FlxColor.BLACK;
        optionsText.screenCenter(Y);
        add(optionsText);

        #if !mobile
        shorohovText = new FlxText(0, 0, 0, LanguageHandler.mainMenuEditor[ls], size);
        shorohovText.screenCenter(Y);
        shorohovText.font = Paths.fontTTF('font1');
        shorohovText.borderQuality = 1;
        shorohovText.borderSize = 2;
        shorohovText.borderStyle = OUTLINE;
        shorohovText.borderColor = FlxColor.BLACK;
        add(shorohovText);
        #end

        playText.y = playText.height - 10;
        creditsText.y = playText.y + (playText.height + 5);
        optionsText.y = creditsText.y + (creditsText.height + 5);

        playText.x = 10;
        creditsText.x = 10;
        optionsText.x = 10;
        #if !mobile
        shorohovText.x = 10;
        shorohovText.y = optionsText.y + (optionsText.height + 5);
        #end
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        bg.x -= 60 / FlxG.save.data.framerate;
        bg.y -= 60 / FlxG.save.data.framerate;

        if (FlxG.mouse.justPressed)
        {
            if (FlxG.mouse.overlaps(playText))
            {
                FlxG.switchState(new PrePlayState());
            }
            else if (FlxG.mouse.overlaps(creditsText))
            {
                #if desktop
		        DiscordClient.changePresence('Watching credits', '');
		        #end
                openSubState(new CreditsSubState());
            }
            else if (FlxG.mouse.overlaps(optionsText))
            {
                #if desktop
		        DiscordClient.changePresence('Browsing in options menu', '');
		        #end
                FlxG.switchState(new OptionsMenuState());
            }
            #if !mobile
            else if (FlxG.mouse.overlaps(shorohovText))
            {
                FlxG.switchState(new EditorState());
            }
            #end
        }
    }
}