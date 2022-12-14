package;

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
            case 'School 59':
                coinMin = 100;
                coinMax = 1000;
                curShorohov = "default";
                health = 100;
                curBg = "school";
            case 'Naruto':
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