package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class PrePlayState extends FlxState
{
    var selectStart:String = '>  ';
    var selectEnd:String = '  <';

    public static var levelsArray:Array<String> = ['School 59', 'Naruto', 'Tokyo shorohov'];
    var curSelected:Int = 0;

    var levelsTxt:FlxText;

    #if mobile
    var size:Int = 72;

    var backButton:FlxText;
    var upButton:FlxText;
    var downButton:FlxText;
    var acceptButton:FlxText;
    #end

    public function new()
    {
        super();

        levelsTxt = new FlxText(0, 0, 0, "", 32);
        levelsTxt.alignment = CENTER;
        add(levelsTxt);

        for (i in 0...levelsArray.length)
        {
            if (curSelected == i){
                levelsTxt.text += selectStart + '${levelsArray[i]}' + selectEnd;
            }
            else{
                levelsTxt.text += '${levelsArray[i]}';
            }

            levelsTxt.text += '\n';
        }

        levelsTxt.screenCenter();

        #if mobile
        // Mobile
        backButton = new FlxText(0, 0, 0, 'BACK', size);
        add(backButton);
        upButton = new FlxText(0, 0, 0, 'UP', size);
        add(upButton);
        downButton = new FlxText(0, 0, 0, 'DOWN', size);
        add(downButton);
        acceptButton = new FlxText(0, 0, 0, 'ACCEPT', size);
        add(acceptButton);

        // BACK BUTTON POSITION
        backButton.x = FlxG.width - backButton.width + 5;
        backButton.y = acceptButton.y;

        // ACCEPT BUTTON POSITION
        acceptButton.x = FlxG.width - acceptButton.width + 5;
        acceptButton.y = FlxG.height - acceptButton.height + 5;

        // UP BUTTON POSITION
        upButton.x = 5;
        upButton.y = downButton.y;

        // DOWN BUTTON POSITION
        downButton.x = 5;
        downButton.y = FlxG.height - downButton.height + 5;
        #end
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.W #if mobile || FlxG.mouse.overlaps(upButton) && FlxG.mouse.justPressed #end)
        {
            levelsTxt.text = '';
            curSelected--;

            if (curSelected < 0)
                curSelected = levelsArray.length - 1;

            for (i in 0...levelsArray.length)
            {
                if (curSelected == i){
                    levelsTxt.text += selectStart + '${levelsArray[i]}' + selectEnd;
                }
                else{
                    levelsTxt.text += '${levelsArray[i]}';
                }
                levelsTxt.text += '\n';
            }

            levelsTxt.screenCenter();
            trace(curSelected);
        }
        if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
        {   
            levelsTxt.text = '';
            curSelected++;

            if (curSelected > levelsArray.length - 1)
                curSelected = 0;

            for (i in 0...levelsArray.length)
            {
                if (curSelected == i){
                    levelsTxt.text += selectStart + '${levelsArray[i]}' + selectEnd;
                }
                else{
                    levelsTxt.text += '${levelsArray[i]}';
                }
                levelsTxt.text += '\n';
            }

            levelsTxt.screenCenter();
            trace(curSelected);
        }

        if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
        {
            for (i in 0...levelsArray.length)
            {
                FlxG.switchState(new PlayState(levelsArray[curSelected]));
            }
        }

        if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
		{
			FlxG.switchState(new MainMenuState());
		}
    }
}