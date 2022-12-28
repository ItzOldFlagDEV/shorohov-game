package;

import flixel.FlxG;
import flixel.FlxSprite;

class RandomBGSprite extends FlxSprite
{
    var bglist:Array<String> = ['modniy', 'moto', 'king', 'loli'];

    public function new(?isBlured:Bool = false)
    {
        super();

        if (isBlured)
        {
            loadGraphic(Paths.menuBgImages('blured/${bglist[FlxG.random.int(0, bglist.length - 1)]}'), false, 1280, 720);
            scale.set(FlxG.width / 1280, FlxG.height / 720);
        }
        else if (!isBlured)
        {
            loadGraphic(Paths.menuBgImages('blured/${bglist[FlxG.random.int(0, bglist.length - 1)]}'), false, 1280, 720);
            scale.set(FlxG.width / 1280, FlxG.height / 720);
        }
    }
}