package;

import flixel.FlxG;
#if desktop
#if sys
import sys.io.File;
#end
import haxe.Json;
#end

typedef JsonToData =
{
    coinMin:Int,
    coinMax:Int,
    boss:String,
    health:Int
}

class LevelData 
{
    public static function load(level:String)
    {
        var coinMin:Int = 0;
        var coinMax:Int = 100;
        var curShorohov:String = "default";
        var health:Int = 50;
        var curLevel:String = level;
        var curBg:String = "shcool";

        switch(level)
        {
            case 'Original shorohov':
                coinMin = 100;
                coinMax = 1000;
                curShorohov = "default";
                health = 100;
                curBg = "school";
            case 'Naruto shorohov':
                coinMin = 120;
                coinMax = 1300;
                curShorohov = "naruto";
                health = 185;
                curBg = "naruto";
            case 'Tokyo shorohov':
                coinMin = 500;
                coinMax = 5000;
                curShorohov = "kaneki";
                health = 500;
                curBg = "tokyo_ghoul";
            case 'Mexico shorohov':
                coinMin = 590;
                coinMax = 5900;
                curShorohov = "mexico";
                health = 750;
                curBg = "mexico";
            case 'Trendy shorohov':
                coinMin = 650;
                coinMax = 6500;
                curShorohov = "zabivnoy";
                health = 850;
                curBg = "memes";
            case 'Angry shorohov':
                coinMin = 750;
                coinMax = 7500;
                curShorohov = "zloy";
                health = 1000;
                curBg = "russian_hrushovka";
            case 'Skala shorohov':
                coinMin = 950;
                coinMax = 9700;
                curShorohov = "skala";
                health = 1250;
                curBg = "skala";
            case 'Xmas shorohov':
                coinMin = 1200;
                coinMax = 15000;
                curShorohov = "noviy_god";
                health = 850;
                curBg = "xmas";
            case 'King shorohov':
                coinMin = 1900;
                coinMax = 11000;
                curShorohov = "king";
                health = 1500;
                curBg = "king";
            case 'Hell shorohov':
                coinMin = 2400;
                coinMax = 13000;
                curShorohov = "demon";
                health = 1750;
                curBg = "hell";
            case 'Jedi shorohov':
                coinMin = 3400;
                coinMax = 16000;
                curShorohov = "skywalker_lmao";
                health = 2200;
                curBg = "star_wars";
            case 'Cop shorohov':
                coinMin = 4500;
                coinMax = 18000;
                curShorohov = "cop";
                health = 2500;
                curBg = "cop";
            case 'Old shorohov':
                coinMin = 7500;
                coinMax = 23000;
                curShorohov = "old_shoroh";
                health = 3000;
                curBg = "USSR";
            case 'Strong shorohov':
                coinMin = 8500;
                coinMax = 28000;
                curShorohov = "strong";
                health = 3700;
                curBg = "strong";
            case 'Killer shorohov':
                coinMin = 8500;
                coinMax = 28000;
                curShorohov = "killer";
                health = 3900;
                curBg = "killer";
            case 'Anime shorohov':
                coinMin = 10000;
                coinMax = 34000;
                curShorohov = "anime";
                health = 4500;
                curBg = "anime";
            default:
                #if desktop
                curLevel = level.toLowerCase();
                var toParse:String = File.getContent(Paths.levelJson(curLevel));

                trace('\nLoading data from ${curLevel}.json...\n LOADED DATA\n' + toParse);

                var _json:JsonToData = cast haxe.Json.parse(toParse);

                coinMin = _json.coinMin;
                coinMax = _json.coinMax;
                curShorohov = _json.boss;
                health = _json.health;
                #else
                coinMin = 100;
                coinMax = 1000;
                curShorohov = "default";
                health = 120;
                curBg = "school";
                #end
        }

        // lmao
        PlayState.coinMin = coinMin;
        PlayState.coinMax = coinMax;
        PlayState.curShorohov = curShorohov;
        PlayState.health = health;
        PlayState.curLevel = curLevel;
        PlayState.curBg = curBg;
    }
}