package;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class Brawlers extends FlxSprite
{
    public function new(name:String, ?size:Float = 1) 
    {
        super();
        
        var tex:FlxAtlasFrames = Paths.sprites('brawlersHelpersSheet');
        frames = tex;

        animation.addByPrefix('brat_serega', 'brat_serega', 1, false);
        animation.addByPrefix('cupa_cups', 'cupa_cups', 1, false);
        animation.addByPrefix('delovoy', 'delovoy', 1, false);
        animation.addByPrefix('kaif', 'kaif', 1, false);
        animation.addByPrefix('nikoglai', 'nikoglai', 1, false);
        animation.addByPrefix('roma_ahuel', 'roma_ahuel', 1, false);
        animation.addByPrefix('stalin', 'stalin', 1, false);
        animation.addByPrefix('zloy_negr', 'zloy_negr', 1, false);

        scale.set(size, size);

        animation.play(name);
    }
}