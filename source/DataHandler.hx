package;

import flixel.FlxG;

class DataHandler 
{
    // MAIN MENU
    public static var mainMenuOptions:Array<String>;
    public static var mainMenuStoryPlay:Array<String>;
    public static var mainMenuPlay:Array<String>;
    public static var mainMenuCredits:Array<String>;
    public static var mainMenuEditor:Array<String>;
    public static var mainMenuVersion:Array<String>;
    public static var mainMenuSocials:Array<String>;
    public static var mainMenuStore:Array<String>;
    // OPTIONS MENU
    public static var optionsFpsCap:Array<String>;
    public static var optionsLanguage:Array<String>;
    public static var optionsRussian:Array<String>;
    public static var optionsEnglish:Array<String>;
    // CREDITS
    public static var creditsOldFlag:Array<String>;
    public static var creditsListan:Array<String>;
    public static var creditsMaxpool:Array<String>;
    public static var creditsEgor:Array<String>;
    public static var creditsEvan:Array<String>;
    public static var creditsFox:Array<String>;
    // PLAYSTATE
    public static var playstateCoins:Array<String>;
    public static var playstateHealthLeft:Array<String>;
    // TITLESTATE
    public static var titlestatePart1:Array<String>;
    public static var titlestatePart2:Array<String>;
    public static var titlestatePart3:Array<String>;
    // SOCIALS
    public static var socialsGitHubName:Array<String>;
    public static var socialsGitHubDesc:Array<String>;
    public static var socialsVKName:Array<String>;
    public static var socialsVKDesc:Array<String>;
    // STORE MENU
    public static var storeItems:Array<String>;
    public static var storeLvl:Array<String>;
    public static var storeInfo:Array<String>;
    public static var storeCost:Array<String>;
    public static var storeDamage:Array<String>;
    public static var storeCoins:Array<String>;
    public static var storeDamageName:Array<String>;
    public static var storeCoinsName:Array<String>;
    public static var storeDamageDesc:Array<String>;
    public static var storeCoinsDesc:Array<String>;
    public static var storePercent:Array<String>;
    public static var storeNEC:Array<String>;
    // DISCORD
    public static var discordGame:Array<String>;
    public static var discordMenu:Array<String>;
    public static var discordOptions:Array<String>;
    public static var discordSocials:Array<String>;
    public static var discordCredits:Array<String>;
    public static var discordTitle:Array<String>;
    public static var discordStore:Array<String>;
    public static var discordPlayStatePart1:Array<String>;
    public static var discordPlayStatePart2:Array<String>;
    // SONGS
    public static var storyMenuSongs:Array<Dynamic>;

    public static function loadTranslate()
    {
        // Main menu localization
        mainMenuOptions = ['Options', 'Настройки'];
        mainMenuStoryPlay = ['Story play', 'Игра по сюжету'];
        mainMenuPlay = ['Non-story play', 'Игра без сюжета'];
        mainMenuCredits = ['Credits', 'Кредиты'];
        mainMenuEditor = ['Shorohov Editor', 'Редактор шорохова'];
        mainMenuVersion = ['Version: ', 'Версия: '];
        mainMenuSocials = ['Our socials', 'Наши соц. сети'];
        mainMenuStore = ['Store', 'Магазин'];
        // Options localization
        optionsFpsCap = ['Max FPS', 'Максимальный FPS'];
        optionsLanguage = ['Language', 'Язык'];
        optionsRussian = ['Russian', 'Русский'];
        optionsEnglish = ['English', 'Английский'];
        // Credits localization
        creditsOldFlag = ['Main programmer and host of game (and a little bit an actor)', 'Главный програмист и создатель игры (ну и немного рисовач)'];
        creditsListan = ['Secondary actor of game', 'Рисовач игры'];
        creditsMaxpool = ['Main actor and designer of game', 'Главный рисовач и дизайнер игры'];
        creditsEgor = ['Face of game', 'Лицо игры'];
        creditsEvan = ['Another actor of game', 'Ещё один рисовач игры'];
        creditsFox = ['Idea with brawlers-helpers', 'Идея с бойцами-помошниками'];
        // Playstate localization
        playstateCoins = ['Credits: ', 'Кредиты: '];
        playstateHealthLeft = ["Shorohov's health: ", 'Здоровье Шорохова: '];
        // Titlestate localization
        titlestatePart1 = ['7GC Team presents', 'Команда 7GC представляет'];
        titlestatePart2 = ['SHOROHOV GAME', 'ИГРА ПРО ШОРОХОВА'];
        titlestatePart3 = ['PRESS ANY KEY TO PLAY', 'НАЖМИТЕ НА ЛЮБУЮ КЛАВИШУ ЧТОБЫ ИГРАТЬ'];
        // Socials localization
        socialsGitHubName = ['GitHub', 'ГитХаб'];
        socialsGitHubDesc = ['Source code of game', 'Открытый код игры'];
        socialsVKName = ['VK', 'ВК'];
        socialsVKDesc = ['Our group in VK', 'Наша група в ВК'];
        // Store localization
        storeItems = ['ITEMS', 'ПРЕДМЕТЫ'];
        storeLvl = ['Lvl.', 'Уровень'];
        storeInfo = ['INFO', 'ИНФО'];
        storeCost = ['Cost: ', 'Цена: '];
        storeDamage = ['Damage by click: ', 'Урон за клик: '];
        storeCoins = ['Coins rate is ', 'Умножение монет \nна '];
        storeDamageDesc = ['The higher the level, the higher the damage, i.e. if the level is 5, then the damage will be 5', 'Чем выше уровень, тем выше урон, т.е. если уровень ровняется 5, то урон будет 5'];
        storeCoinsDesc = ['The higher the level, the more coins you get for one hit on Shorohov', 'Чем выше уровень, тем больше монет вы получаете за один удар по Шорохову'];
        storeDamageName = ['Damage boost', 'Буст урона'];
        storeCoinsName = ['Coins boost', 'Буст монет'];
        storePercent = ['Percent: ', 'Процент: '];
        storeNEC = ['You have no enought credits!', 'У тебя не достаточно кредитов!'];
        // Discord localization
        discordGame = ['Shorohov game', 'Игра про шорохова'];
        discordOptions = ['Browsing options menu', 'В меню настроек'];
        discordMenu = ['Browsing menu', 'В главном меню'];
        discordSocials = ['Watching socials', 'Просматривает соц. сети'];
        discordTitle = ['Looking title', 'Смотрет на титульное меню'];
        discordStore = ['Browsing store', 'В магазине'];
        discordCredits = ['Watching credits', 'Просматривает кридиты'];
        discordPlayStatePart1 = ['Играет в', 'Playing'];
        discordPlayStatePart2 = ['Здоровье', 'Health'];
        // SONGS
        storyMenuSongs = 
        [
            ['Shorohov original', 'Огригинальный шорохов'],
            ['Shorohov naruto', 'Шорохов наруто'],
            ['Tokyo shorohov', 'Токийский шорохов'],
            ['Mexico shorohov', 'Шорохов мексиканец'],
            ['Trendy shorohov', 'Модный шорохов'],
            ['Angry shorohov', 'Злой шорохов'],
            ['Shorohov rock', 'Скала шорохов'],
            ['Xmas shorohov', 'НГ шорохов'],
            ['King shorohov', 'Король шорохов'],
            ['Hell shorohov', 'Адский шорохов'],
            ['Jedi shorohov', 'Шорохов джедай'],
            ['Cop shorohov', 'Шорохов коп'],
            ['Old shorohov', 'Старый шорохов'],
            ['Strong shorohov', 'Силач шорохов'],
            ['Killer shorohov', 'Шорохов убийца'],
            ['Anime shorohov', 'Аниме шорохов']
        ];
    }

    public static function GetZoom()
    {
        var sizes:Array<Float> = [];
	    var size:Float;

        sizes.push(FlxG.width / 1280);
		sizes.push(FlxG.height / 720);
		size = Math.max(sizes[0], sizes[1]);

        return(size);
    }
}