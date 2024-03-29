local K, C, L = unpack(select(2, ...))
local Module = K:NewModule("Miscellaneous", "AceEvent-3.0", "AceHook-3.0")

local _G = _G
local select = select

local CreateFrame = _G.CreateFrame
local GetBattlefieldStatus = _G.GetBattlefieldStatus
local GetLFGDungeonInfo = _G.GetLFGDungeonInfo
local GetLFGDungeonRewards = _G.GetLFGDungeonRewards
local GetLFGRandomDungeonInfo = _G.GetLFGRandomDungeonInfo
local GetMaxBattlefieldID = _G.GetMaxBattlefieldID
local GetNetStats = _G.GetNetStats
local GetNumRandomDungeons = _G.GetNumRandomDungeons
local GetZoneText = _G.GetZoneText
local hooksecurefunc = _G.hooksecurefunc
local PlaySound = _G.PlaySound
local SOUNDKIT = _G.SOUNDKIT

local BATTLEGROUNDS = {
	["Wintergrasp"] = true,
	["Tol Barad"] = true,
	["Isle of Conquest"] = true,
	["Strand of the Ancients"] = true,
	["Alterac Valley"] = true,
	["Warsong Gulch"] = true,
	["Twin Peaks"] = true,
	["Arathi Basin"] = true,
	["Eye of the Storm"] = true,
	["Battle for Gilneas"] = true,
	["Deepwind Gorge"] = true,
	["Silvershard Mines"] = true,
	["The Battle for Gilneas"] = true,
	["Temple of Kotmogu"] = true
}

local ERRORMESSAGES = {
	[ERR_ATTACK_MOUNTED]			= true,
	[ERR_MOUNT_ALREADYMOUNTED]		= true,
	[ERR_NOT_WHILE_MOUNTED]			= true,
	[ERR_TAXIPLAYERALREADYMOUNTED]	= true,
	[SPELL_FAILED_NOT_MOUNTED]		= true,
}

if C["General"].LagTolerance then
	local customlag = CreateFrame("Frame")
	local int = 5
	local _, _, _, lag = GetNetStats()

	local LatencyUpdate = function(_, elapsed)
		int = int - elapsed
		if int < 0 then
			if lag ~= 0 and lag <= 400 then
				if not InCombatLockdown() then
					SetCVar("SpellQueueWindow", tostring(lag))
				end
			end
			int = 5
		end
	end

	customlag:SetScript("OnUpdate", LatencyUpdate)
	LatencyUpdate(customlag, 10)
end

--[[if C["General"].AutoScale then
	local scaleBtn = CreateFrame("Button", "KkthnxUIScaleBtn", Advanced_, "UIPanelButtonTemplate")
	scaleBtn:SetSize(200, 24)
	scaleBtn:SetText(L["Miscellaneous"].KkthnxUI_Scale_Button)
	scaleBtn:SetPoint("LEFT", Advanced_UseUIScale, "LEFT", 4, -70)
	scaleBtn:SetScript("OnClick", function()
		if (not KkthnxUIConfig) then
			K.Print(L["Miscellaneous"].Config_Not_Found)
			return
		end

		if (not KkthnxUIConfigFrame) then
			KkthnxUIConfig:CreateConfigWindow()
		end

		if KkthnxUIConfigFrame:IsVisible() then
			KkthnxUIConfigFrame:Hide()
		else
			HideUIPanel(VideoOptionsFrame)
			HideUIPanel(GameMenuFrame)
			KkthnxUIConfigFrame:Show()
		end
	end)
end--]]

-- Force readycheck warning
local function ShowReadyCheckHook(_, initiator)
	if initiator ~= "player" then
		PlaySound(SOUNDKIT.READY_CHECK, "Master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

-- Force other warnings
function Module:ForceOtherWarnings(event)
	if event == "UPDATE_BATTLEFIELD_STATUS" then
		for i = 1, GetMaxBattlefieldID() do
			local status = GetBattlefieldStatus(i)
			if status == "confirm" then
				PlaySound(SOUNDKIT.UI_PET_BATTLES_PVP_THROUGH_QUEUE, "Master")
				break
			end
		end
	elseif event == "PET_BATTLE_QUEUE_PROPOSE_MATCH" then
		PlaySound(SOUNDKIT.UI_PET_BATTLES_PVP_THROUGH_QUEUE)
	elseif event == "LFG_PROPOSAL_SHOW" then
		PlaySound(SOUNDKIT.READY_CHECK, "Master")
	elseif event == "RESURRECT_REQUEST" then
		PlaySound(37, "Master")
	end
end

-- Auto select current event boss from LFD tool (EventBossAutoSelect by Nathanyel)
local firstLFD
LFDParentFrame:HookScript("OnShow", function()
	if not firstLFD then
		firstLFD = 1
		for i = 1, GetNumRandomDungeons() do
			local id = GetLFGRandomDungeonInfo(i)
			local isHoliday = select(15, GetLFGDungeonInfo(id))
			if isHoliday and not GetLFGDungeonRewards(id) then
				LFDQueueFrame_SetType(id)
			end
		end
	end
end)

-- Repoint Vehicle
function Module:VehicleSeatMover()
	local frame = CreateFrame("Frame", "KkthnxUIVehicleSeatMover", UIParent)
	frame:SetSize(120, 120)
	K.Mover(frame, "VehicleSeat", "VehicleSeat", {"BOTTOM", UIParent, -364, 4})

	hooksecurefunc(VehicleSeatIndicator, "SetPoint", function(self, _, parent)
		if parent == "MinimapCluster" or parent == MinimapCluster then
			self:ClearAllPoints()
			self:SetPoint("CENTER", frame)
			self:SetScale(0.9)
		end
	end)
end

-- Remove boss emote spam during battlegrounds (ArathiBasin SpamFix by Partha)
local RaidBossEmoteFrame, spamDisabled = RaidBossEmoteFrame
function Module:ToggleBossEmotes()
	if BATTLEGROUNDS[GetZoneText()] then
		RaidBossEmoteFrame:UnregisterEvent("RAID_BOSS_EMOTE")
		spamDisabled = true
	elseif spamDisabled then
		RaidBossEmoteFrame:RegisterEvent("RAID_BOSS_EMOTE")
		spamDisabled = false
	end
end

function Module:UI_ERROR_MESSAGE(_, ...)
	if not IsMounted() or not ERRORMESSAGES[select(2, ...)] then
		return
	end

	Dismount()
	UIErrorsFrame:Clear()
end

function Module:OnEnable()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ToggleBossEmotes")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ToggleBossEmotes")
	self:RegisterEvent("UPDATE_BATTLEFIELD_STATUS", "ForceOtherWarnings")
	self:RegisterEvent("PET_BATTLE_QUEUE_PROPOSE_MATCH", "ForceOtherWarnings")
	self:RegisterEvent("LFG_PROPOSAL_SHOW", "ForceOtherWarnings")
	self:RegisterEvent("RESURRECT_REQUEST", "ForceOtherWarnings")
	self:RegisterEvent("UI_ERROR_MESSAGE")

	self:VehicleSeatMover()
end