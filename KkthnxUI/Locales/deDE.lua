local K, _, L = unpack(select(2, ...))
-- Localization for deDE

if (GetLocale() ~= "deDE") then
	return
end

if not L then
	return
end

local _G = _G

-- Install Localization
L["Install"] = {
	Chat_Set = "Chat eingerichtet",
	CVars_Set = "CVars gesetzt",
	Step_0 = "Danke das du dein Interface mit KkthnxUI aufpeppst |cff3c9bed "..K.Name.."|r!|n|nDu wirst mit einigen wenigen Schritten durch den Installationsprozess begleitet. Bei jedem Schritt kannst Du entscheiden, ob Du die angegebenen Einstellungen übernehmen, oder überspringen möchtest.",
	Step_1 = "Der erste Schritt installiert alle wesentlichen Einstellungen des UI. Dieser Schritt wird für alle Spieler |cffff0000empfohlen|r, die das UI neu installieren. Möchtest Du nur spezielle Einstellungen ändern, klicke auf 'Weiter' um zum nächsten Schritt zu springen, bei einer Erstinstallation klicke auf 'Übernehmen'.",
	Step_2 = "Der zweite Schritt wendet die korrekten Chateinstellungen an. Dieser Schritt wird für alle Spieler |cffff0000empfohlen|r, die das UI neu installieren. Möchtest Du nur spezielle Einstellungen ändern, klicke auf 'Weiter' um zum nächsten Schritt zu springen, bei einer Erstinstallation klicke auf 'Übernehmen'.",
	Step_3 = "Installation erfolgreich abgeschlossen.|n|nBitte klicke auf 'Fertig' um Dein Interface neu zu laden.|n|nViel Spaß mit dem KkthnxUI, |cff3c9bed".. K.Name.."|r!",
	Welcome_1 = "Willkommen beim |cff4488ffKkthnxUI|r v"..K.Version.." "..K.Client..", "..string.format("|cff%02x%02x%02x%s|r", K.Color.r * 255, K.Color.g * 255, K.Color.b * 255, K.Name),
	Welcome_2 = "Tippe |cffffbb44/cfg|r in den Chat um das Konfigurationsmenü aufzurufen.",
	Welcome_3 = "Für Hilfe mit dem Interface besuche uns im Discord |cffffbb44YUmxqQm|r",

	StepTitle_0 = "WELCOME",
	StepTitle_1 = "CVARS",
	StepTitle_2 = "CHAT",
	StepTitle_3 = "COMPLETE",
}

-- StaticPopups Localization
L["StaticPopups"] = {
	BoostUI = "Deine Grafikeinstellungen werden angepasst um zu 'versuchen' mehr FPS aus deinem System rauszuholen. Willst Du Deine Einstellungen anpassen?",
	Cancel = "Du hast die Aktion abgebrochen.",
	Changes_Reload = "Es wurden ein, oder mehrere Änderungen durchgeführt, die ein Neuladen der UI erforderlich machen.",
	Config_Reload = "Es wurden ein, oder mehrere Änderungen durchgeführt, die ein Neuladen der UI erforderlich machen.",
	Delete_Grays = "Graue Gegenstände wirklich löschen?",
	Disband_Group = "Bist Du sicher, dass Du die Gruppe auflösen willst?",
	Fix_Actionbars = "Es gibt einen Fehler in Deinen Aktionsleisten, möchtest Du diesen Fehler beheben?",
	KkthnxUI_Update = "Dein KkthnxUI ist veraltet. Bitte lad dir die neuste Version von https://wow.curseforge.com/projects/kkthnxui/files.",
	Reset_UI = "Bist du sicher, dass du dieses Profil zurücksetzen möchtest?",
	Resolution_Changed = "Deine Grafikauflösung hat sich seit dem letzten zocken von World of Warcraft geändert. Es wird EMPFOHLEN das Spiel neu zu starten. Willst Du fortfahren?",
	Restart_GFX = "Ein, oder mehrere Änderungen die du vorgenommen hast, benötigen einen Neustart der Grafikengine.",
	Set_UI_Scale = "Die Automatische Skalierung deines User Interfaces anhand der Bildschirmauflösung anwenden?",
	Warning_Blizzard_AddOns = "Es scheint so als wenn ein, oder mehrere AddOns die Blizzard_CompactRaidFrames ausgeschaltet haben. Das kann unerwartete Fehler hervorrufen. Das AddOn wird umgehend wieder reaktiviert.",
	WoWHeadLink = "Wowhead Link",
}

-- Commands Localization
L["Commands"] = {
	AbandonQuests = "Alle Quest, die nicht abgeschlossen sind, werden abgebrochen!",
	BlizzardAddOnsOn = "Die folgenden AddOns werden reaktiviert: ",
	CheckQuestInfo = "\nBenutze eine auf Wowhead gefundene questID\nURL\nhttp://de.wowhead.com/quest=ID\nBeispiel: /checkquest 12045\n",
	CheckQuestComplete = " wurde abgeschlossen!",
	CheckQuestNotComplete = " wurde noch nicht abgeschlossen!",
	ConfigNotFound = "KkthnxUI_Config wurde nicht gefunden!",
	ConfigPerAccount = "Deine momentane Speichereinstellung steht auf per Charakter. Mit dieser Einstellung kannst Du den Befehl nicht nutzen!",
	FixParty = "\n|cff4488ff".."If you are still stuck in party, try the following".."|r\n\n|cff00ff001.|r Invite someone to a group and have them accept.\n|cff00ff002.|r Convert your group to a raid.\n|cff00ff003.|r Use the previous leave party command again.\n|cff00ff004.|r Invite your friend back to a group.\n\n",
	LuaErrorInfo = "|cffff0000Benutze: /luaerror on - /luaerror off|r",
	LuaErrorOff = "|cffff0000Lua errors ausgeschaltet.|r",
	Profile = "Profil ",
	ProfileDel = " Gelöscht: ",
	ProfileInfo = "\n/profile list\n/profile #\n/profile delete #\n\n",
	ProfileNotFound = "Profil nicht gefunden",
	ProfileSelection = "Schreib einen Profilnamen in den Chat, den Du mit diesem Charakter verwenden möchtest. (Beispiel: /profile Stormreaver-Kkthnx)",
	SetUIScale = "KkthnxUI kontrolliert bereits die Automaische UI Skalierung!",
	SetUIScaleSucc = "Die UI Skalierung wurde erfolgreich gesetzt auf ",
	UIHelp = "\nKkthnxUI Chatbefehle:\n\n'|cff00ff00/install|r' or '|cff00ff00/reset|r' : Installiere, oder setze KkthnxUI auf die Standardwerte zurück.\n'|cff00ff00/config|r' : Öffnet das Konfigurationsmenü.\n'|cff00ff00/moveui|r' : UI Fenster bewegen.\n'|cff00ff00/testui|r' : Test der Einheitenfenster.\n'|cff00ff00/profile|r' : Kopiere KkthnxUI Einstellungen von einem anderen (muss existieren) Charakter.\n'|cff00ff00/killquests|r' : Lösche alle nicht abgeschlossenen Quests.\n'|cff00ff00/clearcombat|r' : Lösche alle CombatLog Einträge.\n'|cff00ff00/setscale|r' : Setzt die UI auf Pixel Perfekt.\n'|cff00ff00/rd|r' : Löst deine Schlachtzugsgruppe auf.\n'|cff00ff00/clearchat|r' : Löscht alle Einträge in deinem Chatfenster.\n'|cff00ff00/checkquest|r' : Überprüfe ob eine bestimmte Quest abgelossen hast.\n",
}

-- ActionBars Localization
L["Actionbars"] = {
	All_Binds_Cleared = "Alle Tastaturbelegungen gelöscht für",
	All_Binds_Discarded = "Alle Tastaturbelegungen wurden verworfen.",
	All_Binds_Saved = "Alle Tastaturbelegungen wurden gespeichert.",
	Binding = "Tastaturbelegung",
	Fix_Actionbars = "Es gibt einen Fehler in Deinen Aktionsleisten, möchtest Du diesen Fehler korregieren?",
	Key = "Taste",
	Keybind_Mode = "Fahre mit der Maus über einen Aktionsbutton um ihn mit einer Taste zu belegen. Drücke dann die gewünschte Tastenkombination, eine Einzeltaste, oder drücke die rechte Mautaste um die aktuelle Belegung zu löschen.",
	Locked = "Aktionsleisten sind jetzt |CFFFF0000gesperrt|r",
	No_Bindings_Set = "Keine Tastaturbelegung vorhanden",
	Trigger = "Auslöser",
	Unlocked = "Aktionsleisten sind jetzt |CFF008000entsperrt|r",
}

-- AFKCam Localization
L["AFKCam"] = {
	NoGuild = "Keine Gilde",
}

-- AddOnsData Localization
L["AddOnData"] = {
	AllAddOnsText = "Alle unterstützten Addon Profile wurden geladen, wenn das zugehörige Addon geladen wurde!",
	InfoText = "|cffffff00Die folgenden Befehle werden für Addon Profile unterstützt.|r\n\n|cff00ff00/settings dbm|r, um die Einstellungen anzuwenden |cff00ff00DeadlyBossMods.|r\n|cff00ff00/settings msbt|r, um die Einstellungen anzuwenden |cff00ff00MikScrollingBattleText.|r\n|cff00ff00/settings skada|r, um die Einstellungen anzuwenden |cff00ff00Skada.|r\n|cff00ff00/settings bt4 or bartender|r, um die Einstellungen anzuwenden |cff00ff00Bartender4.|r\n|cff00ff00/settings buggrabber|r, um die Einstellungen anzuwenden |cff00ff00!BugGrabber.|r\n|cff00ff00/settings bugsack|r, um die Einstellungen anzuwenden |cff00ff00BugSack.|r\n|cff00ff00/settings bugsack|r, um die Einstellungen anzuwenden |cff00ff00BugSack.|r\n|cff00ff00/settings pawn|r, um die Einstellungen anzuwenden |cff00ff00Pawn.|r\n|cff00ff00/settings bigwigs|r, um die Einstellungen anzuwenden |cff00ff00BigWigs.|r\n|cff00ff00/settings all|r, um die Einstellungen für alle unterstützten Addons anzuwenden, wenn diese geladen sind!\n\n",
	BigWigsText = "|cffffff00".."BigWigs Profil wurde geladen".."|r",
	BigWigsNotText = "|CFFFF0000Das AddOn BigWigs wurde nicht geladen!|r",
	BartenderText = "|cffffff00".."Bartender4 Profil wurde geladen".."|r",
	BartenderNotText = "|CFFFF0000Das AddOn Bartender4 wurde nicht geladen!|r",
	BugGrabberText = "|cffffff00".."BugGrabber Profil wurde geladen".."|r",
	BugGrabberNotText = "|CFFFF0000Das AddOn !BugGrabber wurde nicht geladen!|r",
	BugSackText = "|cffffff00".."BugSack Profil wurde geladen".."|r",
	BugSackNotText = "|CFFFF0000Das AddOn BugSack wurde nicht geladen!|r",
	DBMText = "|cffffff00".."DBM Profil wurde geladen".."|r",
	DBMNotText = "|CFFFF0000Das AddOn DeadlyBossMods wurde nicht geladen!|r",
	MSBTText = "|cffffff00".."MikScrollingBattleText Profil wurde geladen".."|r",
	MSBTNotText = "|CFFFF0000Das AddOn MikScrollingBattleText wurde nicht geladen!|r",
	PawnText = "|cffffff00".."Pawn Profil wurde geladen".."|r",
	PawnNotText ="|CFFFF0000Das AddOn Pawn wurde nicht geladen!|r",
	SkadaText = "|cffffff00".."Skada Profil wurde geladen".."|r",
	SkadaNotText = "|CFFFF0000Das AddOn Skada wurde nicht geladen!|r",
	SkinnerText = "|cffffff00".."Skinner Profil wurde geladen".."|r",
	SkinnerNotText = "|CFFFF0000Das AddOn Skinner wurde nicht geladen!|r",
}

-- Announcements Localization
L["Announcements"] = {
	Pull_Aborted = "Pull ABGEBROCHEN!",
	Pulling = "Pulle %s in %s..",
	Sapped = "Kopfnuß!",
	Sapped_By = "Kopfnuß von: ",
}

-- Auras Localization
L["Auras"] = {

}

-- Automation Localization
L["Automation"] = {
	DuelCanceled_Pet = "Begleiterduellanfrage von %s wurde abgelehnt.",
	DuelCanceled_Regular = "Duellanfrage von %s wurde abgelehnt.",
	MovieBlocked = "Du hast diese Zwischensequenz bereits gesehen, Film abgebrochen.",
	Subzone_Eastern_Transept = "Östliches Transept",
	Subzone_Grand_Bazaar = "Der Große Basar",
	Subzone_Port_of_Zandalar = "Der Hafen von Zandalar",
}

-- Blizzard Localization
L["Blizzard"] = {
	Disband_Group = "Gruppe auflösen",
	No_Errors = "Bis jetzt keine Fehler gefunden. Yeah!",
	Raid_Menu = "Raidmenü",
}

-- Chat Localization
L["Chat"] = {
	AFK = "AFK",
	DND = "DND",
	Invaild_Target = "Ungültiges Ziel",
	-- Channel Names
	General = "Allgemein",
	LocalDefense = "LokaleVerteidigung",
	LookingForGroup = "SucheNachGruppe",
	Trade = "Handel",
	WorldDefense = "WeltVerteidigung",
}

-- Configbutton Localization
L["ConfigButton"] = {
	Changelog = "UI Änderungen",
	CopyChat = "Chat kopieren",
	Emotions = "Emotionsmenü",
	Functions = "Funktionen",
	Install = "Installation",
	LeftClick = "Linksklick:",
	MiddleClick = "Mittelklick:",
	MoveUI = "UI Elemente verschieben",
	ProfileList = "Profile auflisten",
	Right_Click = "Rechtsklick:",
	Roll = "Würfeln 1-100. Du gewinnst!",
	ToggleConfig = "Konfigurationsmenü",
	UIHelp = "UI Hilfe",
}

-- Databars Localization
L["Databars"] = {
	AP = "AM:",
	Bars = "Leisten",
	Current_Level = "Momentanes Level:",
	Experience = "Erfahrung",
	Honor_Remaining = "Ehre Verbleibend:",
	Honor_XP = "Ehre XP:",
	Remaining = "Verbleibend:",
	Rested = "Ausgeruht:",
	Share = "Teile deine Erfahrungspunktestand mit anderen in der Gruppe.",
	Toggle_PvP = "Zeigt/Schließt das PvP UI",
	Toggle_Reputation = "Zeigt/Schließt das Ruf UI",
	XP = "XP:",
}

-- Datatext Localization
L["DataText"] = {
	BaseAssault = "Stützpunkte angegriffen:",
	BaseDefend = "Stützpunkte verteidigt:",
	CallToArms = "Ruf zu den Waffen",
	CartControl = "Loren kontrolliert:",
	ControlBy = "Kontrolliert von:",
	Damage = "Schaden: ",
	DamageDone = "Schaden verursacht:",
	Death = "Tode:",
	DemolisherDestroy = "Verwüster zerstört:",
	FlagsCaptured = "Flaggen eingenommen:",
	FlagsReturned = "Flaggen zurückgebracht:",
	GatesDestroyed = "Tore zerstört:",
	GraveyardsAssaulted = "Friedhöfe angegriffen:",
	GraveyardsDefended = "Friedhöfe verteidigt:",
	Healing = "Heilung: ",
	HealingDone = "Heilung verursacht:",
	Honor = "Ehre: ",
	HonorableKill = "Ehrenvolle Tötungen:",
	HonorGained = "Ehre erhalten:",
	KillingBlow = "Todesstöße: ",
	OrbPossessions = "Kugel in Besitz:",
	StatsFor = "Stats für ",
	TowersAssaulted = "Türme angegriffen:",
	TowersDefended = "Türme verteidigt:",
	VictoryPoints = "Siegpunkte:",
}

-- Inventory Localization
L["Inventory"] = {
	Artifact_Count = "Anzahl: ",
	Artifact_Use = "Rechtsklick zum Benutzen",
	Bank = "Zeige Bankfächer",
	-- Buttons_Artifact = "Rechtsklick um die Artefaktmacht in den Taschen zu benutzen",
	Buttons_Sort = "Linksklick: Sortieren |nRechtsklick: Blizzard Sortierung",
	Buttons_Stack = "Gegenstände stapeln",
	Cant_Buy_Slot = "Es können keine weiteren Taschenplätze gekauft werden!",
	GuildRepair = "Deine Gegenstände wurden durch die Gildenbank repariert für: ",
	NotatVendor = "Du must bei einem Verkäufer sein.",
	NotEnoughMoney = "Du hast nicht genug Gold um Deine Ausrüstung zu reparieren!",
	Purchase_Slot = "Taschenplätze kaufen",
	Reagents = "Zeige Reagenzienfächer",
	RepairCost = "Gegenstände repariert für: ",
	Right_Click_Search = "Rechtsklick zum Suchen",
	Shift_Move = "Shift Taste halten + Ziehen",
	Show_Bags = "Taschen anzeigen/verstecken",
	SoldTrash = "Graue Gegenstände verkauft für: ",
	VendorGrays = "Händler - Graue Items",
}

-- Loot Localization
L["Loot"] = {
	Empty_Slot = "Leerer Platz",
	Fishy_Loot = "Komische Beute",
}

-- Maps Localization
L["Maps"] = {
	DisableToHide = "Deaktiviert, werden die Gebiete verdeckt, die du noch nicht erkundet hast.",
	EnableToShow = "Aktviert, werden die Gebiete angezeigt, die du noch nicht erkundet hast.",
	HideUnDiscovered = "Verstecke unentdeckte Gebiete",
	PressToCopy = "|nDrücke <STRG/C> zum Kopieren.",
	Reveal = "Aufdecken",
	RevealHidden = "Deckt versteckte Gebiete auf",
	RareFound = "Rare nearby! ",
	TomTom = "Aktiviere das AddOn TomTom um die Funktion nutzen zu können. Du kannst TomTom bei Curse runterladen.",
}

-- Miscellaneous Localization
L["Miscellaneous"] = {
	Config_Not_Found = "KkthnxUI_Config wurde nicht gefunden!",
	Copper_Short = "|cffeda55fc|r",
	Gold_Short = "|cffffd700g|r",
	KkthnxUI_Scale_Button = "KkthnxUI Skalierungskonfiguration",
	Repair = "Warnung! Deine Ausrüstung muss so schnell wie möglich repariert werden!",
	Silver_Short = "|cffc7c7cfs|r",
	UIOutdated = "Your version of KkthnxUI v"..K.Version.." is out of date.",
}

-- Nameplates Localization
L["Nameplates"] = {

}

-- Panels Localization
L["Panels"] = {

}

-- Quests Localization
L["Quests"] = {

}

-- RaidCooldown
L["RaidCooldown"] = {
	Cooldown = "Abklingzeit: ",
	Combatress = "Battlerezz",
	Combatress_Remainder = "Battlerezz übrig: ",
	Nexttime = "Nächste Möglichkeit: ",
}

-- Skins Localization
L["Skins"] = {
	Skada_Reset = "Möchtest Du Skada zurück setzen?",
}

-- Tooltip Localization
L["Tooltip"] = {
	Bank = "Bank",
	Count = "Anzahl",
	TargetedBy = "Targeted By:",
}

-- UnitFrames Localization
L["Unitframes"] = {
	Dead = "Tot",
	Ghost = "Geist",
}

-- Config Localization
L["Config"] = {
	CharSettings = "Einstellungen per Char",
	ConfigNotFound = "Konfiguration nicht gefunden!",
	GlobalSettings = "Einstellungen Global",
	ResetChat = "Chat zurücksetzen",
	ResetCVars = "CVars zurücksetzen",
}