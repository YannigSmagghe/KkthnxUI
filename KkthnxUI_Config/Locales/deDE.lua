-- Localization for deDE
local Locale = GetLocale()
if (Locale ~= "deDE") then
	return
end

local PerformanceSlight = "\n|cffFF0000Eine Deaktivierung könnte die Spielperformance leicht erhöhen|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Schalte diesen Menüpunt aus, um Deine Aktionsleisten manuell zu steuern|r"

-- Actionbar
UIConfigLocal.ActionBarBottomBars = "Anzahl der Leisten am unteren Rand (1, 2 oder 3)"
UIConfigLocal.ActionBarButtonSize = "Buttongröße"
UIConfigLocal.ActionBarButtonSpace = "Buttonabstand"
UIConfigLocal.ActionBarEnable = "Aktivere Aktionsleisten"
UIConfigLocal.ActionBarEquipBorder = "Zeige einen grünen Rand um angelegte Items"
UIConfigLocal.ActionBarGrid = "Zeige leere Aktionleistenplätze an"
UIConfigLocal.ActionBarHideHighlight = "Verstecke Proc Anzeigen"
UIConfigLocal.ActionBarHotkey = "Zeige Hotkey auf den Buttons"
UIConfigLocal.ActionBarMacro = "Zeige Makronamen auf den Buttons"
UIConfigLocal.ActionBarOutOfMana = "Farbe wenn Mana leer"
UIConfigLocal.ActionBarOutOfRange = "Farbe wenn ausser Reichweite"
UIConfigLocal.ActionBarPetBarHide = "Verstecke die Begleiterleiste"
UIConfigLocal.ActionBarPetBarHorizontal = "Aktiviere horizontale Begleiterleiste"
UIConfigLocal.ActionBarPetBarMouseover = "Begleiterleiste bei mouseover (nur für horizontale Begleiterleiste)"
UIConfigLocal.ActionBarRightBars = "Anzahl der Aktionsleisten rechts (0, 1, 2 oder 3)"
UIConfigLocal.ActionBarRightBarsMouseover = "Rechte Leisten bei mouseover"
UIConfigLocal.ActionBarSelfCast = "Immer Selbstzauber bei rechtsklick (ungeachtet des momentanten Ziels)"
UIConfigLocal.ActionBarSplitBars = "Teile die fünfte Aktionsleiste auf zwei Leisten mit 6 Buttons auf"
UIConfigLocal.ActionBarStanceBarHide = "Verstecke die Haltungsleiste"
UIConfigLocal.ActionBarStanceBarHorizontal = "Aktiviere horizontale Haltungsleiste"
UIConfigLocal.ActionBarStanceBarMouseover = "Haltungsleiste bei mouseover"
UIConfigLocal.ActionBarToggleMode = "Aktivere Umschaltmode"..ToggleOffReminde

-- Ankündigungen
UIConfigLocal.Announcements = "Ankündigungen"
UIConfigLocal.AnnouncementsBadGear = "Überprüfe kaputte Ausrüstung in Instanzen"
UIConfigLocal.AnnouncementsInterrupt = "Ankündigungen im Gruppen-/Schlachtzugchat wenn Du jemanden unterbrochen hast."
UIConfigLocal.AnnouncementsPullCountdown = "Simples Script um einen Pulltimer zu starten. Tippe /pc in den Chat."
UIConfigLocal.AnnouncementsSaySapped = "Kopfnussansage wenn die ein |cFFFFF569Schurke|r aus dem Kampf genommen hat."
UIConfigLocal.AnnouncementsSpells = "Ankündigungen im Gruppen-/Schlachtzugchat wenn Du bestimmte Zauber benutzt hast."
UIConfigLocal.AnnouncementsSpellsFromAll = "Überprüfe Zauber von allen Mitspielern."

-- Automatisierung
UIConfigLocal.Automation = "Automatisierung"
UIConfigLocal.AutomationAutoInvite = "Automatisches Akzeptieren von Einladungen (NUR Freunde/Gildenmitglieder)"
UIConfigLocal.AutomationAutoCollapse = "Automatisches Einklappen der Questanzeige in Instanzen"
UIConfigLocal.AutomationDeclineDuel = "Automatische Ablehnung von Duellen"
UIConfigLocal.AutomationLoggingCombat = "Automatisches Aktivieren der Kampflogdatei in Schlachtzuginstanzen"
UIConfigLocal.AutomationNoBanner = "Auto hide the 'Boss Banner' loot frame"
UIConfigLocal.AutomationResurrection = "Automatisches Wiederbeleben auf Schlachtfeldern"
UIConfigLocal.AutomationScreenShot = "Automatisches Bildschirmfoto bei erreichen eines Erfolges"
UIConfigLocal.AutomationTabBinder = "Automatischer Wechsel der Tab-Taste um nur feindliche Ziele anzuvisieren"

-- Taschen
UIConfigLocal.Bags = "Taschen"
UIConfigLocal.BagsBagFilter = "Lösche automatisch unbrauchbare Gegenstände aus Deinen Taschen nach dem aufheben"
UIConfigLocal.BagsButtonSize = "Größe der Taschenplätze"
UIConfigLocal.BagsEnable = "Aktiviere die 'Alles in einer Tasche' Ansicht"
UIConfigLocal.BagsInsertLeftToRight = "Set the loot to the left most bag first"
UIConfigLocal.BagsItemsPerRow = "aschenplatzanzahl pro Reihe"
UIConfigLocal.BagsPulseNewItem = "Aktiviere Pulseanimation für neue Gegenstände"
UIConfigLocal.BagsSortRightToLeft = "Sort bags right to left, bottom to top"
UIConfigLocal.BagsSpacing = "Zwischenraum zwischen den Taschenslots"

-- Blizzard
UIConfigLocal.Blizzard = "Blizzard"
UIConfigLocal.BlizzardClassColor = "Zeige Spielernamen in deren Klassenfarbe an. (Freundesliste, Wer Liste, Gildenliste, etc.)"
UIConfigLocal.BlizzardColorTextures = "Passe von den meisten UI Texturen den Farbton an."
UIConfigLocal.BlizzardEasyDelete = "Lösche |CFF0080ffBlaue|r/|CFFb048f8Epische|r Gegenstände ohne 'löschen' eintippen zu müssen"
UIConfigLocal.BlizzardReplaceBlizzardFonts = "Ersetze die Standard |cff00B4FFBlizzard Schriftarten|r auf vielen UI Elementen der |cff3c9bedKkthnxUI|r."
UIConfigLocal.BlizzardReputationGain = "Zeige eine Nachricht, wenn Du Rufpunkte gesammelt hast"
UIConfigLocal.BlizzardTexturesColor = "UI Texturfarbton. (Standard ist Klassenfarbe)"
UIConfigLocal.BlizzardVehicleMouseover = "Farhzeuganzeige bei 'mouseover'"

-- Datenleisten
UIConfigLocal.DataBars = "Datenleisten"
UIConfigLocal.DataBarsArtifactColor = "Farbe der Artefaktleiste"
UIConfigLocal.DataBarsArtifactEnable = "Aktiviere die Artefaktleiste"
UIConfigLocal.DataBarsArtifactFade = "Verblassen der Artefaktleiste"
UIConfigLocal.DataBarsArtifactHeight = "Höhe der Artefaktleiste"
UIConfigLocal.DataBarsArtifactWidth = "Breite der Artefaktleiste"
UIConfigLocal.DataBarsExperienceColor = "Farbe der Erfahrungsleiste"
UIConfigLocal.DataBarsExperienceEnable = "Aktiviere die Erfahrungsleiste"
UIConfigLocal.DataBarsExperienceFade = "Fade Experience bar"
UIConfigLocal.DataBarsExperienceHeight = "Höhe der Erfahrungsleiste"
UIConfigLocal.DataBarsExperienceRestedColor = "Farbe der Erfahrungsleiste (Erholung)"
UIConfigLocal.DataBarsExperienceWidth = "Breite der Erfahrungsleiste"
UIConfigLocal.DataBarsHonorColor = "Farbe der Ehreleiste"
UIConfigLocal.DataBarsHonorEnable = "Aktiviere die Ehreleiste"
UIConfigLocal.DataBarsHonorFade = "Verblassen der Ehreleiste"
UIConfigLocal.DataBarsHonorHeight = "Höhe der Ehreleiste"
UIConfigLocal.DataBarsHonorWidth = "Breite der Ehreleiste"
UIConfigLocal.DataBarsReputationEnable = "Aktiviere die Rufleiste"
UIConfigLocal.DataBarsReputationFade = "Verblassen der Rufleiste"
UIConfigLocal.DataBarsReputationHeight = "Höhe der Rufleiste"
UIConfigLocal.DataBarsReputationWidth = "Breite der Rufleiste"

-- Auren
UIConfigLocal.Auras = "Auren"
UIConfigLocal.AurasAnimation = "Zeige eine 'pop in' Animation der Auren"..PerformanceSlight
UIConfigLocal.AurasBuffsPerRow = "Anzahl der Stärkungszauber bevor eine neue Zeile angefangen wird"
UIConfigLocal.AurasCastBy = "Zeige von wem eine Aura stammt im Tooltip an"
UIConfigLocal.AurasConsolidate = "Auren einklappen"
UIConfigLocal.AurasEnable = "Aktivere Auren"
UIConfigLocal.AurasFlash = "Aufblitzen der Auren, wenn die Zeit fast abgelaufen ist"..PerformanceSlight
UIConfigLocal.AurasHideBuffs = "Deaktivere die Stärkungszauberanzeige"
UIConfigLocal.AurasHideDebuffs = "Deaktivere die Schwächungszauberanzeige"

-- Chat
UIConfigLocal.ChatFading = "Aktiviere das Verblassen des Chats"
UIConfigLocal.ChatDamageMeterSpam = "Zeige den 'damage meter spam' zusammengefasst in einem 'line-link' an"
UIConfigLocal.ChatEnable = "Aktiviere Chat"
UIConfigLocal.ChatFilter = "Lösche einigen Spam von Spielern"
UIConfigLocal.ChatHeight = "Höhe des Chatfensters"
UIConfigLocal.ChatLinkBrackets = "Zeige URL Links in Klammern"
UIConfigLocal.ChatLinkColor = "Farbe der Links im Chat"
UIConfigLocal.ChatOutline = "Verwende einen Umriss um die Schriftart im Chat"
UIConfigLocal.ChatScrollByX = "Setze die Anzahl der Zeile die im Chat gesprungen werden beim scrollen"
UIConfigLocal.ChatSpam = "Lösche Systemspam(z.B. 'Spieler1' gewinnt ein Duell gegen 'Spieler2')"
UIConfigLocal.ChatTabsMouseover = "Chattabs bei 'mouseover'"
UIConfigLocal.ChatTabsOutline = "Verwende einen Umriss um die Schritart der Chattabs"
UIConfigLocal.ChatWhispSound = "Spiele einen Sound ab, wenn du eine Flüsternachricht bekommst"
UIConfigLocal.ChatWidth = "Breite des Chatfensters"

-- Datatexte
UIConfigLocal.DataText = "Datatexte"
UIConfigLocal.DataTextBattleground = "Aktiviere die Datatextanzeige auf Schlachtfeldern"
UIConfigLocal.DataTextBottomBar = "Aktiviere eine Datatextleiste unter den Aktionsleisten"
UIConfigLocal.DataTextLocalTime = "Benutze die lokale Zeit bei der Zeitanzeige auf der Minimap, anstatt der Serverzeit"
UIConfigLocal.DataTextLocation = "Aktivere die Positionsanzeige oben auf der Minimap"
UIConfigLocal.DataTextSystem = "Aktivere den Datatext unter der Minimap, der Dir Deine FPS & MS anzeigt"
UIConfigLocal.DataTextTime = "Aktiviere den Datatext auf der Minimap, der Dir die Uhrzeit anzeigt"
UIConfigLocal.DataTextTime24Hr = "Stelle die Zeitanzeige in der MInimap auf das 24 Stunden Format um"

-- Abklingzeiten
UIConfigLocal.Cooldown = "Abklingzeiten"
UIConfigLocal.CooldownEnable = "Aktivere das UI Modul für die Abklingzeiten"
UIConfigLocal.CooldownFontSize = "chriftgröße der Abklingzeiten"
UIConfigLocal.CooldownThreshold = "Abklingzeiten Schwellenwert"

-- Filger
UIConfigLocal.Filger = "Filger"
UIConfigLocal.FilgerBuffsSize = "Größe der Stärkungszauber"
UIConfigLocal.FilgerCooldownSize = "Größe Abklingzeiten"
UIConfigLocal.FilgerDisableCD = "Deaktivere Abklingzeiten"
UIConfigLocal.FilgerEnable = "Aktiviere Filger"
UIConfigLocal.FilgerMaxTestIcon = "Anzahl der Symbole beim Testen"
UIConfigLocal.FilgerPvPSize = "Größe der PvP Schwächungszauber"
UIConfigLocal.FilgerShowTooltip = "Zeige Tooltip"
UIConfigLocal.FilgerTestMode = "Testmodus der Symbole"

-- General
UIConfigLocal.GeneralAutoScale = "AAutomatische UI Skalierung"
UIConfigLocal.GeneralBubbleBackdrop = "Entferne den Hintergrund der Sprachblasen."
UIConfigLocal.GeneralBubbleFontSize = "Schriftgröße in den Sprachblasen"
UIConfigLocal.GeneralCustomLagTolerance = "Automatisches Update der 'Blizzard Custom Lag Tolerance' Option zu Deiner Latenz"
UIConfigLocal.GeneralShowConfigButton = "Zeigt den Konfigurationsbutton an der Minimap an"
UIConfigLocal.GeneralTranslateMessage = "Popup anzeigen für Hilfe bei der UI Übersetzung."
UIConfigLocal.GeneralUIScale = "UI Skalierung (Wenn automatische Skalierung deaktivert ist)"
UIConfigLocal.GeneralWelcomeMessage = "Willkommensnachricht im Chat anzeigen."

-- Loot
UIConfigLocal.LootAutoGreed = "Aktiviere automatisch auf Gier & Entzaubern würfeln bei grünen Gegenständen auf Max Level"
UIConfigLocal.LootConfirmDisenchant = "Auto confirm disenchant"
UIConfigLocal.LootEnable = "ktiviere das Beutefenster"
UIConfigLocal.LootGroupLoot = "Aktivere das Fenster für die Beute der Gruppen"
UIConfigLocal.LootIconSize = "Symbolgröße"
UIConfigLocal.LootLootFilter = "Filter die Gruppen- & Schlachtzugmitglieder Nachrichten, basierend auf den Gegenstandsqualität"
UIConfigLocal.LootWidth = "Größe des Beutefensters"

-- Minimap
UIConfigLocal.Minimap = "Minimap"
UIConfigLocal.MinimapCollectButtons = "Sammel die Minimapbuttons und zeige sie in einer Leiste an"
UIConfigLocal.MinimapEnable = "Aktiviere die Minimap & zeige sie viereckig"
UIConfigLocal.MinimapFadeButtons = "Fade addon button when collected next to minimap"
UIConfigLocal.MinimapGarrison = "Zeige das Garnisonssymbol an der Minimap"
UIConfigLocal.MinimapPing = "Zeige eine Nachricht, wenn jemand auf der Minimap 'pingt'. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"
UIConfigLocal.MinimapSize = "Größe der Minimap - Standard ist 150"

-- Sonstiges
UIConfigLocal.Misc = "Sonstiges"
UIConfigLocal.MiscAFKCamera = "Drehe die Kamera während Du AFK bist"
UIConfigLocal.MiscAlreadyKnown = "Färbe Rezepte, Reittiere & Haustiere die Du bereits kennst"
UIConfigLocal.MiscArmory = "Zeige einen Link zur Armory an, wenn Du die Einstellungen eines Einheitenfensters aufrufst"
UIConfigLocal.MiscAutoRepair = "Repariere automatisch Deine Ausrüstung beim Händler"
UIConfigLocal.MiscAutoSellGrays = "Verkaufe automatisch graue Gegenstände beim Händler"
UIConfigLocal.MiscBGSpam = "Lösche 'Boss Emote spam' während du auf dem Schlachtfeld bist"
UIConfigLocal.MiscColorPicker = "Verbesserte Farbauswahl"
UIConfigLocal.MiscEnhancedMail = "Fügt einen 'Öffne Alles' Button deinem Briefkasten hinzu."
UIConfigLocal.MiscErrors = "Filtert Nachrichten aus dem UIFehlerFenster raus."
UIConfigLocal.MiscInviteKeyword = "Schlüsselwort zum einladen (/ainv)"
UIConfigLocal.MiscItemLevel = "Zeige den Itemlevel auf Deinen Gegenständen in der Charakterübersicht an"
UIConfigLocal.MiscMoveBlizzard = "Verschiebe einige Blizzard Fenster"
UIConfigLocal.MiscSellMisc = "Automatisches Verkaufen von unnützen Gegenständen die nicht grauer Qualität sind"
UIConfigLocal.MiscSlotDurability = "Zeige die Haltbarkeit auf Deinen Gegenständen in der Charakterübersicht an"
UIConfigLocal.MiscUseGuildRepair = "Bei Benutzung von 'Automatisches Reparieren', benutzte die Gildenbank"

-- Namensplaketten
UIConfigLocal.Nameplates = "Namensplaketten"
UIConfigLocal.NameplatesAdditionalHeight = "Zusätzliche Höhe für die ausgewählte Namenplakette"
UIConfigLocal.NameplatesAdditionalWidth = "Zusätzliche Breite für die ausgewählte Namenplakette"
UIConfigLocal.NameplatesAurasSize = "Größe der Schwächungszauber"
UIConfigLocal.NameplatesBadColor = "Farbe wenn die Bedrohung NICHT ok ist, variert je nach Rolle die Du spielst ->dps/heal"
UIConfigLocal.NameplatesCastbarName = "Zeige namen des Zaubers"
UIConfigLocal.NameplatesClamp = "Clamp nameplates to the top of the screen when outside of view"
UIConfigLocal.NameplatesClassIcons = "Symbole nach Klasse im PvP"
UIConfigLocal.NameplatesCombat = "Automatisches Anzeigen der Namensplaketten im Kampf"
UIConfigLocal.NameplatesDistance = "Show nameplates for units within this range"
UIConfigLocal.NameplatesEnable = "Aktiviere die Namensplaketten"
UIConfigLocal.NameplatesEnhancedThreat = "Aktiviere das Bedrohungsfeature. Wechselt automatisch je nach Deiner Rolle"
UIConfigLocal.NameplatesGoodColor = "Farbe wenn die Bedrohung ok ist, variert je nach Rolle die Du spielst ->dps/heal"
UIConfigLocal.NameplatesHealerIcon = "Zeige Symbole über den Namensplaketten an, wenn der Spieler ein Heiler ist"
UIConfigLocal.NameplatesHealthValue = "Zeige die Lebenswerte auf den Plaketten an"
UIConfigLocal.NameplatesHeight = "Höhe der Namensplaketten"
UIConfigLocal.NameplatesNameAbbreviate = "Kürze den Namen wenn er länger als 18 Zeichen ist"
UIConfigLocal.NameplatesNearColor = "Verliere/Gewinne Bedrohungsfarbe"
UIConfigLocal.NameplatesSpiral = "Spiral on nameplate auras"
UIConfigLocal.NameplatesTimer = "Show cooldown timer on nameplate auras"
UIConfigLocal.NameplatesTrackAuras = "Zeige Schwächungszauber"
UIConfigLocal.NameplatesWidth = "Breite der Namensplaketten"

-- Pulsieren
UIConfigLocal.PulseCD = "Pulsieren"
UIConfigLocal.PulseCDAnimationScale = "Animationsskalierung"
UIConfigLocal.PulseCDEnable = "Zeige pulsierende Abklingzeiten"
UIConfigLocal.PulseCDHoldTime = "Maximal anhaltende Effektdauer"
UIConfigLocal.PulseCDSize = "Symbolgröße der pulsierende Abklingzeiten"
UIConfigLocal.PulseCDSound = "Soundwarnung"
UIConfigLocal.PulseCDThreshold = "Minimaler Schwellwert"

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
UIConfigLocal.ConfigButtonReset = "UI zurücksetzen"
UIConfigLocal.ConfigCloseButton = "Close"

-- Config Static Popups
UIConfigLocal.ConfigPerChar = "Bist Du sicher, dass Du auf 'Einstellungen für jeden Charakter einzeln' wechseln willst?"
UIConfigLocal.ConfigResetAll = "Bist Du sicher, dass Du alle Einstellungen für das |cff3c9bedKkthnxUI|r zurücksetzen willst?"
UIConfigLocal.ConfigResetChar = "Bist Du sicher, dass Du die Einstellungen für jeden Deiner Charaktere zurücksetzen willst|r?"
UIConfigLocal.ConfigSetSavedSettings = "Setze Einstellungen für jeden Charakter einzeln"

-- Skins
UIConfigLocal.Skins = "AddOn Skins"
UIConfigLocal.SkinsBigWigs = "BigWigs"
UIConfigLocal.SkinsChatBubble = "Blizzard Sprachblasen"
UIConfigLocal.SkinsDBM = "DeadlyBossMods"
UIConfigLocal.SkinsDBMMove = "Erlaube das Bewegen der DBM Leisten"
UIConfigLocal.SkinsMinimapButtons = "Minimap buttons"
UIConfigLocal.SkinsRecount = "Recount"
UIConfigLocal.SkinsSkada = "Skada"
UIConfigLocal.SkinsSpy = "Spy"
UIConfigLocal.SkinsWeakAuras = "WeakAuras"

-- Tooltip
UIConfigLocal.Tooltip = "Tooltip"
UIConfigLocal.TooltipAchievements = "Vergleiche Erfolge per Tooltip"
UIConfigLocal.TooltipCursor = "Tooltip über dem Cursor"
UIConfigLocal.TooltipEnable = "Aktiviere Tooltip"
UIConfigLocal.TooltipHealthValue = "Lebensanzeige über dem Tooltip"
UIConfigLocal.TooltipHyperLink = "Zeige den Hyperlinktooltip während du it der Maus über einen Hyperlink gehst."
UIConfigLocal.TooltipInstanceLock = "Deine Instantensperrungen im Tooltip anzeigen"
UIConfigLocal.TooltipItemCount = "Gegenstandsmenge anzeigen"
UIConfigLocal.TooltipItemIcon = "Item icon in tooltip"
UIConfigLocal.TooltipShowSpec = "Zeige die Spieler Spezialisierung und den Gegenstandlevel im Tooltip an"
UIConfigLocal.TooltipSpellID = "Zauber-ID anzeigen"

-- Einheitenfenster
UIConfigLocal.Unitframe = "Einheitenfenster"
UIConfigLocal.UnitframeCastbars = "Aktiviere die Zauberleiste"
UIConfigLocal.UnitframeCastbarSafeZoneColor = "Farbe der Spielerzauberleiste Pufferzone"
UIConfigLocal.UnitframeClassColor = "Lebensleisten in Klassenfarbe anzeigen."
UIConfigLocal.UnitframeClassPortraits = "Aktiviere die alten Klassenportraits"
UIConfigLocal.UnitframeCombatText = "Zeige KampfFeedback auf den Einheitenfenstern an"
UIConfigLocal.UnitframeEnable = "Aktiviere die Einheitenfenster"
UIConfigLocal.UnitframeFlatClassPortraits = "Aktiviere die neuen Klassenportraits"
UIConfigLocal.UnitframeFocusCastbarHeight = "Höhe der Fokus Zauberleiste"
UIConfigLocal.UnitframeFocusCastbarWidth = "breite der Fokus Zauberleiste"
UIConfigLocal.UnitframeIconPlayer = "Set player castbar icon 'LEFT OR RIGHT'"
UIConfigLocal.UnitframeIconTarget = "Set target castbar icon 'LEFT OR RIGHT'"
UIConfigLocal.UnitframeParty = "Aktiviere die Gruppenfenster."
UIConfigLocal.UnitframePlayerCastbarHeight = "Höhe der Spielerzauberleiste"
UIConfigLocal.UnitframePlayerCastbarWidth = "Breite der Spielerzauberleiste"
UIConfigLocal.UnitframePlayerDebuffsOnly = "Färbe nur Spieler Schwächungszauber"
UIConfigLocal.UnitframePortraitTimer = "Zeige Portrait Zeiten"
UIConfigLocal.UnitframePowerPredictionBar = "Power prediction bar (Zeigt die wahrscheinlichen Kosten des Zaubers in der Leiste an)"
UIConfigLocal.UnitframeScale = "Skalierung einiger Einheitenfenster."
UIConfigLocal.UnitframeShowArena = "Aktiviere die Arenafenster"
UIConfigLocal.UnitframeShowBoss = "Aktiviere die Bossfenster"
UIConfigLocal.UnitframeShowPlayer = "Zeige dich selbst in der Gruppe an"
UIConfigLocal.UnitframeStyle = "Style den Look der Einheitenfenster 'fat oder normal'"
UIConfigLocal.UnitframeTargetCastbarHeight = "Höhe der Zauberleiste des Ziels"
UIConfigLocal.UnitframeTargetCastbarWidth = "Breite der Zauberleiste des Ziels"
UIConfigLocal.UnitframeTextHealthColor = "Farbe des Lebenstextes"
UIConfigLocal.UnitframeTextNameColor = "Farbe des Namenstextes"
UIConfigLocal.UnitframeTextPowerColor = "Farbe des Powertextes"
UIConfigLocal.UnitframeThreatGlow = "Aktiviere das Bedrohungsleuchten um die Einheitenfenster"
UIConfigLocal.UnitframeThreatValue = "Visueller Bedrohungstext auf dem Spielerfenster"

-- Schlachtzug
UIConfigLocal.Raidframe = "Raid Frames"
UIConfigLocal.RaidframeAuraWatch = "Zeige die Timer für Klassenspezifische Buffs in den Ecken des Schlachtzugsfenster an"
UIConfigLocal.RaidframeAuraWatchTimers = "Zeige die Timer an den Debuff Icons die erstellt werden mit Debuff beobachten"
UIConfigLocal.RaidframeDeficitThreshold = "Heilung Schwellenwert"
UIConfigLocal.RaidframeEnable = "Aktiviere Schlachtzugsfenster"
UIConfigLocal.RaidframeHeight = "Höhe der Schlachtzugsfenster"
UIConfigLocal.RaidframeHorizontalHealthBars = "Zeige die Lebensbalken horizontal an"
UIConfigLocal.RaidframeIconSize = "Größe der Schwächungszaubersymbole auf den Schlachtzugsfenstern."
UIConfigLocal.RaidframeIndicatorSize = "Größe der Schlachtzugsfenster Indikatoren auf den Schlachtzugsfenstern."
UIConfigLocal.RaidframeMainTankFrames = "Aktiviere die Anzeige von Haupttank/assist Fenstern im Schlachtzug."
UIConfigLocal.RaidframeManabarHorizontal = "Zeige die Manaleiste horizontal an"
UIConfigLocal.RaidframeManabarShow = "Zeige die Manaleiste"
UIConfigLocal.RaidframeMaxUnitPerColumn = "Wieviele Einheitenfenster pro Schlachtzugsreihe"
UIConfigLocal.RaidframeRaidAsParty = "Zeige die Schlachtzugsfenster, anstatt der Gruppenfenster."
UIConfigLocal.RaidframeScale = "Skalierung der Schlachtzugsfenster"
UIConfigLocal.RaidframeShowMouseoverHighlight = "SHebe die Einheitenfenster per 'mouseover' hevor"
UIConfigLocal.RaidframeShowNotHereTimer = "Zeige AFK/Offline Zeit an"
UIConfigLocal.RaidframeShowResurrectText = "DZeige Wiederbelebungstext an"
UIConfigLocal.RaidframeShowRolePrefix = "Zeige Rollenpräfixe '> + -'"
UIConfigLocal.RaidframeShowThreatText = "Zeige Bedrohungstext 'AGGRO'"
UIConfigLocal.RaidframeWidth = "Breite der Schlachtzugsfenster"

-- Weltkarte
UIConfigLocal.WorldMap = "Weltkarte"
UIConfigLocal.WorldMapAlphaWhenMoving = "Alphawert der Weltkarte wenn Du Dich bewegst."
UIConfigLocal.WorldMapCoordinates = "Zeige Koordinaten auf der Weltkarte an."
UIConfigLocal.WorldMapFadeWhenMoving = "Verblassen der Weltkarte wenn Du Dich bewegst."
UIConfigLocal.WorldMapFogOfWar = "Entferne den Nebel des Krieges auf der Weltkarte."
UIConfigLocal.WorldMapSmallWorldMap = "Kleine Weltkarte anzeigen."