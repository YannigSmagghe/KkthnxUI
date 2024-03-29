local K, C = unpack(select(2, ...))
local Module = K:NewModule("Minimap", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

local _G = _G
local string_sub = string.sub

local C_Timer_After = _G.C_Timer.After
local CreateFrame = _G.CreateFrame
local GameTimeFrame = _G.GameTimeFrame
local GarrisonLandingPageMinimapButton = _G.GarrisonLandingPageMinimapButton
local GetMinimapZoneText = _G.GetMinimapZoneText
local GetZonePVPInfo = _G.GetZonePVPInfo
local GuildInstanceDifficulty = _G.GuildInstanceDifficulty
local hooksecurefunc = _G.hooksecurefunc
local InCombatLockdown = _G.InCombatLockdown
local Minimap = _G.Minimap
local MiniMapChallengeMode = _G.MiniMapChallengeMode
local MiniMapInstanceDifficulty = _G.MiniMapInstanceDifficulty
local MiniMapMailFrame = _G.MiniMapMailFrame
local QueueStatusMinimapButton = _G.QueueStatusMinimapButton
local UIParent = _G.UIParent

function Module:GetLocationTextColors()
	local pvpType = GetZonePVPInfo()
	if pvpType == "arena" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "friendly" then
		return 0.05, 0.85, 0.03
	elseif pvpType == "contested" then
		return 0.9, 0.85, 0.05
	elseif pvpType == "hostile" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "sanctuary" then
		return 0.035, 0.58, 0.84
	elseif pvpType == "combat" then
		return 0.84, 0.03, 0.03
	else
		return 0.9, 0.85, 0.05
	end
end

function Module:OnMouseWheelScroll(d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end

function Module:ZoneTextUpdate()
	if not C["Minimap"].Enable then
		return
	end

	Minimap.Location:SetText(string_sub(GetMinimapZoneText(), 1, 46))
	Minimap.Location:SetTextColor(Module:GetLocationTextColors())
	Minimap.Location:FontTemplate(nil, 13)
end

local function PositionTicketButtons()
	HelpOpenTicketButton:ClearAllPoints()
	HelpOpenTicketButton:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, 0)
	HelpOpenWebTicketButton:ClearAllPoints()
	HelpOpenWebTicketButton:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, 0)
end

local isResetting
local function ResetZoom()
	Minimap:SetZoom(0)
	MinimapZoomIn:Enable() -- Reset enabled state of buttons
	MinimapZoomOut:Disable()
	isResetting = false
end

local function SetupZoomReset()
	if C["Minimap"].ResetZoom and not isResetting then
		isResetting = true
		C_Timer_After(C["Minimap"].ResetZoomTime, ResetZoom)
	end
end
hooksecurefunc(Minimap, "SetZoom", SetupZoomReset)

function Module:UpdateSettings()
	if InCombatLockdown() then
		return self:RegisterEvent("PLAYER_REGEN_ENABLED", "OnEvent")
	end

	local SetMinimapSize = C["Minimap"].Enable and C["Minimap"].Size or 170

	if C["Minimap"].Enable then
		Minimap:SetSize(SetMinimapSize, SetMinimapSize)
	end

	local MinimapFrameHolder = _G.MinimapFrameHolder
	if MinimapFrameHolder then
		MinimapFrameHolder:SetWidth(Minimap:GetWidth())
	end

	if Minimap.Location then
		Minimap.Location:SetWidth(SetMinimapSize)
		Minimap.Location:Hide()
	end

	-- Stop here if KkthnxUI Minimap is disabled.
	if not C["Minimap"].Enable then
		return
	end

	if GarrisonLandingPageMinimapButton then
		if not C["Minimap"].GarrisonLandingPage then
			-- ugly hack to keep the keybind functioning
			GarrisonLandingPageMinimapButton:SetParent(K.UIFrameHider)
			GarrisonLandingPageMinimapButton:UnregisterAllEvents()
			GarrisonLandingPageMinimapButton:Show()
			GarrisonLandingPageMinimapButton.Hide = GarrisonLandingPageMinimapButton.Show
		else
			GarrisonLandingPageMinimapButton:ClearAllPoints()
			GarrisonLandingPageMinimapButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 0, 0)
			GarrisonLandingPageMinimapButton:SetScale(0.8)
			if GarrisonLandingPageTutorialBox then
				GarrisonLandingPageTutorialBox:SetScale(0.8)
				GarrisonLandingPageTutorialBox:SetClampedToScreen(true)
			end
		end
	end

	if GameTimeFrame then
		if not C["Minimap"].Calendar then
			GameTimeFrame:Hide()
		else
			GameTimeFrame:SetParent(Minimap)
			GameTimeFrame:SetScale(0.6)
			GameTimeFrame:ClearAllPoints()
			GameTimeFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -3, -3)
			GameTimeFrame:SetHitRectInsets(0, 0, 0, 0)
			GameTimeFrame:GetNormalTexture():SetTexCoord(0, 1, 0, 1)
			GameTimeFrame:SetNormalTexture("Interface\\Addons\\KkthnxUI\\Media\\Textures\\Calendar.blp")
			GameTimeFrame:SetPushedTexture(nil)
			GameTimeFrame:SetHighlightTexture(nil)

			local GameTimeFont = GameTimeFrame:GetFontString()
			GameTimeFont:ClearAllPoints()
			GameTimeFont:SetPoint("CENTER", 0, -6)
			GameTimeFont:SetFontObject("KkthnxUIFont")
			GameTimeFont:SetFont(select(1, GameTimeFont:GetFont()), 20, select(3, GameTimeFont:GetFont()))
			GameTimeFont:SetShadowOffset(0, 0)
		end
	end

	if MiniMapMailFrame then
		MiniMapMailFrame:ClearAllPoints()
		MiniMapMailFrame:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 4)
		MiniMapMailFrame:SetScale(1.2)
	end

	if QueueStatusMinimapButton then
		QueueStatusMinimapButton:ClearAllPoints()
		QueueStatusMinimapButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 2, -2)
	end

	if MiniMapInstanceDifficulty and GuildInstanceDifficulty then
		MiniMapInstanceDifficulty:ClearAllPoints()
		MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
		MiniMapInstanceDifficulty:SetScale(0.9)
		GuildInstanceDifficulty:ClearAllPoints()
		GuildInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
		GuildInstanceDifficulty:SetScale(0.9)
	end

	if MiniMapChallengeMode then
		MiniMapChallengeMode:ClearAllPoints()
		MiniMapChallengeMode:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 8, -8)
	end

	if StreamingIcon then
		StreamingIcon:ClearAllPoints()
		StreamingIcon:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -10)
		StreamingIcon:SetScale(0.9)
		StreamingIcon:SetFrameStrata("BACKGROUND")
	end

	if HelpOpenTicketButton and HelpOpenWebTicketButton then
		PositionTicketButtons()
	end
end

function Module:ADDON_LOADED(_, addon)
	if addon == "Blizzard_TimeManager" then
		TimeManagerClockButton:Kill()
	elseif addon == "Blizzard_FeedbackUI" then
		FeedbackUIButton:Kill()
	end
end

function Module:OnEvent(event)
	if event == "PLAYER_ENTERING_WORLD" then
		self:ZoneTextUpdate()
	elseif event == "PLAYER_REGEN_ENABLED" then
		self:UpdateSettings()
	end
end

function Module:WhoPingsMyMap()
	local f = CreateFrame("Frame", nil, Minimap)
	f:SetAllPoints()

	f.text = f:CreateFontString(nil, "OVERLAY")
	f.text:FontTemplate(nil, 13)
	f.text:SetPoint("TOP", f, "TOP", 0, -20)

	local anim = f:CreateAnimationGroup()
	anim:SetScript("OnPlay", function() f:SetAlpha(1) end)
	anim:SetScript("OnFinished", function() f:SetAlpha(0) end)
	anim.fader = anim:CreateAnimation("Alpha")
	anim.fader:SetFromAlpha(1)
	anim.fader:SetToAlpha(0)
	anim.fader:SetDuration(3)
	anim.fader:SetSmoothing("OUT")
	anim.fader:SetStartDelay(3)

	K:RegisterEvent("MINIMAP_PING", function(_, unit)
		local class = select(2, UnitClass(unit))
		local r, g, b = K.ColorClass(class)
		local name = GetUnitName(unit)

		anim:Stop()
		f.text:SetText(name)
		f.text:SetTextColor(r, g, b)
		anim:Play()
	end)
end

function Module:OnEnable()
	self:UpdateSettings()

	if not C["Minimap"].Enable then
		Minimap:SetMaskTexture(186178)
		Minimap:SetBlipTexture("Interface\\MiniMap\\ObjectIconsAtlas")
		return
	end

	local UIHider = K.UIFrameHider

	-- Support for other mods
	function GetMinimapShape()
		return "SQUARE"
	end

	local MinimapFrameHolder = CreateFrame("Frame", "MinimapFrameHolder", Minimap)
	MinimapFrameHolder:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -4, -4)
	MinimapFrameHolder:SetWidth(Minimap:GetWidth())
	MinimapFrameHolder:SetHeight(Minimap:GetHeight())

	Minimap:ClearAllPoints()
	Minimap:SetPoint("CENTER", MinimapFrameHolder, "CENTER", 0, 0)
	Minimap:SetMaskTexture(C["Media"].Blank)
	Minimap:SetQuestBlobRingAlpha(0)
	Minimap:SetArchBlobRingAlpha(0)
	Minimap:CreateBorder()
	Minimap:CreateInnerShadow(nil, 0.4)
	Minimap:SetScale(1.0)
	Minimap:SetBlipTexture("Interface\\AddOns\\KkthnxUI\\Media\\MiniMap\\Blip-Nandini-New")

	Minimap:HookScript("OnEnter", function(self)
		if K.PerformanceFrame then
			K.PerformanceFrame:Hide()
		end

		self.Location:Show()
	end)

	Minimap:HookScript("OnLeave", function(self)
		if K.PerformanceFrame then
			K.PerformanceFrame:Show()
		end

		self.Location:Hide()
	end)

	Minimap.Location = Minimap:CreateFontString(nil, "OVERLAY")
	Minimap.Location:SetWidth(C["Minimap"].Size)
	Minimap.Location:FontTemplate(nil, 13)
	Minimap.Location:SetPoint("TOP", 0, -4)
	Minimap.Location:SetJustifyH("CENTER")
	Minimap.Location:SetJustifyV("MIDDLE")
	Minimap.Location:Hide()

	-- New dungeon finder eye in MoP
	QueueStatusMinimapButton:SetHighlightTexture("")
	if QueueStatusMinimapButton.Highlight then -- bugged out in MoP
		QueueStatusMinimapButton.Highlight:SetTexture(nil)
		QueueStatusMinimapButton.Highlight:SetAlpha(0)
	end

	_G.MinimapBorder:SetParent(UIHider)
	_G.MinimapBorderTop:SetParent(UIHider)
	_G.MiniMapMailBorder:SetParent(UIHider)
	_G.MinimapNorthTag:SetParent(UIHider)
	_G.MiniMapTracking:SetParent(UIHider)
	_G.MiniMapTrackingButton:SetParent(UIHider)
	_G.MinimapZoneTextButton:SetParent(UIHider)
	_G.MinimapZoomIn:SetParent(UIHider)
	_G.MinimapZoomOut:SetParent(UIHider)
	_G.MiniMapMailIcon:SetTexture("Interface\\Addons\\KkthnxUI\\Media\\Textures\\Mail")

	-- Hide the BlopRing on Minimap
	MinimapCluster:EnableMouse(false)
	Minimap:SetArchBlobRingScalar(0)
	Minimap:SetQuestBlobRingScalar(0)

	if QueueStatusMinimapButtonBorder then
		QueueStatusMinimapButtonBorder:SetTexture(nil)
		QueueStatusMinimapButtonBorder:SetAlpha(0)
	end

	_G.MiniMapWorldMapButton:SetParent(K.UIFrameHider)

	MiniMapInstanceDifficulty:SetParent(Minimap)
	GuildInstanceDifficulty:SetParent(Minimap)
	MiniMapChallengeMode:SetParent(Minimap)

	if TimeManagerClockButton then
		TimeManagerClockButton:Kill()
	end

	if FeedbackUIButton then
		FeedbackUIButton:Kill()
	end

	K.Mover(MinimapFrameHolder, "Minimap", "Minimap", {"TOPRIGHT", UIParent, "TOPRIGHT", -4, -4}, Minimap:GetWidth(), Minimap:GetHeight())

	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", Module.OnMouseWheelScroll)

	self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ZoneTextUpdate")
	self:RegisterEvent("ZONE_CHANGED", "ZoneTextUpdate")
	self:RegisterEvent("ZONE_CHANGED_INDOORS", "ZoneTextUpdate")
	self:RegisterEvent("ADDON_LOADED")

	self:UpdateSettings()
	self:WhoPingsMyMap()
end