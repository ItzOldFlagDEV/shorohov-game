package;

import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import DataHandler.GetZoom;

class StoreState extends State
{
    public static var ls:Int;

    var selectStart:String = '>  ';
    var selectEnd:String = '  <';

    var store_tamplate:FlxSprite;
    var first_box:FlxSprite;
    var second_box:FlxSprite;
    var third_box:FlxSprite;
    var fourth_box:FlxSprite;

    public static var forceVisible:Bool = false;
    var nameText:FlxText;
    var infoText:FlxText;
    var listText:FlxText;
    var aboutText:FlxText;
    var coinsText:FlxText;
    var necText:FlxText;

    public static var itemsList:Array<String> = [];
    public static var startCosts:Array<Int> = [300, 700];
    public static var infoList:Array<String>;

    var curSelected:Int = 0;

    var bullshitX:Float;
    var bullshitY:Float;

    #if mobile
	var size:Int = 72;

	var backButton:FlxText;
	var upButton:FlxText;
	var downButton:FlxText;
	var acceptButton:FlxText;
	#end

    override public function create()
    {
        ls = FlxG.save.data.language;
        itemsList = [DataHandler.storeDamageName[ls], DataHandler.storeCoinsName[ls]];

        bullshitX = FlxG.width / 1280;
        bullshitY = FlxG.height / 720;

        var bg:RandomBGSprite = new RandomBGSprite(true);
        bg.screenCenter();
        add(bg);

        store_tamplate = new FlxSprite().loadGraphic(Paths.storeImages('img_store'));
        store_tamplate.screenCenter();
        store_tamplate.scale.set(0.85 * bullshitX, 0.85 * bullshitY);
        store_tamplate.color = 0x303030;
        add(store_tamplate);

        first_box = new FlxSprite().makeGraphic(Std.int(765 * bullshitX), Std.int(92 * bullshitY), FlxColor.RED);
        first_box.scale.set(store_tamplate.scale.x, store_tamplate.scale.y);
        first_box.visible = forceVisible;
        first_box.setPosition(49 * bullshitX, 58 * bullshitY);
        add(first_box);

        second_box = new FlxSprite().makeGraphic(Std.int(478 * bullshitX), Std.int(92 * bullshitY), FlxColor.GREEN);
        second_box.scale.set(store_tamplate.scale.x, store_tamplate.scale.y);
        second_box.visible = forceVisible;
        second_box.setPosition(726 * bullshitX, 58 * bullshitY);
        add(second_box);

        third_box = new FlxSprite().makeGraphic(Std.int(765 * bullshitX), Std.int(595 * bullshitY), FlxColor.BLUE);
        third_box.scale.set(store_tamplate.scale.x, store_tamplate.scale.y);
        third_box.visible = forceVisible;
        third_box.setPosition(49 * bullshitX, first_box.y + ((first_box.height / 2)));
        add(third_box);

        fourth_box = new FlxSprite().makeGraphic(Std.int(478 * bullshitX), Std.int(595 * bullshitY), FlxColor.PINK);
        fourth_box.scale.set(store_tamplate.scale.x, store_tamplate.scale.y);
        fourth_box.visible = forceVisible;
        fourth_box.setPosition(726 * bullshitX, second_box.y + ((second_box.height / 2)));
        add(fourth_box);

        nameText = new FlxText(0, 0, 0, DataHandler.storeItems[ls], Std.int(64 * GetZoom()));
        nameText.alignment = CENTER;
        nameText.font = Paths.fontTTF('font1');
        nameText.borderQuality = 1;
        nameText.borderSize = 2;
        nameText.borderStyle = OUTLINE;
        nameText.borderColor = FlxColor.BLACK;
        add(nameText);

        infoText = new FlxText(0, 0, 0, DataHandler.storeInfo[ls], Std.int(64 * GetZoom()));
        infoText.alignment = CENTER;
        infoText.font = Paths.fontTTF('font1');
        infoText.borderQuality = 1;
        infoText.borderSize = 2;
        infoText.borderStyle = OUTLINE;
        infoText.borderColor = FlxColor.BLACK;
        add(infoText);

        listText = new FlxText(0, 0, third_box.width - 42, '', Std.int(32 * GetZoom()));
        listText.alignment = CENTER;
        listText.font = Paths.fontTTF('font1');
        listText.borderQuality = 1;
        listText.borderSize = 1;
        listText.borderStyle = OUTLINE;
        listText.borderColor = FlxColor.BLACK;
        add(listText);

        aboutText = new FlxText(0, 0, fourth_box.width - 42, '', Std.int(32 * GetZoom()));
        aboutText.alignment = CENTER;
        aboutText.font = Paths.fontTTF('font1');
        aboutText.borderQuality = 1;
        aboutText.borderSize = 1;
        aboutText.borderStyle = OUTLINE;
        aboutText.borderColor = FlxColor.BLACK;
        add(aboutText);

        coinsText = new FlxText(0, 0, 0, '', Std.int(24 * GetZoom()));
        coinsText.alignment = LEFT;
        coinsText.font = Paths.fontTTF('font1');
        coinsText.borderQuality = 1;
        coinsText.borderSize = 1;
        coinsText.borderStyle = OUTLINE;
        coinsText.borderColor = FlxColor.BLACK;
        coinsText.x = 15;
        coinsText.y = 15;
        add(coinsText);

        necText = new FlxText(0, 0, 0, DataHandler.storeNEC[ls], Std.int(64 * GetZoom()));
        necText.alignment = LEFT;
        necText.font = Paths.fontTTF('font1');
        necText.borderQuality = 1;
        necText.borderSize = 2;
        necText.borderStyle = OUTLINE;
        necText.borderColor = FlxColor.BLACK;
        necText.screenCenter();
        necText.alpha = 0;
        add(necText);

        updateInfo();
        correctPosition();
        updateText();

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

        super.create();
    }

    function updateText()
    {
        listText.text = '';

        for (i in 0...itemsList.length)
        {
            if (curSelected == i){
                listText.text += selectStart + '${itemsList[i]}: ${DataHandler.storeLvl[ls]} ${getSavedData(i)}' + selectEnd;
            }
            else{
                listText.text += '${itemsList[i]}: ${DataHandler.storeLvl[ls]} ${getSavedData(i)}';
            }

            listText.text += '\n';
        }

        updateInfo();
        aboutText.text = infoList[curSelected];
        correctPosition();
    }

    function correctPosition()
    {
        nameText.x = (first_box.x + first_box.width / 2) - (nameText.width / 2);
        nameText.y = (first_box.y + first_box.height / 2) - (nameText.height / 2);

        infoText.x = (second_box.x + second_box.width / 2) - (infoText.width / 2);
        infoText.y = (second_box.y + second_box.height / 2) - (infoText.height / 2);

        listText.x = (third_box.x + third_box.width / 2) - (listText.width / 2);
        listText.y = (third_box.y + third_box.height / 2) - (listText.height / 2);

        aboutText.x = (fourth_box.x + fourth_box.width / 2) - (aboutText.width / 2);
        aboutText.y = (fourth_box.y + fourth_box.height / 2) - (aboutText.height / 2);
    }

    function costGenerate(i:Int)
    {
        var a:Int = getSavedData(i);
        var b:Int = startCosts[i];
        var c:Int;

        var c = Std.int(b * FlxMath.roundDecimal((1.75 * a), 0));
        return(c);
    }

    function getSavedData(i:Int)
    {
        var a:Int = 0;

        if (i == 0)
            a = FlxG.save.data.damageBoosterLvl;
        else if (i == 1)
            a = FlxG.save.data.coinsBoosterLvl;

        return(a);
    } 

    function updateInfo()
    {
        infoList = [
            '${DataHandler.storeDamageDesc[ls]}\n\n${DataHandler.storeCost[ls] + costGenerate(curSelected)}\n\n${DataHandler.storeDamage[ls]} ${1 * FlxG.save.data.damageBoosterLvl}\n',
            '${DataHandler.storeCoinsDesc[ls]}\n\n${DataHandler.storeCost[ls] + costGenerate(curSelected)}\n\n${DataHandler.storeCoins[ls]} ${FlxG.save.data.coinsBoosterLvl}\n'
        ];
    }

    override public function update(elapsed:Float)
    {
        coinsText.text = DataHandler.playstateCoins[ls] + FlxG.save.data.coin;

        if (FlxG.keys.justPressed.ESCAPE #if mobile || FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed #end)
        {
            FlxG.switchState(new MainMenuState());
        }

        if (FlxG.keys.justPressed.W #if mobile || FlxG.mouse.overlaps(upButton) && FlxG.mouse.justPressed #end)
        {
            curSelected--;

            if (curSelected < 0)
                curSelected = itemsList.length - 1;

            updateText();
        }

        if (FlxG.keys.justPressed.S #if mobile || FlxG.mouse.overlaps(downButton) && FlxG.mouse.justPressed #end)
        {   
            curSelected++;

            if (curSelected > itemsList.length - 1)
                curSelected = 0;

            updateText();
        }

        if (FlxG.keys.justPressed.ENTER #if mobile || FlxG.mouse.overlaps(acceptButton) && FlxG.mouse.justPressed #end)
        {
            if (FlxG.save.data.coin >= costGenerate(curSelected))
            {
                FlxG.save.data.coin -= costGenerate(curSelected);
                switch (curSelected)
                {
                    case 0:
                        FlxG.save.data.damageBoosterLvl += 1;
                    case 1:
                        FlxG.save.data.coinsBoosterLvl += 1;
                }
    
                updateText();
    
                FlxG.save.flush();
            }
            else
            {
                necText.alpha = 1;

                new FlxTimer().start(0.7, function(tmr:FlxTimer) 
                {
                    necText.alpha = 0;
                });
            }
        }

        super.update(elapsed);
    }
}