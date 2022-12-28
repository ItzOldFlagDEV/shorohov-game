package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import haxe.Json;
import flixel.ui.FlxButton;
import openfl.events.IOErrorEvent;
import openfl.events.Event;
import openfl.net.FileReference;
import flixel.FlxState;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.FlxG;
import lime.utils.Assets;

using StringTools;

class EditorState extends State
{
	var UI_box:FlxUITabMenu;

	var shorohov:ShorohovPlayer;

	var curAnim:String;

	var animsDropDown:FlxUIDropDownMenu;

	var box:FlxSprite;

	var shorohSet:String;

	var xScale:Int;
	var yScale:Int;

	var yScaleStpr:FlxUINumericStepper;
	var xScaleStpr:FlxUINumericStepper;

	override public function create()
	{
		var bg:FlxSprite = new FlxSprite(0, 0, Paths.images('editorBG'));
		bg.screenCenter();
		add(bg);

		shorohov = new ShorohovPlayer(100, 100, 'default');
		add(shorohov);

		box = new FlxSprite(FlxG.width - 320, 20).makeGraphic(300, 400, FlxColor.GRAY);
		add(box);

		var characters:Array<String> = TxtArray('assets/data/shorohovsList.txt');

		var shorohovSetup = new FlxUIDropDownMenu(box.x + 10, box.y + 60, FlxUIDropDownMenu.makeStrIdLabelArray(characters, true), function(character:String)
		{
			shorohSet = characters[Std.parseInt(character)];
			changeShoroh();
		});
		shorohovSetup.selectedLabel = 'default';

		var saveButton:FlxButton = new FlxButton(box.x + 10, box.y + 340, "Save", function()
		{
			saveLevel();
		});

		animsDropDown = new FlxUIDropDownMenu(box.x + 10, box.y + 36, FlxUIDropDownMenu.makeStrIdLabelArray(ShorohovPlayer.animsArray, true),
			function(anims:String)
			{
				curAnim = ShorohovPlayer.animsArray[Std.parseInt(anims)];
				changeAnimShoroh();
			});
		animsDropDown.selectedLabel = curAnim;

		var curAnimLabel = new FlxText(shorohovSetup.x + shorohovSetup.width + 3, box.y + 37, 0, 'Select the animation to play');
		var shorohSelectLabel = new FlxText(animsDropDown.x + animsDropDown.width + 3, box.y + 61, 0, 'Select type of shorohov');

		xScaleStpr = new FlxUINumericStepper(box.x + 10, box.y + 85, 1, ShorohovPlayer.scaleX, 0, 999, 0);
		xScaleStpr.value = ShorohovPlayer.scaleX;

		var xPosLabel = new FlxText(xScaleStpr.x + xScaleStpr.width + 5, xScaleStpr.y + 1, 'X scale');

		yScaleStpr = new FlxUINumericStepper(box.x + 10, box.y + 105, 1, ShorohovPlayer.scaleY, 0, 999, 0);
		yScaleStpr.value = ShorohovPlayer.scaleY;

		var yPosLabel = new FlxText(yScaleStpr.x + yScaleStpr.width + 5, yScaleStpr.y + 1, 'Y scale');

		add(xScaleStpr);
		add(xPosLabel);
		add(yScaleStpr);
		add(yPosLabel);
		add(shorohovSetup);
		add(shorohSelectLabel);
		add(animsDropDown);
		add(curAnimLabel);
		add(saveButton);

		super.create();
	}

	public static function TxtArray(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		yScale = Std.int(yScaleStpr.value);
		xScale = Std.int(xScaleStpr.value);

		shorohov.scale.set(xScale * 0.5, yScale * 0.5);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}

	function changeShoroh()
	{
		remove(shorohov);
		shorohov = new ShorohovPlayer(100, 100, shorohSet);
		add(shorohov);
		shorohov.animation.play(ShorohovPlayer.animsArray[0]);

		remove(animsDropDown);
		animsDropDown = new FlxUIDropDownMenu(box.x + 10, box.y + 36, FlxUIDropDownMenu.makeStrIdLabelArray(ShorohovPlayer.animsArray, true),
			function(anims:String)
			{
				curAnim = ShorohovPlayer.animsArray[Std.parseInt(anims)];
				changeAnimShoroh();
			});
		animsDropDown.selectedLabel = ShorohovPlayer.animsArray[0];
		add(animsDropDown);
	}

	function changeAnimShoroh()
	{
		shorohov.animation.play(curAnim);
	}

	var _file:FileReference;

	function onSaveComplete(_):Void
	{
		_file.removeEventListener(Event.COMPLETE, onSaveComplete);
		_file.removeEventListener(Event.CANCEL, onSaveCancel);
		_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
		_file = null;
		FlxG.log.notice("Successfully saved file.");
	}

	/**
	 * Called when the save file dialog is cancelled.
	 */
	function onSaveCancel(_):Void
	{
		_file.removeEventListener(Event.COMPLETE, onSaveComplete);
		_file.removeEventListener(Event.CANCEL, onSaveCancel);
		_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
		_file = null;
	}

	/**
	 * Called if there is an error while saving the gameplay recording.
	 */
	function onSaveError(_):Void
	{
		_file.removeEventListener(Event.COMPLETE, onSaveComplete);
		_file.removeEventListener(Event.CANCEL, onSaveCancel);
		_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
		_file = null;
		FlxG.log.error("Problem saving file");
	}

	function saveLevel()
	{
		var json = {
			"image": shorohSet,
			"animsArray": ShorohovPlayer.animsArray,
			"width": 300,
			"height": 300,
			"scaleX": xScale,
			"scaleY": yScale
		};

		var data:String = Json.stringify(json, "\t");

		if (data.length > 0)
		{
			_file = new FileReference();
			_file.addEventListener(Event.COMPLETE, onSaveComplete);
			_file.addEventListener(Event.CANCEL, onSaveCancel);
			_file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
			_file.save(data, shorohSet + ".json");
		}
	}
}
