local K, C = unpack(select(2, ...))
if C["DataText"].Time ~= true then
	return
end

local _G = _G
local date = _G.date
local ipairs = _G.ipairs
local math_floor = _G.math.floor
local mod = _G.mod
local next = _G.next
local select = _G.select
local string_format = _G.string.format
local string_join = _G.string.join
local string_utf8sub = _G.string.utf8sub
local table_sort, table_insert = _G.table.sort, _G.table.insert
local unpack = _G.unpack
local pairs = _G.pairs

local C_AreaPoiInfo_GetAreaPOITimeLeft = _G.C_AreaPoiInfo.GetAreaPOITimeLeft
local C_Map_GetMapInfo = _G.C_Map.GetMapInfo
local DUNGEON_FLOOR_TEMPESTKEEP1 = _G.DUNGEON_FLOOR_TEMPESTKEEP1
local EJ_GetCurrentTier = _G.EJ_GetCurrentTier
local EJ_GetInstanceByIndex = _G.EJ_GetInstanceByIndex
local EJ_GetNumTiers = _G.EJ_GetNumTiers
local EJ_SelectTier = _G.EJ_SelectTier
local GameTooltip = _G.GameTooltip
local GetAchievementInfo = _G.GetAchievementInfo
local GetDifficultyInfo = _G.GetDifficultyInfo
local GetGameTime = _G.GetGameTime
local GetNumSavedInstances = _G.GetNumSavedInstances
local GetNumSavedWorldBosses = _G.GetNumSavedWorldBosses
local GetNumWorldPVPAreas = _G.GetNumWorldPVPAreas
local GetSavedInstanceInfo = _G.GetSavedInstanceInfo
local GetSavedWorldBossInfo = _G.GetSavedWorldBossInfo
local GetWorldPVPAreaInfo = _G.GetWorldPVPAreaInfo
local QUEUE_TIME_UNAVAILABLE = _G.QUEUE_TIME_UNAVAILABLE
local RequestRaidInfo = _G.RequestRaidInfo
local SecondsToTime = _G.SecondsToTime
local TempestKeep = select(2, GetAchievementInfo(1088)):match("%((.-)%)$")
local TIMEMANAGER_TOOLTIP_LOCALTIME = _G.TIMEMANAGER_TOOLTIP_LOCALTIME
local TIMEMANAGER_TOOLTIP_REALMTIME = _G.TIMEMANAGER_TOOLTIP_REALMTIME
local VOICE_CHAT_BATTLEGROUND = _G.VOICE_CHAT_BATTLEGROUND
local WINTERGRASP_IN_PROGRESS = _G.WINTERGRASP_IN_PROGRESS

-- GLOBALS: GameTimeFrame

local NameColor = K.RGBToHex(K.Color.r, K.Color.g, K.Color.b)
local ValueColor = K.RGBToHex(1, 1, 1)
local DataTextTimeFont = K.GetFont(C["UIFonts"].DataTextFonts)

local DataTextTime = CreateFrame("Frame")
DataTextTime.Text = Minimap:CreateFontString(nil, "OVERLAY")
DataTextTime.Text:SetFontObject(DataTextTimeFont)
DataTextTime.Text:SetFont(select(1, DataTextTime.Text:GetFont()), 13, select(3, DataTextTime.Text:GetFont()))
DataTextTime.Text:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 2)
DataTextTime:SetAllPoints(DataTextTime.Text)

local WORLD_BOSSES_TEXT = _G.RAID_INFO_WORLD_BOSS.."(s)"
local APM = {_G.TIMEMANAGER_PM, _G.TIMEMANAGER_AM}
local europeDisplayFormat = "%s%02d|r:%s%02d|r"
local ukDisplayFormat = "%s%d|r:%s%02d|r %s%s|r"
local europeDisplayFormat_nocolor = string_join("", "%02d", ":|r%02d")
local ukDisplayFormat_nocolor = string_join("", "", "%d", ":|r%02d", " %s|r")
local lockoutInfoFormat = "%s%s %s |cffaaaaaa(%s, %s/%s)"
local lockoutInfoFormatNoEnc = "%s%s %s |cffaaaaaa(%s)"
local formatBattleGroundInfo = "%s: "
local lockoutColorExtended, lockoutColorNormal = {r = 0.3, g = 1, b = 0.3}, {r = .8,g = .8,b = .8}
local curHr, curMin, curAmPm
local enteredFrame = false
local localizedName, isActive, startTime, canEnter, _

local function ConvertTime(h, m)
	local AmPm
	if C["DataText"].Time24Hr == true then
		return h, m, -1
	else
		if h >= 12 then
			if h > 12 then h = h - 12 end
			AmPm = 1
		else
			if h == 0 then h = 12 end
			AmPm = 2
		end
	end
	return h, m, AmPm
end

local function CalculateTimeValues(tooltip)
	if (tooltip and C["DataText"].LocalTime) or (not tooltip and not C["DataText"].LocalTime) then
		return ConvertTime(GetGameTime())
	else
		local dateTable = date("*t")
		return ConvertTime(dateTable["hour"], dateTable["min"])
	end
end

local function OnClick()
	GameTimeFrame:Click()
end

local function OnLeave()
	GameTooltip:Hide()
	enteredFrame = false
end

local instanceIconByName = {}
local function GetInstanceImages(index, raid)
	local instanceID, name, _, _, buttonImage = EJ_GetInstanceByIndex(index, raid)
	while instanceID do
		if name == DUNGEON_FLOOR_TEMPESTKEEP1 then
			instanceIconByName[TempestKeep] = buttonImage
		else
			instanceIconByName[name] = buttonImage
		end
		index = index + 1
		instanceID, name, _, _, buttonImage = EJ_GetInstanceByIndex(index, raid)
	end
end

local locale = _G.GetLocale()
local krcntw = locale == "koKR" or locale == "zhCN" or locale == "zhTW"
local nhm = { -- Raid Finder, Normal, Heroic, Mythic
	(krcntw and PLAYER_DIFFICULTY3) or string_utf8sub(PLAYER_DIFFICULTY3, 1, 1), -- R
	(krcntw and PLAYER_DIFFICULTY1) or string_utf8sub(PLAYER_DIFFICULTY1, 1, 1), -- N
	(krcntw and PLAYER_DIFFICULTY2) or string_utf8sub(PLAYER_DIFFICULTY2, 1, 1), -- H
	(krcntw and PLAYER_DIFFICULTY6) or string_utf8sub(PLAYER_DIFFICULTY6, 1, 1) -- M
}

-- Check Invasion Status
local region = _G.GetCVar("portal")
local legionZoneTime = {
	["CN"] = 1546844400, -- CN time 1/7/2019 15:00 [1]
	["EU"] = 1546786800, -- CN-16
	["US"] = 1546815600, -- CN-8
}

local bfaZoneTime = {
	["CN"] = 1546743600, -- CN time 1/6/2019 11:00 [1]
	["EU"] = 1546768800, -- CN+7
	["US"] = 1546769340, -- CN+16
}

local invIndex = {
	[1] = {title = "Legion Invasion", duration = 66600, maps = {630, 641, 650, 634}, timeTable = {4, 3, 2, 1, 4, 2, 3, 1, 2, 4, 1, 3}, baseTime = legionZoneTime[region] or 1546844400}, -- 1/7/2019 15:00 [1]
	[2] = {title = "BFA Invasion", duration = 68400, maps = {862, 863, 864, 896, 942, 895}, timeTable = {4, 1, 6, 2, 5, 3}, baseTime = bfaZoneTime[region] or 1546743600},
}

local mapAreaPoiIDs = {
	[630] = 5175,
	[641] = 5210,
	[650] = 5177,
	[634] = 5178,
	[862] = 5973,
	[863] = 5969,
	[864] = 5970,
	[896] = 5964,
	[942] = 5966,
	[895] = 5896,
}

local function getInvasionInfo(mapID)
	local areaPoiID = mapAreaPoiIDs[mapID]
	local seconds = C_AreaPoiInfo_GetAreaPOITimeLeft(areaPoiID)
	local mapInfo = C_Map_GetMapInfo(mapID)
	return seconds, mapInfo.name
end

local function CheckInvasion(index)
	for _, mapID in pairs(invIndex[index].maps) do
		local timeLeft, name = getInvasionInfo(mapID)
		if timeLeft and timeLeft > 0 then
			return timeLeft, name
		end
	end
end

local function GetNextTime(baseTime, index)
	local currentTime = _G.time()
	local duration = invIndex[index].duration
	local elapsed = mod(currentTime - baseTime, duration)
	return duration - elapsed + currentTime
end

local function GetNextLocation(nextTime, index)
	local inv = invIndex[index]
	local count = #inv.timeTable
	local elapsed = nextTime - inv.baseTime
	local round = mod(math_floor(elapsed / inv.duration) + 1, count)
	if round == 0 then
		round = count
	end

	return C_Map_GetMapInfo(inv.maps[inv.timeTable[round]]).name
end

local collectedInstanceImages = false
local function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:SetPoint(K.GetAnchors(self))
	GameTooltip:ClearLines()

	if (not enteredFrame) then
		enteredFrame = true
		RequestRaidInfo()
	end

	if not collectedInstanceImages then
		local numTiers = (EJ_GetNumTiers() or 0)
		if numTiers > 0 then
			local currentTier = EJ_GetCurrentTier()
			-- Loop through the expansions to collect the textures
			for i = 1, numTiers do
				EJ_SelectTier(i)
				GetInstanceImages(1, false) -- Populate for dungeon icons
				GetInstanceImages(1, true) -- Populate for raid icons
			end
			-- Set it back to the previous tier
			if currentTier then
				EJ_SelectTier(currentTier)
			end
			collectedInstanceImages = true
		end
	end

	local addedHeader = false
	for i = 1, GetNumWorldPVPAreas() do
		_, localizedName, isActive, _, startTime, canEnter = GetWorldPVPAreaInfo(i)
		if canEnter then
			if not addedHeader then
				GameTooltip:AddLine(VOICE_CHAT_BATTLEGROUND)
				addedHeader = true
			end
			if isActive then
				startTime = WINTERGRASP_IN_PROGRESS
			elseif startTime == nil then
				startTime = QUEUE_TIME_UNAVAILABLE
			else
				startTime = SecondsToTime(startTime, false, nil, 3)
			end
			GameTooltip:AddDoubleLine(string_format(formatBattleGroundInfo, localizedName), startTime, 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
		end
	end

	local lockedInstances = {raids = {}, dungeons = {}}
	local name, reset, extended, maxPlayers, numEncounters, encounterProgress, difficultyLetter, buttonImg, sortName, difficulty, locked, isRaid, isLFR, isHeroicOrMythic, isHeroic, displayHeroic, displayMythic, lockoutColor

	for i = 1, GetNumSavedInstances() do
		name, _, _, difficulty, locked, extended, _, isRaid = GetSavedInstanceInfo(i)
		if (locked or extended) and name then
			isLFR, isHeroicOrMythic = (difficulty == 7 or difficulty == 17), (difficulty == 2 or difficulty == 23)
			_, _, isHeroic, _, displayHeroic, displayMythic = GetDifficultyInfo(difficulty)
			sortName = name .. (displayMythic and 4 or (isHeroic or displayHeroic) and 3 or isLFR and 1 or 2)
			difficultyLetter = (displayMythic and nhm[4] or (isHeroic or displayHeroic) and nhm[3] or isLFR and nhm[1] or nhm[2])
			buttonImg = instanceIconByName[name] and string_format("|T%s:16:16:0:0:96:96:0:64:0:64|t ", instanceIconByName[name]) or ""

			if isRaid then
				table_insert(lockedInstances["raids"], {sortName, difficultyLetter, buttonImg, {GetSavedInstanceInfo(i)}})
			elseif not isRaid and isHeroicOrMythic then
				table_insert(lockedInstances["dungeons"], {sortName, difficultyLetter, buttonImg, {GetSavedInstanceInfo(i)}})
			end
		end
	end

	if next(lockedInstances["raids"]) then
		if GameTooltip:NumLines() > 0 then
			GameTooltip:AddLine(" ")
		end
		GameTooltip:AddLine("Saved Raid(s)")

		table_sort(lockedInstances["raids"], function(a, b)
			return a[1] < b[1]
		end)

		for i = 1, #lockedInstances["raids"] do
			difficultyLetter = lockedInstances["raids"][i][2]
			buttonImg = lockedInstances["raids"][i][3]
			name, _, reset, _, _, extended, _, _, maxPlayers, _, numEncounters, encounterProgress = unpack(lockedInstances["raids"][i][4])

			lockoutColor = extended and lockoutColorExtended or lockoutColorNormal
			if (numEncounters and numEncounters > 0) and (encounterProgress and encounterProgress > 0) then
				GameTooltip:AddDoubleLine(string_format(lockoutInfoFormat, buttonImg, maxPlayers, difficultyLetter, name, encounterProgress, numEncounters), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			else
				GameTooltip:AddDoubleLine(string_format(lockoutInfoFormatNoEnc, buttonImg, maxPlayers, difficultyLetter, name), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			end
		end
	end

	if next(lockedInstances["dungeons"]) then
		if GameTooltip:NumLines() > 0 then
			GameTooltip:AddLine(" ")
		end
		GameTooltip:AddLine("Saved Dungeon(s)")

		table_sort(lockedInstances["dungeons"], function(a, b)
			return a[1] < b[1]
		end)

		for i = 1, #lockedInstances["dungeons"] do
			difficultyLetter = lockedInstances["dungeons"][i][2]
			buttonImg = lockedInstances["dungeons"][i][3]
			name, _, reset, _, _, extended, _, _, maxPlayers, _, numEncounters, encounterProgress = unpack(lockedInstances["dungeons"][i][4])

			lockoutColor = extended and lockoutColorExtended or lockoutColorNormal
			if (numEncounters and numEncounters > 0) and (encounterProgress and encounterProgress > 0) then
				GameTooltip:AddDoubleLine(string_format(lockoutInfoFormat, buttonImg, maxPlayers, difficultyLetter, name, encounterProgress, numEncounters), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			else
				GameTooltip:AddDoubleLine(string_format(lockoutInfoFormatNoEnc, buttonImg, maxPlayers, difficultyLetter, name), SecondsToTime(reset, false, nil, 3), 1, 1, 1, lockoutColor.r, lockoutColor.g, lockoutColor.b)
			end
		end
	end

	local addedLine = false
	local worldbossLockoutList = {}
	for i = 1, GetNumSavedWorldBosses() do
		name, _, reset = GetSavedWorldBossInfo(i)
		table_insert(worldbossLockoutList, {name, reset})
	end

	table_sort(worldbossLockoutList, function(a, b)
		return a[1] < b[1]
	end)

	for i = 1,#worldbossLockoutList do
		name, reset = unpack(worldbossLockoutList[i])
		if (reset) then
			if (not addedLine) then
				if GameTooltip:NumLines() > 0 then
					GameTooltip:AddLine(" ")
				end
				GameTooltip:AddLine(WORLD_BOSSES_TEXT)
				addedLine = true
			end
			GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1, 1, 1, 0.8, 0.8, 0.8)
		end
	end

	local Hr, Min, AmPm = CalculateTimeValues(true)
	if GameTooltip:NumLines() > 0 then
		GameTooltip:AddLine(" ")
	end

	if AmPm == -1 then
		GameTooltip:AddDoubleLine(C["DataText"].LocalTime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME,
		string_format(europeDisplayFormat_nocolor, Hr, Min), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	else
		GameTooltip:AddDoubleLine(C["DataText"].LocalTime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME,
		string_format(ukDisplayFormat_nocolor, Hr, Min, APM[AmPm]), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	end

	-- Invasions
	for index, value in ipairs(invIndex) do
		local r, g, b
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(value.title..":")
		local timeLeft, zoneName = CheckInvasion(index)
		local nextTime = GetNextTime(value.baseTime, index)
		if timeLeft then
			timeLeft = timeLeft / 60
			if timeLeft < 60 then
				r, g, b = 1, 0, 0
			else
				r, g, b = 0, 1, 0
			end
			GameTooltip:AddDoubleLine("Current "..zoneName, string_format("%.2d:%.2d", timeLeft / 60, timeLeft % 60), 1, 1, 1, r, g, b)
		end
		GameTooltip:AddDoubleLine("Next "..GetNextLocation(nextTime, index), date("%m/%d %H:%M", nextTime), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	end

	GameTooltip:Show()
end

local function OnEvent(self, event)
	if event == "UPDATE_INSTANCE_INFO" and enteredFrame then
		OnEnter(self)
	end
end

local int = 3
function Update(self, t)
	int = int - t

	if int > 0 then
		return
	end

	if GameTimeFrame.flashInvite then
		K.Flash(self, 0.53, true)
	else
		K.StopFlash(self)
	end

	if enteredFrame then
		OnEnter(self)
	end

	local Hr, Min, AmPm = CalculateTimeValues(false)

	-- no update quick exit
	if (Hr == curHr and Min == curMin and AmPm == curAmPm) and not (int < -15000) then
		int = 5
		return
	end

	curHr = Hr
	curMin = Min
	curAmPm = AmPm

	if AmPm == -1 then
		DataTextTime.Text:SetFormattedText(europeDisplayFormat, ValueColor, Hr, ValueColor, Min)
	else
		DataTextTime.Text:SetFormattedText(ukDisplayFormat, ValueColor, Hr, ValueColor, Min, NameColor, APM[AmPm])
	end

	int = 5
end

local function DelayDataTextTime()
	DataTextTime:RegisterEvent("UPDATE_INSTANCE_INFO")
	DataTextTime:SetScript("OnEvent", OnEvent)
	DataTextTime:SetScript("OnMouseDown", OnClick)
	DataTextTime:SetScript("OnUpdate", Update)
	DataTextTime:SetScript("OnEnter", OnEnter)
	DataTextTime:SetScript("OnLeave", OnLeave)
end

C_Timer.After(0.6, function()
	DelayDataTextTime()
end)