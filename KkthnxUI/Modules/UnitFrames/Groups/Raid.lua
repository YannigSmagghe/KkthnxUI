local K, C = unpack(select(2, ...))
if C["Raid"].Enable ~= true then
	return
end
local Module = K:GetModule("Unitframes")

local oUF = oUF or K.oUF

if not oUF then
	K.Print("Could not find a vaild instance of oUF. Stopping Raid.lua code!")
	return
end

local _G = _G
local table_insert = table.insert
local select = select

local CreateFrame = _G.CreateFrame
local GetThreatStatusColor = _G.GetThreatStatusColor
local UnitFrame_OnEnter = _G.UnitFrame_OnEnter
local UnitFrame_OnLeave = _G.UnitFrame_OnLeave
local UnitIsUnit = _G.UnitIsUnit
local UnitPowerType = _G.UnitPowerType
local UnitThreatSituation = _G.UnitThreatSituation

local function UpdateThreat(self, _, unit)
	if (self.unit ~= unit) then
		return
	end

	local situation = UnitThreatSituation(unit)
	if (situation and situation > 0) then
		local r, g, b = GetThreatStatusColor(situation)
		self:SetBackdropBorderColor(r, g, b)
	else
		self:SetBackdropBorderColor()
	end
end

local function UpdateRaidPower(self, _, unit)
	if unit ~= self.unit then
		return
	end

	local health = self.Health
	local power = self.Power

	if (not power) then
		return
	end

	local _, ptype = UnitPowerType(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)

	local disconnected = not UnitIsConnected(unit)

	if (disconnected) then
		power:Hide()
	else
		if (power.__disconnected ~= disconnected) then
			power:Show()
		end

		if (power.__ptype ~= ptype) then
			if (ptype ~= "MANA") then
				health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 1)
				power:Hide()
			else
				health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 5)
				power:Show()
			end

			power.__ptype = ptype
		end
	end

	if (ptype == "MANA") then
		power:SetMinMaxValues(0, max)
		power:SetValue(min)
	end

	power.__disconnected = disconnected
end

function Module:CreateRaid()
	local RaidframeFont = K.GetFont(C["UIFonts"].UnitframeFonts)
	local RaidframeTexture = K.GetTexture(C["UITextures"].UnitframeTextures)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", function()
		UnitFrame_OnEnter(self)

		if (self.Highlight) then
			self.Highlight:Show()
		end
	end)

	self:SetScript("OnLeave", function()
		UnitFrame_OnLeave(self)

		if (self.Highlight) then
			self.Highlight:Hide()
		end
	end)

	self:CreateBorder()

	self.Health = CreateFrame("StatusBar", "$parentHealthBar", self)
	self.Health:SetFrameStrata("LOW")
	self.Health:SetFrameLevel(self:GetFrameLevel() - 0)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture(RaidframeTexture)

	self.Health.Value = self.Health:CreateFontString(nil, "OVERLAY")
	self.Health.Value:SetPoint("CENTER", self.Health, 0, -9)
	self.Health.Value:SetFontObject(RaidframeFont)
	self.Health.Value:SetFont(select(1, self.Health.Value:GetFont()), 11, select(3, self.Health.Value:GetFont()))
	self:Tag(self.Health.Value, C["Raid"].HealthFormat.Value)

	self.Health.colorDisconnected = true
	self.Health.colorSmooth = false
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.frequentUpdates = false -- Should Help With Fps In Bigger Groups.

	--K:SetSmoothing(self.Health, C["Raid"].Smooth)

	if C["Raid"].ManabarShow then
		self.Power = CreateFrame("StatusBar", nil, self)
		self.Power:SetFrameStrata("LOW")
		self.Power:SetFrameLevel(self:GetFrameLevel())
		self.Power:SetHeight(5)
		self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
		self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
		self.Power:SetStatusBarTexture(RaidframeTexture)

		self.Power.colorPower = true
		self.Power.frequentUpdates = false -- Should Help With Fps In Bigger Groups.

		--K:SetSmoothing(self.Power, C["Raid"].Smooth)

		self.Power.Background = self.Power:CreateTexture(nil, "BORDER")
		self.Power.Background:SetAllPoints(self.Power)
		self.Power.Background:SetColorTexture(.2, .2, .2)
		self.Power.Background.multiplier = 0.3

		self:RegisterEvent("UNIT_DISPLAYPOWER", UpdateRaidPower)
		self.Power.Override = UpdateRaidPower
	end

	self.Name = self:CreateFontString(nil, "OVERLAY")
	self.Name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 3, -15)
	self.Name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -3, -15)
	self.Name:SetFontObject(RaidframeFont)
	self.Name:SetWordWrap(false)
	if C["Raid"].ShowRolePrefix then
		self:Tag(self.Name, "[KkthnxUI:Role][KkthnxUI:NameShort]")
	else
		self:Tag(self.Name, "[KkthnxUI:NameShort]")
	end

	self.Overlay = CreateFrame("Frame", nil, self)
	self.Overlay:SetAllPoints(self.Health)
	self.Overlay:SetFrameLevel(self:GetFrameLevel() + 4)

	self.ReadyCheckIndicator = self.Overlay:CreateTexture(nil, "OVERLAY", 2)
	self.ReadyCheckIndicator:SetSize(22, 22)
	self.ReadyCheckIndicator:SetPoint("CENTER")

	self.RaidTargetIndicator = self.Overlay:CreateTexture(nil, "OVERLAY")
	self.RaidTargetIndicator:SetSize(16, 16)
	self.RaidTargetIndicator:SetPoint("TOP", self, 0, 8)

	self.ResurrectIndicator = self.Overlay:CreateTexture(nil, "OVERLAY")
	self.ResurrectIndicator:SetSize(30, 30)
	self.ResurrectIndicator:SetPoint("CENTER", 0, -3)

	self.SummonIndicator = self.Overlay:CreateTexture(nil, "OVERLAY")
	self.SummonIndicator:SetSize(30, 30)
	self.SummonIndicator:SetPoint("CENTER", 0, -3)

	self.LeaderIndicator = self.Overlay:CreateTexture(nil, "OVERLAY")
	self.LeaderIndicator:SetSize(12, 12)
	self.LeaderIndicator:SetPoint("TOPLEFT", -2, 7)

	if C["Raid"].ShowNotHereTimer then
		self.StatusIndicator = self:CreateFontString(nil, "OVERLAY")
		self.StatusIndicator:SetPoint("CENTER", self.Overlay, "BOTTOM", 0, 6)
		self.StatusIndicator:SetFontObject(RaidframeFont)
		self.StatusIndicator:SetFont(select(1, self.StatusIndicator:GetFont()), 10, select(3, self.StatusIndicator:GetFont()))
		self.StatusIndicator:SetTextColor(1, 0, 0)
		self:Tag(self.StatusIndicator, "[KkthnxUI:Status]")
	end

	if C["Raid"].AuraWatch then
		Module:CreateAuraWatch(self)

		self.RaidDebuffs = CreateFrame("Frame", nil, self.Health)
		self.RaidDebuffs:SetHeight(C["Raid"].AuraDebuffIconSize)
		self.RaidDebuffs:SetWidth(C["Raid"].AuraDebuffIconSize)
		self.RaidDebuffs:SetPoint("CENTER", self.Health)
		self.RaidDebuffs:SetFrameLevel(self.Health:GetFrameLevel() + 20)
		self.RaidDebuffs:CreateBorder()

		self.RaidDebuffs.icon = self.RaidDebuffs:CreateTexture(nil, "ARTWORK")
		self.RaidDebuffs.icon:SetTexCoord(.1, .9, .1, .9)
		self.RaidDebuffs.icon:SetAllPoints(self.RaidDebuffs)

		self.RaidDebuffs.cd = CreateFrame("Cooldown", nil, self.RaidDebuffs, "CooldownFrameTemplate")
		self.RaidDebuffs.cd:SetAllPoints(self.RaidDebuffs, 1, 1)
		self.RaidDebuffs.cd:SetReverse(true)
		self.RaidDebuffs.cd.noOCC = true
		self.RaidDebuffs.cd.noCooldownCount = true
		self.RaidDebuffs.cd:SetHideCountdownNumbers(true)

		self.RaidDebuffs.showDispellableDebuff = true
		self.RaidDebuffs.onlyMatchSpellID = true
		self.RaidDebuffs.FilterDispellableDebuff = true

		-- self.RaidDebuffs.forceShow = true -- TEST

		self.RaidDebuffs.time = self.RaidDebuffs:CreateFontString(nil, "OVERLAY")
		self.RaidDebuffs.time:SetFont(C["Media"].Font, 12, "OUTLINE")
		self.RaidDebuffs.time:SetPoint("CENTER", self.RaidDebuffs, 0, 0)

		self.RaidDebuffs.count = self.RaidDebuffs:CreateFontString(nil, "OVERLAY")
		self.RaidDebuffs.count:SetFont(C["Media"].Font, 12, "OUTLINE")
		self.RaidDebuffs.count:SetPoint("BOTTOMRIGHT", self.RaidDebuffs, "BOTTOMRIGHT", 2, 0)
		self.RaidDebuffs.count:SetTextColor(1, .9, 0)
	end

	self.ThreatIndicator = {}
	self.ThreatIndicator.IsObjectType = function() end
	self.ThreatIndicator.Override = UpdateThreat

	if C["Raid"].ShowMouseoverHighlight then
		Module.MouseoverHealth(self, "raid")
	end

	if C["Raid"].TargetHighlight then
		self.OverlayFrame = CreateFrame("Frame", nil, self)
		self.OverlayFrame:SetFrameLevel(self:GetFrameLevel() + 2)
		self.OverlayFrame:SetAllPoints()

		self.TargetHighlight = self.OverlayFrame:CreateTexture(nil, "OVERLAY")
		self.TargetHighlight:SetTexture([[Interface\RAIDFRAME\Raid-FrameHighlights]])
		self.TargetHighlight:SetTexCoord(0.00781250, 0.55468750, 0.28906250, 0.55468750)
		self.TargetHighlight:SetVertexColor(0.84, 0.75, 0.65)
		self.TargetHighlight:SetAllPoints()
		self.TargetHighlight:Hide()

		local function UpdateRaidTargetGlow()
			if UnitIsUnit("target", self.unit) then
				self.TargetHighlight:Show()
			else
				self.TargetHighlight:Hide()
			end
		end

		self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateRaidTargetGlow, true)
		self:RegisterEvent("GROUP_ROSTER_UPDATE", UpdateRaidTargetGlow, true)
	end

	Module.CreateHealthPrediction(self, "raid")

	if C["Unitframe"].DebuffHighlight then
		Module.CreateDebuffHighlight(self)
	end

	self.Range = Module.CreateRangeIndicator(self)
end