package;

import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;
import DataHandler.GetZoom;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end

class MainMenuState extends State
{
    var ls:Int;

    var storyText:FlxText;
    var playText:FlxText;
    var creditsText:FlxText;
    var optionsText:FlxText;
    var shorohovText:FlxText;
    var socialsText:FlxText;
    var storeText:FlxText;

    var bg:FlxSprite;

    var size:Int = Std.int(72 * GetZoom());

    public static var version:String ='0.2';
    var versionText:FlxText;
    var snow:FlxSprite;

    var showSnow:Bool = true;

    override public function create()
    {
        ls = FlxG.save.data.language;

        #if desktop
		DiscordClient.changePresence(DataHandler.discordMenu[ls], '');
		#end

        bg = new FlxBackdrop('assets/images/bgClown.png', 25, 25, true, true);
        bg.scale.set(0.5, 0.5);
        bg.alpha = 0.75;
        add(bg);

        versionText = new FlxText(0, 0, 0, DataHandler.mainMenuVersion[ls] + version, Std.int(size / 2));
        versionText.font = Paths.fontTTF('font1');
        versionText.borderQuality = 1;
        versionText.borderSize = 1;
        versionText.borderStyle = OUTLINE;
        versionText.borderColor = FlxColor.BLACK;
        add(versionText);

        versionText.x = 5;
        versionText.y = FlxG.height - versionText.height + 5;

        storyText = new FlxText(0, 0, 0, DataHandler.mainMenuStoryPlay[ls], size);
        storyText.screenCenter(Y);
        storyText.font = Paths.fontTTF('font1');
        storyText.borderQuality = 1;
        storyText.borderSize = 2;
        storyText.borderStyle = OUTLINE;
        storyText.borderColor = FlxColor.BLACK;
        add(storyText);

        playText = new FlxText(0, 0, 0, DataHandler.mainMenuPlay[ls], size);
        playText.screenCenter(Y);
        playText.font = Paths.fontTTF('font1');
        playText.borderQuality = 1;
        playText.borderSize = 2;
        playText.borderStyle = OUTLINE;
        playText.borderColor = FlxColor.BLACK;
        // add(playText);

        creditsText = new FlxText(0, 0, 0, DataHandler.mainMenuCredits[ls], size);
        creditsText.screenCenter(Y);
        creditsText.font = Paths.fontTTF('font1');
        creditsText.borderQuality = 1;
        creditsText.borderSize = 2;
        creditsText.borderStyle = OUTLINE;
        creditsText.borderColor = FlxColor.BLACK;
        add(creditsText);

        optionsText = new FlxText(0, 0, 0, DataHandler.mainMenuOptions[ls], size);
        optionsText.font = Paths.fontTTF('font1');
        optionsText.borderQuality = 1;
        optionsText.borderSize = 2;
        optionsText.borderStyle = OUTLINE;
        optionsText.borderColor = FlxColor.BLACK;
        optionsText.screenCenter(Y);
        add(optionsText);

        socialsText = new FlxText(0, 0, 0, DataHandler.mainMenuSocials[ls], size);
        socialsText.font = Paths.fontTTF('font1');
        socialsText.borderQuality = 1;
        socialsText.borderSize = 2;
        socialsText.borderStyle = OUTLINE;
        socialsText.borderColor = FlxColor.BLACK;
        socialsText.screenCenter(Y);
        add(socialsText);

        storeText = new FlxText(0, 0, 0, DataHandler.mainMenuStore[ls], size);
        storeText.font = Paths.fontTTF('font1');
        storeText.borderQuality = 1;
        storeText.borderSize = 2;
        storeText.borderStyle = OUTLINE;
        storeText.borderColor = FlxColor.BLACK;
        add(storeText);

        #if !mobile
        shorohovText = new FlxText(0, 0, 0, DataHandler.mainMenuEditor[ls], size);
        shorohovText.screenCenter(Y);
        shorohovText.font = Paths.fontTTF('font1');
        shorohovText.borderQuality = 1;
        shorohovText.borderSize = 2;
        shorohovText.borderStyle = OUTLINE;
        shorohovText.borderColor = FlxColor.BLACK;
        add(shorohovText);
        #end

        storyText.y = storyText.height - 10;
        // playText.y = storyText.y + (storyText.height + 5);
        creditsText.y = storyText.y + (storyText.height + 5);
        optionsText.y = creditsText.y + (creditsText.height + 5);
        socialsText.y = optionsText.y + (optionsText.height + 5);
        storeText.y = socialsText.y + (socialsText.height + 5);

        storyText.x = 10;
        creditsText.x = 10;
        optionsText.x = 10;
        socialsText.x = 10;
        storeText.x = 10;
        // playText.x = 10;
        #if !mobile
        shorohovText.x = 10;
        shorohovText.y = storeText.y + (storeText.height + 5);
        #end

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        bg.x -= 60 / FlxG.save.data.framerate;
        bg.y -= 60 / FlxG.save.data.framerate;

        if (FlxG.mouse.justPressed)
        {
            if (FlxG.mouse.overlaps(storyText))
            {
                FlxG.switchState(new StoryState());
            }
            else if (FlxG.mouse.overlaps(creditsText))
            {
                #if desktop
		        DiscordClient.changePresence(DataHandler.discordCredits[ls], '');
		        #end
                FlxG.switchState(new CreditsState());
            }
            else if (FlxG.mouse.overlaps(optionsText))
            {
                #if desktop
		        DiscordClient.changePresence(DataHandler.discordOptions[ls], '');
		        #end
                FlxG.switchState(new OptionsMenuState());
            }
            else if (FlxG.mouse.overlaps(socialsText))
            {
                #if desktop
		        DiscordClient.changePresence(DataHandler.discordSocials[ls], '');
		        #end
                FlxG.switchState(new SocialsState());
            }
            else if (FlxG.mouse.overlaps(storeText))
            {
                #if desktop
		        DiscordClient.changePresence(DataHandler.discordStore[ls], '');
		        #end
                FlxG.switchState(new StoreState());
            }
            else if (FlxG.mouse.overlaps(playText))
            {
                FlxG.switchState(new PlayState());
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