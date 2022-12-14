package;

import flixel.FlxG;

class LanguageHandler 
{
    // MAIN MENU
    public static var mainMenuOptions:Array<String>;
    public static var mainMenuPlay:Array<String>;
    public static var mainMenuCredits:Array<String>;
    public static var mainMenuEditor:Array<String>;
    public static var mainMenuVersion:Array<String>;
    public static var mainMenuSocials:Array<String>;
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

    public static function loadData()
    {
        // Main menu localization
        mainMenuOptions = ['Options', 'Настройки'];
        mainMenuPlay = ['Play', 'Играть'];
        mainMenuCredits = ['Credits', 'Кредиты'];
        mainMenuEditor = ['Shorohov Editor', 'Редактор шорохова'];
        mainMenuVersion = ['Version: ', 'Версия: '];
        mainMenuSocials = ['Our socials', 'Наши соц. сети'];
        // Options localization
        optionsFpsCap = ['Max FPS', 'Максимальный FPS'];
        optionsLanguage = ['Language', 'Язык'];
        optionsRussian = ['Russian', 'Русский'];
        optionsEnglish = ['English', 'Английский'];
        // Credits localization
        creditsOldFlag = ['Main programmer and\n host of game (and a little bit an actor)', 'Главный програмист и\n создатель игры (ну и немного рисовач)'];
        creditsListan = ['Secondary actor of game', 'Рисовач игры'];
        creditsMaxpool = ['Main actor and designer of game', 'Главный рисовач и дизайнер игры'];
        creditsEgor = ['Face of game', 'Лицо игры'];
        // Playstate localization
        playstateCoins = ['Coins: ', 'Монеты: '];
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
    }
}