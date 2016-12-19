if (GetLocale() ~= "frFR") then return end

-- Localization for frFR

local PerformanceSlight = "\n|cffFF0000Disabling this may slightly increase performance|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Turn this off to manually input your bar numbers|r"

-- Actionbar
UIConfigLocal.ActionBarBottomBars = "Number of bars on the bottom (1, 2 or 3)"
UIConfigLocal.ActionBarButtonSize = "Buttons size"
UIConfigLocal.ActionBarButtonSpace = "Buttons space"
UIConfigLocal.ActionBarEnable = "Enable action bars"
UIConfigLocal.ActionBarEquipBorder = "Display green border on equipped items"
UIConfigLocal.ActionBarGrid = "Show empty action bar buttons"
UIConfigLocal.ActionBarHideHighlight = "Hide proc highlight"
UIConfigLocal.ActionBarHotkey = "Show hotkey on buttons"
UIConfigLocal.ActionBarMacro = "Show macro name on buttons"
UIConfigLocal.ActionBarOutOfMana = "Out of mana color"
UIConfigLocal.ActionBarOutOfRange = "Out of range color"
UIConfigLocal.ActionBarPetBarHide = "Hide pet bar"
UIConfigLocal.ActionBarPetBarHorizontal = "Enable horizontal pet bar"
UIConfigLocal.ActionBarPetBarMouseover = "Petbar on mouseover (only for horizontal petbar)"
UIConfigLocal.ActionBarRightBars = "Number of action bars on right (0, 1, 2 or 3)"
UIConfigLocal.ActionBarRightBarsMouseover = "Right bars on mouseover"
UIConfigLocal.ActionBarSelfCast = "Always self-cast on right-click (regardless of current target)"
UIConfigLocal.ActionBarSplitBars = "Split the fifth bar on two bars on 6 buttons"
UIConfigLocal.ActionBarStanceBarHide = "Hide stance bar"
UIConfigLocal.ActionBarStanceBarHorizontal = "Enable horizontal stance bar"
UIConfigLocal.ActionBarStanceBarMouseover = "Stance bar on mouseover"
UIConfigLocal.ActionBarToggleMode = "Enable toggle mode"..ToggleOffReminder

-- Announcements
UIConfigLocal.Announcements = "Announcements"
UIConfigLocal.AnnouncementsBadGear = "Check for bad gear in instances"
UIConfigLocal.AnnouncementsInterrupt = "Announce in party/raid when you interrupt others"
UIConfigLocal.AnnouncementsPullCountdown = "Simple script to aid in creating a pull countdown announce. /pc"
UIConfigLocal.AnnouncementsSaySapped = "Instantly says Sapped to alert those around you whenever |cFFFFF569Rogues|r sap you."
UIConfigLocal.AnnouncementsSayThanks = "Say thanks for some spells"
UIConfigLocal.AnnouncementsSpells = "Announce in party/raid when you cast some spells"
UIConfigLocal.AnnouncementsSpellsFromAll = "Check spells cast from all members"

-- Automation
UIConfigLocal.Automation = "Automation"
UIConfigLocal.AutomationAcceptQuest = "Auto accept quest (disabled if hold Shift)"
UIConfigLocal.AutomationAutoCollapse = "Auto collapse objective tracker in instances"
UIConfigLocal.AutomationAutoInvite = "Auto accept invites (friends/guild) only"
UIConfigLocal.AutomationDeclineDuel = "Auto decline all duels"
UIConfigLocal.AutomationLoggingCombat = "Auto enables combat log text file in raid instances"
UIConfigLocal.AutomationResurrection = "Auto resurrection in battlegrounds"
UIConfigLocal.AutomationScreenShot = "Take screenshot when player gets an achievement"
UIConfigLocal.AutomationTabBinder = "Auto change tab key to only target enemy players"

-- Bag
UIConfigLocal.Bags = "Bags"
UIConfigLocal.BagsButtonSize = "Set a size for bag slots"
UIConfigLocal.BagsEnable = "Enable Bags"
UIConfigLocal.BagsInsertLeftToRight = "Set the loot to the left most bag first"
UIConfigLocal.BagsItemsPerRow = "Set how many slots are on each row of the bags"
UIConfigLocal.BagsSortRightToLeft = "Sort bags right to left, bottom to top"
UIConfigLocal.BagsSpacing = "Set the spacing between bag slots"

-- Blizzard
UIConfigLocal.Blizzard = "Blizzard"
UIConfigLocal.BlizzardClassColor = "Colorize player names by their class in friend list, who list, guild list, etc.."
UIConfigLocal.BlizzardColorTextures = "Change most UI texture hue colors."
UIConfigLocal.BlizzardRaidTools = "Raid tools"
UIConfigLocal.BlizzardReplaceBlizzardFonts = "Replaces the default |cff00B4FFBlizzard fonts|r on various panels and frames from |cff3c9bedKkthnxUI|r."
UIConfigLocal.BlizzardReputationGain = "Display a message which shows how much reputation you gained"
UIConfigLocal.BlizzardTexturesColor = "UI texture hue color. (Default is Classcolor)"
UIConfigLocal.BlizzardVehicleMouseover = "Vehicle frame on mouseover"

-- DataBars
UIConfigLocal.DataBars = "DataBars"
UIConfigLocal.DataBarsArtifactColor = "Artifact bar color"
UIConfigLocal.DataBarsArtifactEnable = "Enable Artifact bar"
UIConfigLocal.DataBarsArtifactFade = "Fade Artifact bar"
UIConfigLocal.DataBarsArtifactHeight = "Artifact bar height"
UIConfigLocal.DataBarsArtifactWidth = "Artifact bar width"
UIConfigLocal.DataBarsExperienceColor = "Experience bar color"
UIConfigLocal.DataBarsExperienceEnable = "Enable Experience bar"
UIConfigLocal.DataBarsExperienceFade = "Fade Experience bar"
UIConfigLocal.DataBarsExperienceHeight = "Experience bar height"
UIConfigLocal.DataBarsExperienceRestedColor = "Experience bar rest color"
UIConfigLocal.DataBarsExperienceWidth = "Experience bar width"
UIConfigLocal.DataBarsHonorColor = "Honor bar color"
UIConfigLocal.DataBarsHonorEnable = "Enable Honor bar"
UIConfigLocal.DataBarsHonorFade = "Fade Honor bar"
UIConfigLocal.DataBarsHonorHeight = "Honor bar height"
UIConfigLocal.DataBarsHonorWidth = "Honor bar width"
UIConfigLocal.DataBarsReputationEnable = "Enable Reputation bar"
UIConfigLocal.DataBarsReputationFade = "Fade Reputation bar"
UIConfigLocal.DataBarsReputationHeight = "Reputation bar height"
UIConfigLocal.DataBarsReputationWidth = "Reputation bar width"

-- Auras
UIConfigLocal.Auras = "Auras"
UIConfigLocal.AurasAnimation = "Show a 'pop in' animation on auras"..PerformanceSlight
UIConfigLocal.AurasBuffsPerRow = "Set the number of buffs to show before creating a new row"
UIConfigLocal.AurasCastBy = "Show who cast an aura in its tooltip"
UIConfigLocal.AurasConsolidate = "Consolidate Auras"
UIConfigLocal.AurasEnable = "Enable Auras"
UIConfigLocal.AurasFlash = "Flash auras when their duration is low"..PerformanceSlight
UIConfigLocal.AurasHideBuffs = "Disable buff display"
UIConfigLocal.AurasHideDebuffs = "Disable debuff display"

-- Chat
UIConfigLocal.ChatBackground = "Enable chat background"
UIConfigLocal.ChatDamageMeterSpam = "Merge damage meter spam in one line-link"
UIConfigLocal.ChatEnable = "Enable chat"
UIConfigLocal.ChatFading = "Enable chat fading"
UIConfigLocal.ChatHeight = "Height of the Chatframe"
UIConfigLocal.ChatLinkBrackets = "Display URL links wrapped in brackets"
UIConfigLocal.ChatLinkColor = "Set a color to display URL links in"
UIConfigLocal.ChatMessageFilter = "Removing some systems spam('Player1' won duel 'Player2')"
UIConfigLocal.ChatOutline = "Apply an outline to the chat font"
UIConfigLocal.ChatScrollByX = "Set the number of lines that the chat will jump when scrolling"
UIConfigLocal.ChatSpamFilter = "Removing some players chat spam in trade"
UIConfigLocal.ChatTabsMouseover = "Chat tabs on mouseover"
UIConfigLocal.ChatTabsOutline = "Apply an outline to the chat tabs font"
UIConfigLocal.ChatWhispSound = "Play sound when receiving whispers"
UIConfigLocal.ChatWidth = "Width of the Chatframe"

-- DataText
UIConfigLocal.DataText = "DataText"
UIConfigLocal.DataTextBattleground = "Enable data text displaying battleground information"
UIConfigLocal.DataTextBottomBar = "Enable DataTextBar under your Actionbars"
UIConfigLocal.DataTextLocalTime = "Use local time in the Time data text, rather than realm time"
UIConfigLocal.DataTextSystem = "Enable system data text under the minimap displaying FPS & MS"
UIConfigLocal.DataTextThreatBar = "Display threat bar on the bottom datatext panel."
UIConfigLocal.DataTextTime = "Enable clock data text displaying time information at the bottom of the minimap"
UIConfigLocal.DataTextTime24Hr = "Set the Time data text to 24 hour format"

-- Error
UIConfigLocal.Error = "Errors"
UIConfigLocal.ErrorBlack = "Hide errors from black list"
UIConfigLocal.ErrorWhite = "Show errors from white list"
UIConfigLocal.ErrorCombat = "Hide all errors in combat"

-- Cooldown
UIConfigLocal.Cooldown = "Cooldown"
UIConfigLocal.CooldownEnable = "Enable UI cooldown module"
UIConfigLocal.CooldownFontSize = "Cooldown font size"
UIConfigLocal.CooldownThreshold = "Cooldown threshold number"

-- Filger
UIConfigLocal.Filger = "Timers (Filger)"
UIConfigLocal.FilgerBuffsSize = "Buffs size"
UIConfigLocal.FilgerCooldownSize = "Cooldowns size"
UIConfigLocal.FilgerDisableCD = "Disable cooldowns"
UIConfigLocal.FilgerEnable = "Enable Filger"
UIConfigLocal.FilgerMaxTestIcon = "The number of icons to the test"
UIConfigLocal.FilgerPvPSize = "PvP debuffs size"
UIConfigLocal.FilgerShowTooltip = "Show tooltip"
UIConfigLocal.FilgerTestMode = "Test icon mode"

-- General
UIConfigLocal.GeneralAutoScale = "Auto UI Scale"
UIConfigLocal.GeneralBubbleBackdrop = "Remove the chat bubble backdrop."
UIConfigLocal.GeneralBubbleFontSize = "Chat bubble font size"
UIConfigLocal.GeneralCustomLagTolerance = "Automatically update the Blizzard Custom Lag Tolerance option to your latency"
UIConfigLocal.GeneralDisableTutorialButtons = "Disables the tutorial button found on some frames"
UIConfigLocal.GeneralShowConfigButton = "Show config button on minimap"
UIConfigLocal.GeneralTranslateMessage = "Popup to gain help for GUI translation."
UIConfigLocal.GeneralUIScale = "UI Scale (if auto-scale is disabled)"
UIConfigLocal.GeneralWelcomeMessage = "Welcome message in chat."

-- Loot
UIConfigLocal.LootConfirmDisenchant = "Auto confirm disenchant"
UIConfigLocal.LootAutoGreed = "Enable auto-greed & disenchant for green items at max level"
UIConfigLocal.LootLootFilter = "Filter party & raid members loot messages, based on item rarity"
UIConfigLocal.LootEnable = "Enable loot frame"
UIConfigLocal.LootIconSize = "Icon size"
UIConfigLocal.LootGroupLoot = "Enable group loot frame"
UIConfigLocal.LootWidth = "Loot frame width"

-- Minimap
UIConfigLocal.Minimap = "Minimap"
UIConfigLocal.MinimapCollectButtons = "Collect some minimap buttons in one line"
UIConfigLocal.MinimapEnable = "Enable minimap & make it square"
UIConfigLocal.MinimapFadeButtons = "Fade addon button when collected next to minimap"
UIConfigLocal.MinimapGarrison = "Garrison icon is shown on minimap"
UIConfigLocal.MinimapSize = "Minimap size - Default is 150"
UIConfigLocal.MinimapPing = "Displays a message when someone pings the minimap. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"

-- Misc
UIConfigLocal.Misc = "Miscellaneous"
UIConfigLocal.MiscAFKCamera = "Spin camera while AFK"
UIConfigLocal.MiscAlreadyKnown = "Colorizes recipes, mounts & pets that are already known"
UIConfigLocal.MiscArmory = "Add Armory link in UnitPopupMenus (It can break UnitPopupMenus)"
UIConfigLocal.MiscAutoRepair = "When visiting a repair merchant, automatically repair our gear"
UIConfigLocal.MiscAutoSellGrays = "When visiting a vendor, automatically sell gray quality items"
UIConfigLocal.MiscBGSpam = "Remove Boss Emote spam during BG"
UIConfigLocal.MiscColorPicker = "Improved color picker"
UIConfigLocal.MiscEnhancedMail = "Adds a take all button to your mail frame."
UIConfigLocal.MiscHideTalkingHead = "Hide Talking Head Frame"
UIConfigLocal.MiscInviteKeyword = "Short keyword for invite (/ainv)"
UIConfigLocal.MiscItemLevel = "Item level on character slot buttons"
UIConfigLocal.MiscMerchantItemLevel = "Show item level for weapons and armor in merchant"
UIConfigLocal.MiscMoveBlizzard = "Move some Blizzard frames"
UIConfigLocal.MiscNoBanner = "Hide Boss Banner Loot Frame"
UIConfigLocal.MiscSellMisc = "Automatically sells useless items that are not gray quality"
UIConfigLocal.MiscSlotDurability = "Durability on character slot buttons"
UIConfigLocal.MiscUseGuildRepair = "When using 'Auto Repair', use funds from the guild bank"

-- Nameplates
UIConfigLocal.Nameplates = "Nameplates"
UIConfigLocal.NameplatesAdditionalHeight = "Additional height for selected nameplate"
UIConfigLocal.NameplatesAdditionalWidth = "Additional width for selected nameplate"
UIConfigLocal.NameplatesAurasSize = "Debuffs size"
UIConfigLocal.NameplatesBadColor = "Bad threat color, varies depending if your a tank or dps/heal"
UIConfigLocal.NameplatesCastbarName = "Show castbar name"
UIConfigLocal.NameplatesClamp = "Clamp nameplates to the top of the screen when outside of view"
UIConfigLocal.NameplatesClassIcons = "Icons by class in PvP"
UIConfigLocal.NameplatesCombat = "Automatically show nameplates in combat"
UIConfigLocal.NameplatesDistance = "Show nameplates for units within this range"
UIConfigLocal.NameplatesEnable = "Enable nameplates"
UIConfigLocal.NameplatesEnhancedThreat = "Enable threat feature, automatically changes by your role"
UIConfigLocal.NameplatesGoodColor = "Good threat color, varies depending if your a tank or dps/heal"
UIConfigLocal.NameplatesHealerIcon = "Show icon above enemy healers nameplate in battlegrounds"
UIConfigLocal.NameplatesHealthValue = "Numeral health value"
UIConfigLocal.NameplatesHeight = "Nameplates height"
UIConfigLocal.NameplatesNameAbbreviate = "Abbreviate names longer than 18 characters"
UIConfigLocal.NameplatesNearColor = "Losing/Gaining threat color"
UIConfigLocal.NameplatesOffTankColor = "Offtank threat color"
UIConfigLocal.NameplatesSpiral = "Spiral on nameplate auras"
UIConfigLocal.NameplatesTimer = "Show cooldown timer on nameplate auras"
UIConfigLocal.NameplatesTotemIcons = "Show icon above enemy totems nameplate"
UIConfigLocal.NameplatesTrackAuras = "Show debuffs (from the list)"
UIConfigLocal.NameplatesWidth = "Nameplates width"

-- PulseCD
UIConfigLocal.PulseCD = "Pulse Cooldowns"
UIConfigLocal.PulseCDAnimationScale = "Animation scaling"
UIConfigLocal.PulseCDEnable = "Show cooldowns pulse"
UIConfigLocal.PulseCDHoldTime = "Max opacity hold time"
UIConfigLocal.PulseCDSize = "Cooldowns pulse icon size"
UIConfigLocal.PulseCDSound = "Warning sound notification"
UIConfigLocal.PulseCDThreshold = "Minimal threshold time"

-- RaidCD
UIConfigLocal.RaidCD = "Raid Cooldowns"
UIConfigLocal.RaidCDEnable = "Enable raid cooldowns"
UIConfigLocal.RaidCDHeight = "Raid cooldowns bars height"
UIConfigLocal.RaidCDWidth = "Raid cooldowns bars width (if the icon is enabled, width+28)"
UIConfigLocal.RaidCDUpWards = "Raid cooldowns sort upwards bars"
UIConfigLocal.RaidCDExpiration = "Sort by expiration time"
UIConfigLocal.RaidCDShowSelf = "Show self cooldowns"
UIConfigLocal.RaidCDShowIcon = "Raid cooldowns icons"
UIConfigLocal.RaidCDShowInRaid = "Show raid cooldowns in raid zone"
UIConfigLocal.RaidCDShowInParty = "Show raid cooldowns in party zone"
UIConfigLocal.RaidCDShowInArena = "Show raid cooldowns in arena zone"

-- Config GUI Buttons
UIConfigLocal.ConfigApplyButton = "Apply"
UIConfigLocal.ConfigButtonReset = "Total UI Reset"
UIConfigLocal.ConfigCloseButton = "Close"

-- Config Static Popups
UIConfigLocal.ConfigPerChar = "Are you sure you want to change to or from 'Per Char Settings'?"
UIConfigLocal.ConfigResetAll = "Are you sure you want to reset all settings for |cff3c9bedKkthnxUI|r."
UIConfigLocal.ConfigResetChar = "Are you sure you want to reset your character's settings for|r?"
UIConfigLocal.ConfigSetSavedSettings = "Set settings Per-Character"

-- Skins
UIConfigLocal.Skins = "AddOn Skins"
UIConfigLocal.SkinsBigWigs = "BigWigs"
UIConfigLocal.SkinsChatBubble = "Blizzard chat bubbles"
UIConfigLocal.SkinsDBM = "DeadlyBossMods"
UIConfigLocal.SkinsDBMMove = "Allow to move DBM bars"
UIConfigLocal.SkinsMinimapButtons = "Minimap buttons"
UIConfigLocal.SkinsRecount = "Recount"
UIConfigLocal.SkinsSkada = "Skada"
UIConfigLocal.SkinsSpy = "Spy"
UIConfigLocal.SkinsWeakAuras = "WeakAuras"

-- Tooltip
UIConfigLocal.Tooltip = "Tooltip"
UIConfigLocal.TooltipAchievements = "Comparing achievements in tooltip"
UIConfigLocal.TooltipCursor = "Tooltip above cursor"
UIConfigLocal.TooltipEnable = "Enable tooltip"
UIConfigLocal.TooltipHealthValue = "Numeral health value"
UIConfigLocal.TooltipHyperLink = "Display the hyperlink tooltip while hovering over a hyperlink."
UIConfigLocal.TooltipInstanceLock = "Your instance lock status in tooltip"
UIConfigLocal.TooltipItemCount = "Item count"
UIConfigLocal.TooltipItemIcon = "Item icon in tooltip"
UIConfigLocal.TooltipSpellID = "Spell ID"
UIConfigLocal.TooltipTalents = "Display target talents/itemlevel on tooltip"

-- Unitframe
UIConfigLocal.Unitframe = "Unit Frames"
UIConfigLocal.UnitframeCastbars = "Enable uniframe castbars"
UIConfigLocal.UnitframeClassColor = "Classcolor the uniframe healthbars."
UIConfigLocal.UnitframeClassPortraits = "Enable class portraits"
UIConfigLocal.UnitframeCombatText = "Show Combat Feedback"
UIConfigLocal.UnitframeEnable = "Enable unit frames"
UIConfigLocal.UnitframeFocusCastbarHeight = "Focus castbar Height"
UIConfigLocal.UnitframeFocusCastbarWidth = "Focus castbar width"
UIConfigLocal.UnitframeGCDBar = "Global cooldown spark on player frame"
UIConfigLocal.UnitframeIconPlayer = "Set player castbar icon 'LEFT OR RIGHT'"
UIConfigLocal.UnitframeIconTarget = "Set target castbar icon 'LEFT OR RIGHT'"
UIConfigLocal.UnitframeParty = "Enable party frames."
UIConfigLocal.UnitframePlayerCastbarHeight = "Player castbar height"
UIConfigLocal.UnitframePlayerCastbarWidth = "Player castbar width"
UIConfigLocal.UnitframePlayerDebuffsOnly = "Only color player debuffs"
UIConfigLocal.UnitframePortraitTimer = "Show Portrait Timers"
UIConfigLocal.UnitframePowerPredictionBar = "Power prediction bar (Display estimated cost of spells when casting)"
UIConfigLocal.UnitframeScale = "Scale some of the uniframes."
UIConfigLocal.UnitframeShowArena = "Enable arena frames"
UIConfigLocal.UnitframeShowBoss = "Enable boss frames"
UIConfigLocal.UnitframeShowPlayer = "Show yourself in the party"
UIConfigLocal.UnitframeStyle = "Style the uniframes look 'fat or normal'"
UIConfigLocal.UnitframeSwingBar = "Enable swing bar"
UIConfigLocal.UnitframeTargetCastbarHeight = "Target castbar height"
UIConfigLocal.UnitframeTargetCastbarWidth = "Target castbar width"
UIConfigLocal.UnitframeThreatGlow = "Threat glow around unitframes"
UIConfigLocal.UnitframeThreatValue = "Visual threat text on the player frame"

-- Raidframe
UIConfigLocal.Raidframe = "Raid Frames"
UIConfigLocal.RaidframeAuraWatch = "Display timers for class specific buffs in the corners of the raid frames"
UIConfigLocal.RaidframeAuraWatchTimers = "Display a timer on debuff icons created by Debuff Watch"
UIConfigLocal.RaidframeDeficitThreshold = "Health deficit threshold"
UIConfigLocal.RaidframeEnable = "Enable raid frames"
UIConfigLocal.RaidframeHeight = "Height of raid frames"
UIConfigLocal.RaidframeHorizontalHealthBars = "Display the healthbars horizontal"
UIConfigLocal.RaidframeIconSize = "Size of debuff icons diplayed on raid frames."
UIConfigLocal.RaidframeIndicatorSize = "Size of indicators on raid frames"
UIConfigLocal.RaidframeMainTankFrames = "Enable the use of main tank/assist frames in a raid."
UIConfigLocal.RaidframeManabarHorizontal = "Display the manabar horizontal"
UIConfigLocal.RaidframeManabarShow = "Display Manabar"
UIConfigLocal.RaidframeMaxUnitPerColumn = "How many units per raid column"
UIConfigLocal.RaidframeRaidAsParty = "Display raid frames instead of party frames"
UIConfigLocal.RaidframeScale = "Scale of raid frames"
UIConfigLocal.RaidframeShowMouseoverHighlight = "Show a highlight texture on mouseover"
UIConfigLocal.RaidframeShowNotHereTimer = "Show AFK/Offline timers"
UIConfigLocal.RaidframeShowResurrectText = "Display resurrection text"
UIConfigLocal.RaidframeShowRolePrefix = "Display role prefixes"
UIConfigLocal.RaidframeShowThreatText = "Show threat text"
UIConfigLocal.RaidframeWidth = "Width of raid frames"

-- WorldMap
UIConfigLocal.WorldMap = "World Map"
UIConfigLocal.WorldMapAlphaWhenMoving = "Alpha of the world map when you are moving."
UIConfigLocal.WorldMapCoordinates = "Put coordinates on the world map."
UIConfigLocal.WorldMapFadeWhenMoving = "Fade the world map when you are moving."
UIConfigLocal.WorldMapFogOfWar = "Remove fog of war on World Map"
UIConfigLocal.WorldMapSmallWorldMap = "Make the world map smaller."