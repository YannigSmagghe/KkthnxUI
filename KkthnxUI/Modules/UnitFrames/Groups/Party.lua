local K, C = unpack(select(2, ...))
if C["Party"].Enable ~= true then
	return
end
local Module = K:GetModule("Unitframes")

local oUF = oUF or K.oUF

if not oUF then
	K.Print("Could not find a vaild instance of oUF. Stopping Party.lua code!")
	return
end

local _G = _G

local CreateFrame = _G.CreateFrame
local UnitFrame_OnEnter = _G.UnitFrame_OnEnter
local UnitFrame_OnLeave = _G.UnitFrame_OnLeave
local UnitIsUnit = _G.UnitIsUnit

function Module:CreateParty()
	local UnitframeFont = K.GetFont(C["UIFonts"].UnitframeFonts)
	local UnitframeTexture = K.GetTexture(C["UITextures"].UnitframeTextures)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", function(self)
		UnitFrame_OnEnter(self)

		if (self.Highlight) then
			self.Highlight:Show()
		end
	end)

	self:SetScript("OnLeave", function(self)
		UnitFrame_OnLeave(self)

		if (self.Highlight) then
			self.Highlight:Hide()
		end
	end)

	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetSize(114, 18)
	self.Health:SetPoint("CENTER", self, "CENTER", 19, 7)
	self.Health:SetStatusBarTexture(UnitframeTexture)
	self.Health:CreateBorder()

	self.Health.PostUpdate = C["Party"].PortraitStyle.Value ~= "ThreeDPortraits" and Module.UpdateHealth
	self.Health.colorDisconnected = true
	self.Health.colorSmooth = false
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.frequentUpdates = true

	K:SetSmoothing(self.Health, C["Party"].Smooth)

	self.Health.Value = self.Health:CreateFontString(nil, "OVERLAY")
	self.Health.Value:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
	self.Health.Value:SetFontObject(UnitframeFont)
	self.Health.Value:SetFont(select(1, self.Health.Value:GetFont()), 10, select(3, self.Health.Value:GetFont()))
	self:Tag(self.Health.Value, "[KkthnxUI:HealthCurrent-Percent]")

	self.Power = CreateFrame("StatusBar", nil, self)
	self.Power:SetSize(114, 8)
	self.Power:SetPoint("TOP", self.Health, "BOTTOM", 0, -6)
	self.Power:SetStatusBarTexture(UnitframeTexture)
	self.Power:CreateBorder()

	self.Power.colorPower = true
	self.Power.SetFrequentUpdates = true

	K:SetSmoothing(self.Power, C["Party"].Smooth)

	if C["Unitframe"].ShowPortrait then
		if (C["Party"].PortraitStyle.Value == "ThreeDPortraits") then
			self.Portrait = CreateFrame("PlayerModel", nil, self)
			self.Portrait:SetSize(32, 32)
			self.Portrait:SetPoint("LEFT", self, 3, 0)
			self.Portrait:SetAlpha(0.9)

			self.Portrait.Borders = CreateFrame("Frame", nil, self)
			self.Portrait.Borders:SetPoint("LEFT", self, 3, 0)
			self.Portrait.Borders:SetSize(32, 32)
			self.Portrait.Borders:CreateBorder()
			self.Portrait.Borders:CreateInnerShadow()
		elseif (C["Party"].PortraitStyle.Value ~= "ThreeDPortraits") then
			self.Portrait = self.Health:CreateTexture("$parentPortrait", "BACKGROUND", nil, 1)
			self.Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			self.Portrait:SetSize(32, 32)
			self.Portrait:SetPoint("LEFT", self, 3, 0)

			self.Portrait.Borders = CreateFrame("Frame", nil, self)
			self.Portrait.Borders:SetPoint("LEFT", self, 3, 0)
			self.Portrait.Borders:SetSize(32, 32)
			self.Portrait.Borders:CreateBorder()

			if (C["Party"].PortraitStyle.Value == "ClassPortraits" or C["Party"].PortraitStyle.Value == "NewClassPortraits") then
				self.Portrait.PostUpdate = Module.UpdateClassPortraits
			end
		end
	end

	self.Name = self:CreateFontString(nil, "OVERLAY")
	self.Name:SetPoint("TOP", self.Health, 0, 16)
	self.Name:SetWidth(self.Health:GetWidth())
	self.Name:SetFontObject(UnitframeFont)
	self.Name:SetWordWrap(false)
	self:Tag(self.Name, "[KkthnxUI:Leader][KkthnxUI:Role][KkthnxUI:GetNameColor][KkthnxUI:NameMedium]")

	self.Level = self:CreateFontString(nil, "OVERLAY")
	self.Level:SetPoint("TOP", self.Portrait, 0, 15)
	self.Level:SetFontObject(UnitframeFont)
	self:Tag(self.Level, "[KkthnxUI:DifficultyColor][KkthnxUI:SmartLevel][KkthnxUI:ClassificationColor][shortclassification]")

	self.StatusIndicator = self.Power:CreateFontString(nil, "OVERLAY")
	self.StatusIndicator:SetPoint("CENTER", 0, 0.5)
	self.StatusIndicator:SetFontObject(UnitframeFont)
	self.StatusIndicator:SetFont(select(1, self.StatusIndicator:GetFont()), 10, select(3, self.StatusIndicator:GetFont()))
	self:Tag(self.StatusIndicator, "[KkthnxUI:Status]")

	Module.CreatePartyCastbar(self)

	if C["Party"].MouseoverHighlight then
		Module.MouseoverHealth(self, "party")
	end

	if (C["Party"].TargetHighlight) then
		self.OverlayFrame = CreateFrame("Frame", nil, self)
		self.OverlayFrame:SetPoint("TOPLEFT", self.Portrait.Borders, -2, 2)
		self.OverlayFrame:SetPoint("BOTTOMRIGHT", self.Portrait.Borders, 2, -2)
		self.OverlayFrame:SetFrameLevel(self.Portrait.Borders:GetFrameLevel() + 2)

		self.TargetHighlight = self.OverlayFrame:CreateTexture(nil, "OVERLAY")
		self.TargetHighlight:SetTexture("Interface\\Buttons\\CheckButtonHilight")
		self.TargetHighlight:SetBlendMode("ADD")
		self.TargetHighlight:SetVertexColor(0.84, 0.75, 0.65)
		self.TargetHighlight:SetPoint("TOPLEFT", self.Portrait.Borders, -2, 2)
		self.TargetHighlight:SetPoint("BOTTOMRIGHT", self.Portrait.Borders, 2, -2)
		self.TargetHighlight:Hide()

		local function UpdatePartyTargetGlow()
			if not self.unit then
				return
			end

			local unit = self.unit

			if unit and UnitIsUnit(unit, "target") then
				self.TargetHighlight:Show()
			else
				self.TargetHighlight:Hide()
			end
		end

		self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdatePartyTargetGlow, true)
		self:RegisterEvent("GROUP_ROSTER_UPDATE", UpdatePartyTargetGlow, true)
	end

	self.ReadyCheckIndicator = self.Health:CreateTexture(nil, "OVERLAY")
	self.ReadyCheckIndicator:SetSize(20, 20)
	self.ReadyCheckIndicator:SetPoint("LEFT", 0, 0)
	self.ReadyCheckIndicator.finishedTime = 5
	self.ReadyCheckIndicator.fadeTime = 3

	Module.CreatePartyAuras(self)
	if C["Party"].PortraitTimers then
		Module.CreatePortraitTimers(self)
	end
	Module.CreatePhaseIndicator(self)
	Module.CreateRaidTargetIndicator(self)
	Module.CreateResurrectIndicator(self)
	-- Module.CreateSummonIndicator(self)
	Module.CreateOfflineIndicator(self, 50)
	Module.CreateThreatIndicator(self)

	if C["Unitframe"].DebuffHighlight then
		Module.CreateDebuffHighlight(self)
	end

	Module.CreateHealthPrediction(self, "party")

	self.Threat = {
		Hide = K.Noop,
		IsObjectType = K.Noop,
		Override = Module.CreateThreatIndicator
	}

	self.Range = Module.CreateRangeIndicator(self)
end