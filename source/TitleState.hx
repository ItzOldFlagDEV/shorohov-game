package;

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

class TitleState extends FlxState
{
    var russianFlag:FlxSprite;
    var usaFlag:FlxSprite;
    
    var shitText:FlxText;

    var textLanguage:FlxText;

    var isLast:Bool = false;

    var flagSelected:Bool = false;

    override public function create() 
    {
        LanguageHandler.loadData(); // This func loads languages

        #if !mobile
        FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = true;
        #end

        #if desktop
        DiscordClient.initialize();
		DiscordClient.changePresence('Looking title', '');
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

            textLanguage = new FlxText(0, 0, 0, '', 64);
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
        shitText = new FlxText(0, 0, 0, '', 64);
        shitText.alignment = CENTER;
		shitText.font = Paths.fontTTF('font1');
        add(shitText);

        shitText.text = LanguageHandler.titlestatePart1[FlxG.save.data.language];
        shitText.screenCenter();

        new FlxTimer().start(2.6, function(tmr:FlxTimer) 
        {
            FlxTween.tween(shitText, {alpha: 0}, 0.4);
            new FlxTimer().start(0.6, function(tmr:FlxTimer) 
            {
                shitText.text = LanguageHandler.titlestatePart2[FlxG.save.data.language];
                shitText.screenCenter();
                new FlxTimer().start(1.2, function(tmr:FlxTimer) 
                {
                    shitText.text = LanguageHandler.titlestatePart2[FlxG.save.data.language];
                    shitText.screenCenter();
                    FlxTween.tween(shitText, {alpha: 1}, 0.4);
                    new FlxTimer().start(2.1, function(tmr:FlxTimer) 
                    {
                        FlxTween.tween(shitText, {alpha: 0}, 0.4);

                        new FlxTimer().start(0.5, function(tmr:FlxTimer) 
                        {
                            remove(shitText);
                            shitText.text = LanguageHandler.titlestatePart3[FlxG.save.data.language];
                            shitText.size = 32;
                            shitText.screenCenter();
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