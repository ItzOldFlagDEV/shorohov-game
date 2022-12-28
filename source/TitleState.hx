package;

import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end

class TitleState extends State
{
    var russianFlag:FlxSprite;
    var usaFlag:FlxSprite;
    
    var shitText:FlxText;

    var textLanguage:FlxText;

    var isLast:Bool = false;

    var flagSelected:Bool = false;

    override public function create() 
    {
        DataHandler.loadTranslate(); // This func loads languages

        #if !mobile
        FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = true;
        FlxG.autoPause = false;
        #end

        #if desktop
        DiscordClient.initialize();
		DiscordClient.changePresence(DataHandler.discordTitle[FlxG.save.data.language], '');
		#end

        if (!FlxG.save.data.alreadySelectedLanguage)
        {
            russianFlag = new FlxSprite().loadGraphic(Paths.images('flags/rus'));
            add(russianFlag);
    
            usaFlag = new FlxSprite().loadGraphic(Paths.images('flags/usa'));
            add(usaFlag);

            russianFlag.screenCenter(Y);
            usaFlag.screenCenter(Y);
    
            usaFlag.x = FlxG.width - usaFlag.width * 1.5;
            russianFlag.x = russianFlag.width / 1.5;

            textLanguage = new FlxText(0, 0, FlxG.width - 96, '', 64);
            textLanguage.text = 'Select language // Выбери язык';
            textLanguage.font = Paths.fontTTF('font1');
            textLanguage.screenCenter(X);
            textLanguage.y = FlxG.height - (textLanguage.height + 10);
            add(textLanguage);

            flagSelected = true;
        }
        else
        {
            startTitle();
        }

        super.create();
    }

    function startTitle() 
    {
        if (flagSelected)
        {
            remove(russianFlag);
            remove(usaFlag);
            remove(textLanguage);
        }

        var bg:RandomBGSprite = new RandomBGSprite(true);
        bg.screenCenter();
        add(bg);

        shitText = new FlxText(0, 0, FlxG.width - 96, '', 64);
        shitText.alignment = CENTER;
		shitText.font = Paths.fontTTF('font1');
        shitText.borderQuality = 2;
        shitText.borderSize = 4;
        shitText.borderStyle = OUTLINE;
        shitText.borderColor = FlxColor.BLACK;
        add(shitText);

        shitText.text = DataHandler.titlestatePart1[FlxG.save.data.language];
        shitText.screenCenter();

        new FlxTimer().start(2.6, function(tmr:FlxTimer) 
        {
            FlxTween.tween(shitText, {alpha: 0}, 0.4);
            new FlxTimer().start(0.6, function(tmr:FlxTimer) 
            {
                shitText.text = DataHandler.titlestatePart2[FlxG.save.data.language];
                shitText.screenCenter();
                new FlxTimer().start(1.2, function(tmr:FlxTimer) 
                {
                    shitText.text = DataHandler.titlestatePart2[FlxG.save.data.language];
                    shitText.screenCenter();
                    FlxTween.tween(shitText, {alpha: 1}, 0.4);
                    new FlxTimer().start(2.1, function(tmr:FlxTimer) 
                    {
                        FlxTween.tween(shitText, {alpha: 0}, 0.4);

                        new FlxTimer().start(0.5, function(tmr:FlxTimer) 
                        {
                            remove(shitText);
                            shitText.text = DataHandler.titlestatePart3[FlxG.save.data.language];
                            shitText.size = 32;
                            shitText.screenCenter();
                            shitText.borderQuality = 1;
                            shitText.borderSize = 2;
                            shitText.borderStyle = OUTLINE;
                            shitText.borderColor = FlxColor.BLACK;
                            add(shitText);

                            FlxTween.tween(shitText, {alpha: 1}, 0.4);

                            isLast = true;

                            part3Func();
                        });
                    });
                });
            });
        });
    }

    function part3Func()
    {
        new FlxTimer().start(0.5, function(tmr:FlxTimer)
        {
            FlxTween.tween(shitText, {alpha: 0}, 0.4);

            new FlxTimer().start(0.5, function(tmr:FlxTimer)
            {
                FlxTween.tween(shitText, {alpha: 1}, 0.4);
                part3Func();
            });
        });
    }

    override public function update(elapsed:Float) 
    {
        if (FlxG.mouse.justPressed && !FlxG.save.data.alreadySelectedLanguage)
        {
            if (FlxG.mouse.overlaps(russianFlag))
            {
                FlxG.save.data.language = 1;
                FlxG.save.data.alreadySelectedLanguage = true;
                startTitle();
                FlxG.save.flush();
            }
            else if (FlxG.mouse.overlaps(usaFlag))
            {
                FlxG.save.data.language = 0;
                FlxG.save.data.alreadySelectedLanguage = true;
                startTitle();
                FlxG.save.flush();
            }
        }
        
        if (isLast && FlxG.keys.justReleased.ANY || isLast && FlxG.mouse.justReleased)
        {
            FlxG.switchState(new MainMenuState());
        }

        super.update(elapsed);
    }
}