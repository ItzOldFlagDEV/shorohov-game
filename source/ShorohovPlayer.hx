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
                scale.set(1.5, 1.5);
            case 'kaneki':
                loadGraphic(Paths.shorohovImages('kaneki'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'mexico':
                loadGraphic(Paths.shorohovImages('mexico'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'naruto':
                loadGraphic(Paths.shorohovImages('naruto'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'zabivnoy':
                loadGraphic(Paths.shorohovImages('zabivnoy'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'ricardo':
                loadGraphic(Paths.shorohovImages('ricardo'), true, 300, 300);

                animsArray = ["First", "Second", "Third", "Fourth", "Fifth"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'grisha':
                loadGraphic(Paths.shorohovImages('grisha'), true, 300, 300);

                animsArray = ["Molodoy", "Chill", "Pivasik"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'zloy':
                loadGraphic(Paths.shorohovImages('zloy'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'skala':
                loadGraphic(Paths.shorohovImages('skala'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'noviy_god':
                loadGraphic(Paths.shorohovImages('noviy_god'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'king':
                loadGraphic(Paths.shorohovImages('king'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'demon':
                loadGraphic(Paths.shorohovImages('demon'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'skywalker_lmao':
                loadGraphic(Paths.shorohovImages('skywalker_lmao'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'cop':
                loadGraphic(Paths.shorohovImages('cop'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'old_shoroh':
                loadGraphic(Paths.shorohovImages('old_shoroh'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'strong':
                loadGraphic(Paths.shorohovImages('strong'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'killer':
                loadGraphic(Paths.shorohovImages('killer'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            case 'anime':
                loadGraphic(Paths.shorohovImages('anime'), true, 300, 300);

                animsArray = ["Normal", "Crying"];

                for (i in 0...animsArray.length)
                {
                    animation.add(animsArray[i], [i], 1, false);
                }

                animation.play(animsArray[0]);
                scale.set(1.5, 1.5);
            /*
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
            */
        }
    }
}