package;

#if sys
import sys.io.File;
import haxe.Json;
#end
import flash.media.Sound;
import haxe.Json;
import flixel.FlxG;
import flixel.FlxSprite;

typedef JsonData =
{
    image:String,
    animsArray:Array<String>,
    width:Int,
    height:Int,
    scaleX:Int,
    scaleY:Int
}

class ShorohovPlayer extends FlxSprite
{
    public static var animsArray:Array<String>;

    public static var imageJson:String;
    public static var animsArrayJson:Array<String>;
    public static var widthJson:Int;
    public static var heightJson:Int;
    public static var scaleX:Int;
    public static var scaleY:Int;

    public function new(x:Float, y:Float, type:String) 
    {
        super(x, y, type);

        switch (type)
        {
            case 'notFound':
                loadGraphic(Paths.shorohovImages('shorohQue'), true, 300, 300);

                animsArray = ['Normal'];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1, 1);
            case 'default':
                loadGraphic(Paths.shorohovImages('shorohov'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'kaneki':
                loadGraphic(Paths.shorohovImages('kaneki'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'mexico':
                loadGraphic(Paths.shorohovImages('mexico'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'naruto':
                loadGraphic(Paths.shorohovImages('naruto'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'zabivnoy':
                loadGraphic(Paths.shorohovImages('zabivnoy'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'ricardo':
                loadGraphic(Paths.shorohovImages('ricardo'), true, 300, 300);

                animsArray = ["First", "Second", "Third", "Fourth", "Fifth"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);
            case 'grisha':
                loadGraphic(Paths.shorohovImages('grisha'), true, 300, 300);

                animsArray = ["Molodoy", "Chill", "Pivasik"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(2, 2);

            #if desktop
            default:
                var toParse:String = File.getContent(Paths.shorohovJson(type));
                var _json:JsonData = cast haxe.Json.parse(toParse);

                imageJson = _json.image;
                animsArrayJson = _json.animsArray;
                widthJson = _json.width;
                heightJson = _json.height;
                scaleX = _json.scaleX;
                scaleY = _json.scaleY;

                loadGraphic(Paths.shorohovImages(imageJson), true, 300, 300);

                animsArray = animsArrayJson;

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(scaleX, scaleY);
            #end

            var resize:Float = (1280 / FlxG.width);

            scale.set(scale.x * resize, scale.y * resize);
        }
    }
}