-- Localization for ruRU
local Locale = GetLocale()

if (Locale ~= "ruRU") then
	return
end

local PerformanceSlight = "\n|cffFF0000Отключение этого может немного повысить производительность|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Включите эту опцию для ручного ввода количества панелей|r"

-- Actionbar
L_GUI_ACTIONBAR_BOTTOMBARS = "Количество панелей внизу (1, 2 или 3)"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Размер кнопок"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Отступ кнопок"
L_GUI_ACTIONBAR_ENABLE = "Включить панели команд"
L_GUI_ACTIONBAR_EQUIP_BORDER = "Окрашивать зеленым границы надетого предмета"
L_GUI_ACTIONBAR_GRID = "Показывать пустые кнопки на панелях"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "Скрыть блики проков"
L_GUI_ACTIONBAR_HOTKEY = "Показывать горячие клавиши на кнопках"
L_GUI_ACTIONBAR_MACRO = "Показывать названия макросов на кнопках"
L_GUI_ACTIONBAR_OUT_OF_MANA = "Цвет заканчивающейся маны"
L_GUI_ACTIONBAR_OUT_OF_RANGE = "Цвет вне радиуса действий"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Скрыть панель петомца"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Включить горизонтальную панель петомца"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Панель петомца по наведению мыши (только для горизонтальной панели)"
L_GUI_ACTIONBAR_RIGHTBARS = "Количество панелей справа (0, 1, 2 или 3)"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Правые панели по наведению мыши"
L_GUI_ACTIONBAR_SELFCAST = "Всегда применять каст на себя правой кнопкой мыши (независимо от выбранной цели)"
L_GUI_ACTIONBAR_SPLIT_BARS = "Разделить пятую панель на две панели по 6 кнопок"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Скрыть панель стоек"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Включить горизонтальную панель стоек"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Панель стоек по наведению мыши"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Включить режим переключения"..ToggleOffReminder
-- Announcements
L_GUI_ANNOUNCEMENTS = "Оповещения"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Проверять наличие плохой экипировки в подземельях"
L_GUI_ANNOUNCEMENTS_INTERRUPT = "Анонсировать в группу/рейд ваши прерывания заклинаний"
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Активировать функцию обратного отсчета на запуск босса (/рс)"
L_GUI_ANNOUNCEMENTS_SAY_SAPPED = "Мнгновенно оповещать об ошеломлении, когда |cFFFFF569Разбойник|r напал на вас"
L_GUI_ANNOUNCEMENTS_SPELLS = "Анонсировать в группу/рейд применение некоторых важных умений"
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Проверять умения всех членов группы/рейда"
-- Automation
L_GUI_AUTOMATION = "Автоматизация"
L_GUI_AUTOMATION_ACCEPTINVITE = "Автоматически принимать приглашения от друзей и гильдии"
L_GUI_AUTOMATION_AUTOCOLLAPSE = "Автоматически сворачивать список заданий в подземельях"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Автоматически сворачивать список заданий после перезагрузки интерфейса"
L_GUI_AUTOMATION_DECLINEDUEL = "Автоматически отклонять все дуэли"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Автоматически сохранять лог боя в текстовый файл в рейде"
L_GUI_AUTOMATION_RESURRECTION = "Автоматическое покидание тела на полях боя"
L_GUI_AUTOMATION_SCREENSHOT = "Автоматически делать скриншот при получении достижений"
L_GUI_AUTOMATION_TAB_BINDER = "Автоматически выбирать только вражеских игроков клавишей TAB"
-- Bag
L_GUI_BAGS = "Сумки"
L_GUI_BAGS_BAG_FILTER = "Автоматически удалять ненужные предметы из ваших сумок во время сбора добычи"
L_GUI_BAGS_BUTTON_SIZE = "Размер слотов"
L_GUI_BAGS_ENABLE = "Включить сумки"
L_GUI_BAGS_ITEMS_PER_ROW = "Установить количество слотов в ряду"
L_GUI_BAGS_PULSE_NEW_ITEMS = "Подсвечивать новые предметы"
L_GUI_BAGS_SPACING = "Отступ слотов"
-- Blizzard
L_GUI_BLIZZARD = "Blizzard"
L_GUI_BLIZZARD_CLASS_COLOR = "Окрасить имена игроков в списке друзей"
L_GUI_BLIZZARD_COLOR_TEXTURES = "Изменить оттенок цвета большинства элементов UI."
L_GUI_BLIZZARD_EASYDELETE = "Удалять |CFF0080ffРедкие|r и|CFFb048f8Превосходные|r предметы без необходимости ввода 'УДАЛИТЬ'"
L_GUI_BLIZZARD_REPLACE_BLIZZARD_FONTS = "Заменить стандартный шрифт |cff00B4FFBlizzard|r на различных элементах |cff3c9bedKkthnxUI|r."
L_GUI_BLIZZARD_REPUTATIONGAIN = "Показывать сообщения о полученной репутации"
L_GUI_BLIZZARD_TEXTURES_COLOR = "Оттенок цвета текстур UI (по умолчанию цвет класса)"
L_GUI_BLIZZARD_VEHICLE_MOUSEOVER = "Фрейм транспорта оп наведению мыши"
-- Plugins
L_GUI_DATABARS = "Панель Данных"
L_GUI_DATABARS_ARTIFACT_COLOR = "Цвет полосы артифакта"
L_GUI_DATABARS_ARTIFACT_ENABLE = "Включить полосу артифакта"
L_GUI_DATABARS_ARTIFACT_FADE = "Скрытие полосы артефакта"
L_GUI_DATABARS_ARTIFACT_HEIGHT = "Высота полосы артефакта"
L_GUI_DATABARS_ARTIFACT_WIDTH = "Ширина полосы артефакта"
L_GUI_DATABARS_EXPERIENCE_COLOR = "Цвет полосы опыта"
L_GUI_DATABARS_EXPERIENCE_ENABLE = "Включить полосу опыта"
L_GUI_DATABARS_EXPERIENCE_FADE = "Скрытие полосы опыта"
L_GUI_DATABARS_EXPERIENCE_HEIGHT = "Высота полосы опыта"
L_GUI_DATABARS_EXPERIENCE_REST_COLOR = "Цвет отдыха полосы опыта"
L_GUI_DATABARS_EXPERIENCE_WIDTH = "Ширина полосы опыта"
L_GUI_DATABARS_HONOR_COLOR = "Цвет полосы чести"
L_GUI_DATABARS_HONOR_ENABLE = "Активировать полосу чести"
L_GUI_DATABARS_HONOR_FADE = "Скрытие полосы чести"
L_GUI_DATABARS_HONOR_HEIGHT = "Высота полосы чести"
L_GUI_DATABARS_HONOR_WIDTH = "Ширина высоты чести"
L_GUI_DATABARS_REPUTATION_ENABLE = "Включить полосу репутации"
L_GUI_DATABARS_REPUTATION_FADE = "Скрытие полосы репутации"
L_GUI_DATABARS_REPUTATION_HEIGHT = "Высота полосы репутации"
L_GUI_DATABARS_REPUTATION_WIDTH = "Ширина полосы репутации"
-- Auras
L_GUI_AURAS = "Ауры"
L_GUI_AURAS_ANIMATION = "Анимировать появление аур"..PerformanceSlight
L_GUI_AURAS_BUFFS_PERROW = "Установить количество баффов в ряду"
L_GUI_AURAS_CASTBY = "Показывать, кто наложил ауру в подсказке"
L_GUI_AURAS_CONSOLIDATE = "Объединять ауры"
L_GUI_AURAS_ENABLE = "Включить ауры"
L_GUI_AURAS_FLASH = "Подсвечивать ауры когда их эффект заканчивается"..PerformanceSlight
L_GUI_AURAS_HIDE_BUFFS = "Отключить показ баффов"
L_GUI_AURAS_HIDE_DEBUFFS = "Отключить показ дебаффов"
-- GUI Buttons
L_GUI_BUTTON_RESET = "Общий сброс UI"
-- Chat
L_GUI_CHAT_FADING = "Включить затухание чата"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Объединять спам аддонов учета урона в одну строку-ссылку"
L_GUI_CHAT_ENABLE = "Включить чат"
L_GUI_CHAT_GOLD = "Удалять некоторый спам игроков в чате"
L_GUI_CHAT_HEIGHT = "Высота чата"
L_GUI_CHAT_LINKBRACKETS = "Показывать URL ссылки в скобках"
L_GUI_CHAT_LINKCOLOR = "Установить цвет для отображения URL ссылки"
L_GUI_CHAT_OUTLINE = "Применить OUTLINE стиль, к шрифту чата"
L_GUI_CHAT_SCROLLBYX = "Установить количество строк, которые чат будет пролистывать при скролле"
L_GUI_CHAT_SPAM = "Удалить спам некоторых системных сообщений ('Игрок1' побеждает в поединке 'Игрок2')"
L_GUI_CHAT_TABS_MOUSEOVER = "Показывать панель вкладок чата при наведении мыши"
L_GUI_CHAT_TABS_OUTLINE = "Применить OUTLINE стиль к панели вкладок чата"
L_GUI_CHAT_WHISP = "Проигрывать звук при получении личного сообщения"
L_GUI_CHAT_WIDTH = "Ширина чата"
-- DataText
L_GUI_DATATEXT = "Текст Данных"
L_GUI_DATATEXT_BATTLEGROUND = "Включить отображение текста поля боя"
L_GUI_DATATEXT_LOCALTIME = "Использовать локальное время в текстах данных"
L_GUI_DATATEXT_LOCATION = "Включить название локации вверху миникарты"
L_GUI_DATATEXT_SYSTEM = "Включить отображение ФПС и МС под миникартой"
L_GUI_DATATEXT_TIME = "Включить отображение часов внизу миникарты"
L_GUI_DATATEXT_TIME24HR = "Установить 24-х часовой формат времени"
L_GUI_DATATEXT_BOTTOMBAR = "Enable DataTextBar under your Actionbars"
-- Cooldown
L_GUI_COOLDOWN = "Перезарядка"
L_GUI_COOLDOWN_ENABLE = "Включить модуль перезарядки"
L_GUI_COOLDOWN_FONT_SIZE = "Размер шрифта перезарядки"
L_GUI_COOLDOWN_THRESHOLD = "Пороговое время"
-- Filger
L_GUI_FILGER = "Filger"
L_GUI_FILGER_BUFFS_SIZE = "Размер баффов"
L_GUI_FILGER_COOLDOWN_SIZE = "Размер перезарядок"
L_GUI_FILGER_DISABLE_CD = "Отключить перезарядки"
L_GUI_FILGER_ENABLE = "Включить Filger"
L_GUI_FILGER_MAX_TEST_ICON = "Количество иконок в тестовом режиме"
L_GUI_FILGER_PVP_SIZE = "Размер ПВП дебаффов"
L_GUI_FILGER_SHOW_TOOLTIP = "Показывать подсказки"
L_GUI_FILGER_TEST_MODE = "Тестовый режим"
-- General
L_GUI_GENERAL_AUTOSCALE = "Автоматически масштабировать интерфейс"
L_GUI_GENERAL_CHATBUBBLE_FONTSIZE = "Размер шрифта в облочках сообщений"
L_GUI_GENERAL_CHATBUBBLE_NOBACKDROP = "Удалить фон облачков сообщений"
L_GUI_GENERAL_LAG_TOLERANCE = "Автоматически обновлять опцию Blizzard Custom Lag Tolerance для вашей задержки"
L_GUI_GENERAL_SHOW_CONFIG_BUTTON = "Show configbutton on minimap"
L_GUI_GENERAL_TRANSLATE_MESSAGE = "Оповещение о помощи перевода GUI."
L_GUI_GENERAL_UISCALE = "Масштаб интерфейса (если автомасштабирование отключено)"
L_GUI_GENERAL_WELCOME_MESSAGE = "Приветственное сообщение в чате"
L_GUI_GENERAL_QUESTSOUNDS = "Enable/disable QuestSounds."
L_GUI_GENERAL_PATHFINDER = "Show the perfect way in your artifact frame."
-- Loot
L_GUI_LOOT_AUTODE = "Автоматически нажимать РАСПЫЛИТЬ"
L_GUI_LOOT_AUTOGREED = "Автоматически нажимать НУЖНО для зеленых предметов на максимальном уровне"
L_GUI_LOOT_BETTER_LOOTFILTER = "Фильтровать сообщения о добыче в группе и рейде в зависимости от редкости предмета"
L_GUI_LOOT_ENABLE = "Включить окно добычи"
L_GUI_LOOT_ICON_SIZE = "Размер иконок"
L_GUI_LOOT_ROLL_ENABLE = "Включить окно распределения добычи"
L_GUI_LOOT_WIDTH = "Ширина окна добычи"
-- Minimap
L_GUI_MINIMAP = "Миникарта"
L_GUI_MINIMAP_COLLECTBUTTONS = "Сделать минипанель для некоторых кнопок"
L_GUI_MINIMAP_ENABLEMINIMAP = "Включить миникарту и сделать её квадратной"
L_GUI_MINIMAP_FADEBUTTONS = "Fade addon button when collected next to minimap"
L_GUI_MINIMAP_GARRISON = "Показывать иконку Оплота/Гарнизона на миникарте"
L_GUI_MINIMAP_MINIMAPSIZE = "Размер миникарты (по умолчанию 150)"
L_GUI_MINIMAP_PING = "Выводить сообщение о пинге с ником игрока на миникарте. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"
-- Misc
L_GUI_MISC = "Разное"
L_GUI_MISC_ALREADY_KNOWN = "Окрашивать рецепты, транспорт и питомцев, которые уже изучены"
L_GUI_MISC_ARMORY_LINK = "Добавить ссылку на Армори в контекстное меню фреймов персонажей (может привести к ошибкам)"
L_GUI_MISC_AUTOREPAIR = "Автоматически ремонтировать экипировку при посещении торговца"
L_GUI_MISC_AUTOSELLGRAYS = "Автоматически продавать серые предметы"
L_GUI_MISC_COLOR_PICKER = "Улучшенная выборка цветов"
L_GUI_MISC_ENCHANCED_MAIL = "Добавить кнопку 'ВСЕ' в окно почты"
L_GUI_MISC_ERRORS = "Фильтровать сообщения об ошибках интерфейса."
L_GUI_MISC_HIDE_BG_SPAM = "Удалить спам эмоций боссов во время боя"
L_GUI_MISC_INVKEYWORD = "Ключевое слово для автоприглашения (/ainv)"
L_GUI_MISC_ITEMLEVEL = "Показывать уровень предмета надетого на персонажа"
L_GUI_MISC_MOVE_BLIZZARD = "Перемещение некоторых элементов Blizzard"
L_GUI_MISC_SELLMISC = "Автоматически продавать ненужные предметы качеством выше серого"
L_GUI_MISC_SLOT_DURABILITY = "Показывать прочность предмета надетого на персонажа"
L_GUI_MISC_SPIN_CAMERA = "Вращение камеры во время АФК"
L_GUI_MISC_USEGUILDREPAIR = "Автоматический ремонт за счет банка гильдии"
L_GUI_MISC_QUESTLEVEL = "Add questlevel to objectivetracker"
L_GUI_MISC_COMBAT = "Show text for entering and leaving Combat"
-- Nameplates
L_GUI_NAMEPLATES_AD_HEIGHT = "Дополнительная высота для индикатора цели"
L_GUI_NAMEPLATES_AD_WIDTH = "Дополнительная ширина для индикатора цели"
L_GUI_NAMEPLATES_BAD_COLOR = "Цвет плохого состояния угрозы"
L_GUI_NAMEPLATES_CASTBAR = "Показывать полосу заклинаний"
L_GUI_NAMEPLATES_CASTBAR_NAME = "Показывать название применяемого заклинания"
L_GUI_NAMEPLATES_CLASS_ICON = "Иконка класса в ПВП"
L_GUI_NAMEPLATES_COMBAT = "Автоматически показывать индикаторы здоровья в бою"
L_GUI_NAMEPLATES_DEBUFFS_SIZE = "Размер Дебаффов"
L_GUI_NAMEPLATES_ENABLE = "Включить индикаторы здоровья"
L_GUI_NAMEPLATES_GOOD_COLOR = "Цвет хорошего состояния угрозы"
L_GUI_NAMEPLATES_HEALER_ICON = "Показывать иконку лекаря над индикатором на поле боя"
L_GUI_NAMEPLATES_HEALTH = "Цифровое значение здоровья"
L_GUI_NAMEPLATES_HEIGHT = "Высота индикаторов"
L_GUI_NAMEPLATES_NAME_ABBREV = "Сокращать до аббревиатур имена длиннее 18 символов"
L_GUI_NAMEPLATES_NEAR_COLOR = "Цвет при уменьшении/увеличении значения угрозы"
L_GUI_NAMEPLATES_SHOW_DEBUFFS = "Показывать дебаффы (из списка)"
L_GUI_NAMEPLATES_THREAT = "Включить отображение угрозы, в зависимости от вашей роли"
L_GUI_NAMEPLATES_WIDTH = "Ширина индикаторов"
-- PulseCD
L_GUI_PULSECD = "Иконки восстановления"
L_GUI_PULSECD_ENABLE = "Показывать иконки восстановления"
L_GUI_PULSECD_SIZE = "Размер иконки восстановления"
L_GUI_PULSECD_SOUND = "Предупреждать звуковым оповещением"
L_GUI_PULSECD_ANIM_SCALE = "Масштаб анимации"
L_GUI_PULSECD_HOLD_TIME = "Время отображения"
L_GUI_PULSECD_THRESHOLD = "Минимальный порог времени"
-- Static Popups
L_GUI_PER_CHAR = "Вы уверены, что хотите сбросить настройки для этого персонажа?"
L_GUI_RESET_ALL = "Вы уверены, что хотите сбросить все настройки |cFF4488FFKkthnxUI|r?"
L_GUI_RESET_CHAR = "Вы уверены, что хотите сбросить настройки для всех персонажей |cFF4488FFKkthnx's|r|cFFFEB200UI|r?"
L_GUI_SET_SAVED_SETTTINGS = "Настройки для этого персонажа"
-- Skins
L_GUI_SKINS = "Скины Аддонов"
L_GUI_SKINS_CHAT_BUBBLE = "Облачка сообщений Blizzard"
L_GUI_SKINS_CLCR = "Включить скин CLCRet"
L_GUI_SKINS_DBM = "Включить скин DeadlyBossMods"
L_GUI_SKINS_DBM_MOVE = "Разрешить перемещение фреймов DBM"
L_GUI_SKINS_MINIMAP_BUTTONS = "Включить скин Minimap buttons"
L_GUI_SKINS_RECOUNT = "Включить скин Recount"
L_GUI_SKINS_SKADA = "Включить скин Skada"
L_GUI_SKINS_SPY = "Включить скин Spy"
L_GUI_SKINS_WEAKAURAS = "Включить скин WeakAuras"
-- Tooltip
L_GUI_TOOLTIP = "Подсказка"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Сравнивать достижения в подсказке"
L_GUI_TOOLTIP_CURSOR = "Подсказка над курсором"
L_GUI_TOOLTIP_ENABLE = "Включить подсказку"
L_GUI_TOOLTIP_HEALTH = "Числовое значение здоровья"
L_GUI_TOOLTIP_HYPERLINK = "Показывать подсказку при наведении указателя мыши на ссылку предмета."
L_GUI_TOOLTIP_ICON = "Иконка предмета в подсказке"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Отображать статус заблокированных подземелий в подсказке"
L_GUI_TOOLTIP_ITEM_COUNT = "Количество предметов"
L_GUI_TOOLTIP_SHOWSPEC = "Показывать специализацию игрока"
L_GUI_TOOLTIP_SPELL_ID = "ID заклинаний"
-- Unitframe
L_GUI_UNITFRAME = "Рамки Юнитов"
L_GUI_UNITFRAME_CASTBARS = "Включить полосу заклинаний"
L_GUI_UNITFRAME_CASTBARSAFEZONECOLOR = "Цвет полосы заклинаний игрока в безопасных зонах"
L_GUI_UNITFRAME_CLASSCOLOR = "Использовать цвет класса для полосы здоровья, вместо зеленого."
L_GUI_UNITFRAME_CLASSPORTRAITS = "Включить старые портреты классов"
L_GUI_UNITFRAME_CLICKTHROUGH = "Игнорировать любые нажатия на рамки юнитов"
L_GUI_UNITFRAME_COMBAT_TEXT = "Показывать текст боя"
L_GUI_UNITFRAME_ENABLE = "Включить рамки юнитов"
L_GUI_UNITFRAME_FLAT_CLASSPORTRAITS = "Включить новые портреты классов"
L_GUI_UNITFRAME_FOCUS_BUTTON = "Клавиша мыши фокуса '1 = mb1, 2 = mb2, 3 = mb3'"
L_GUI_UNITFRAME_FOCUS_MODIFIER = "Клавиша-модификатор фокуса 'shift-, ctrl- or alt-'"
L_GUI_UNITFRAME_FOCUSCASTBAR_HEIGHT = "Высота полосы заклинаний фокуса"
L_GUI_UNITFRAME_FOCUSCASTBAR_WIDTH = "Ширина полосы заклинаний фокуса"
L_GUI_UNITFRAME_ICONPLAYER = "Set player castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_ICONTARGET = "Set target castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_PARTY = "Включить рамки юнитов группы."
L_GUI_UNITFRAME_PLAYERCASTBAR_HEIGHT = "Высота полосы заклинаний игрока"
L_GUI_UNITFRAME_PLAYERCASTBAR_WIDTH = "Ширина полосы заклинаний игрока"
L_GUI_UNITFRAME_PLAYERDEBUFFS_ONLY = "Окрашивать только дебаффы игрока"
L_GUI_UNITFRAME_PORTRAITTIMER = "Показывать таймеры на портретах"
L_GUI_UNITFRAME_POWERPREDICTIONBAR = "Прогнозируемая полоса ресурса (Показывает ориентировочную стоимость заклинания во время его применения)"
L_GUI_UNITFRAME_SCALE = "Масштабировать некоторые рамки юнитов."
L_GUI_UNITFRAME_SHOWARENA = "Включить рамки арены"
L_GUI_UNITFRAME_SHOWBOSS = "Включить рамки боссов"
L_GUI_UNITFRAME_SHOWPLAYER = "Показывать себя в группе"
L_GUI_UNITFRAME_STYLE = "Стиль рамок 'fat или normal'" -- Это ключевые слова, чтобы опция работала их надо писать
L_GUI_UNITFRAME_TARGETCASTBAR_HEIGHT = "Высота полосы заклинаний цели"
L_GUI_UNITFRAME_TARGETCASTBAR_WIDTH = "Ширина полосы заклинаний цели"
L_GUI_UNITFRAME_TEXTHEALTHCOLOR = "Цвет текста здоровья"
L_GUI_UNITFRAME_TEXTNAMECOLOR = "Цвет текста имени"
L_GUI_UNITFRAME_TEXTPOWERCOLOR = "Цвет текста ресурса"
L_GUI_UNITFRAME_THREATGLOW = "Свечение угрозы вокруг рамки"
L_GUI_UNITFRAME_THREATVALUE = "Текст угрозы на рамке игрока"
-- Raidframe
L_GUI_RAIDFRAME = "Рамки Рейда"
L_GUI_RAIDFRAME_AURAWATCH = "Отображать таймеры для специфических заклинаний каждого класса на рамках рейда"
L_GUI_RAIDFRAME_AURAWATCH_TIMERS = "Отображать таймеры дебафов созданных отслеживанием дебаффов"
L_GUI_RAIDFRAME_DEFICITTHRESHOLD = "Недостающее здоровье"
L_GUI_RAIDFRAME_HEIGHT = "Высота рамок рейда"
L_GUI_RAIDFRAME_HORIZONTAL_HEALTHBARS = "Показывать полосы здоровья горизонтально"
L_GUI_RAIDFRAME_ICONSIZE = "Размер иконок дебаффов на рамках рейда."
L_GUI_RAIDFRAME_INDICATORSIZE = "Размер индикоторов на рамках рейда"
L_GUI_RAIDFRAME_MANABAR_HORIZONTAL = "Показывать полосу ресурса горизонтально"
L_GUI_RAIDFRAME_MANABARSHOW = "Включить полосу ресурса"
L_GUI_RAIDFRAME_MAXUNIT_PERCOLUMN = "Сколько игроков в столбце"
L_GUI_RAIDFRAME_SCALE = "Масштабирование рамок рейда"
L_GUI_RAIDFRAME_SHOW_NOTHERETIMER = "Показывать таймер АФК/Оффлайн"
L_GUI_RAIDFRAME_SHOWMOUSEOVER_HIGHLIGHT = "Подсвечивать рамки при наведении мыши"
L_GUI_RAIDFRAME_SHOWRESURRECT_TEXT = "Показывать текст воскрешения"
L_GUI_RAIDFRAME_SHOWROLE_PREFIX = "Показывать префиксы ролей"
L_GUI_RAIDFRAME_SHOWTHREATTEXT = "Показывать текст угрозы"
L_GUI_RAIDFRAME_WIDTH = "Ширина рамок рейда"
L_GUI_RAIDFRAME_ENABLE = "Включить рамки рейда"
L_GUI_RAIDFRAME_MAINTANKFRAMES = "Включить использование рамок главного танка и помощника в рейде."
-- WorldMap
L_GUI_WORLDMAP = "Карта мира"
L_GUI_WORLDMAP_ALPHA_WHENMOVING = "Прозрачность карты мира во время движения."
L_GUI_WORLDMAP_COORDS = "Координаты на карте мира."
L_GUI_WORLDMAP_FADE_WHENMOVING = "Затухание карты мира во время движения."
L_GUI_WORLDMAP_FOG_OF_WAR = "Убрать туман войны на карте мира"
L_GUI_WORLDMAP_SMALL_WORLDMAP = "Сделать карту мира меньше."
-- Config Buttons
L_GUI_CLOSE = "CLOSE"
L_GUI_APPLY = "APPLY"
