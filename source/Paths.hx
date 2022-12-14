package;

class Paths
{
    public static function images(key:String)
    {
        var pathGet = 'assets/images/' + key + '.png';
        return(pathGet);
    }

    public static function shorohovImages(key:String)
    {
        var pathGet = 'assets/images/shorohovs/' + key + '.png';
        return(pathGet);
    }

    public static function bgImages(key:String)
    {
        var pathGet = 'assets/images/bgs/' + key + '.png';
        return(pathGet);
    }

    public static function fontTTF(key:String)
    {
        var pathGet = 'assets/fonts/' + key + '.ttf';
        return(pathGet);
    }

    public static function fontOpenType(key:String)
    {
        var pathGet = 'assets/fonts/' + key + '.otf';
        return(pathGet);
    }

    public static function levelJson(key:String)
    {
        var pathGet = 'assets/data/levels/' + key + '.json';
        return(pathGet);
    }

    public static function shorohovJson(key:String)
    {
        var pathGet = 'assets/data/shorohovs/' + key + '.json';
        return(pathGet);
    }

    public static function bgJson(key:String)
    {
        var pathGet = 'assets/data/bgs/' + key + '.json';
        return(pathGet);
    }

    public static function preloadPath(key:String)
    {
        var pathGet = 'assets/images/' + key;
        return(pathGet);
    }
}