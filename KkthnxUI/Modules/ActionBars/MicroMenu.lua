local K, C = unpack(select(2, ...))
local Module = K:NewModule("MicroBar", "AceHook-3.0", "AceEvent-3.0")

local _G = _G
local assert = assert

local C_StorePublic_IsEnabled = _G.C_StorePublic.IsEnabled
local CharacterMicroButton = _G.CharacterMicroButton
local CreateFrame = _G.CreateFrame
local GetCurrentRegionName = _G.GetCurrentRegionName
local GuildMicroButton = _G.GuildMicroButton
local GuildMicroButtonTabard = _G.GuildMicroButtonTabard
local InCombatLockdown = _G.InCombatLockdown
local MainMenuBarPerformanceBar = _G.MainMenuBarPerformanceBar
local MainMenuMicroButton = _G.MainMenuMicroButton
local MICRO_BUTTONS = _G.MICRO_BUTTONS
local MicroButtonPortrait = _G.MicroButtonPortrait
local RegisterStateDriver = _G.RegisterStateDriver
local UIParent = _G.UIParent
local UpdateMicroButtonsParent = _G.UpdateMicroButtonsParent

local function onLeave()
	if C["ActionBar"].MicroBarMouseover then
		K.UIFrameFadeOut(KkthnxUI_MicroBar, 0.2, KkthnxUI_MicroBar:GetAlpha(), 0.25)
	end
end

local watcher = 0
local function onUpdate(self, elapsed)
	if watcher > 0.1 then
		if not self:IsMouseOver() then
			self.IsMouseOvered = nil
			self:SetScript("OnUpdate", nil)
			onLeave()
		end

		watcher = 0
	else
		watcher = watcher + elapsed
	end
end

local function onEnter()
	if C["ActionBar"].MicroBarMouseover and not KkthnxUI_MicroBar.IsMouseOvered then
		KkthnxUI_MicroBar.IsMouseOvered = true
		KkthnxUI_MicroBar:SetScript("OnUpdate", onUpdate)
		K.UIFrameFadeIn(KkthnxUI_MicroBar, 0.2, KkthnxUI_MicroBar:GetAlpha(), 1)
	end
end

function Module:PLAYER_REGEN_ENABLED()
	if Module.NeedsUpdateMicroBarVisibility then
		self:UpdateMicroBarVisibility()
		Module.NeedsUpdateMicroBarVisibility = nil
	end

	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function Module:HandleMicroButton(button)
	assert(button, "Invalid micro button name.")

	local pushed = button:GetPushedTexture()
	local normal = button:GetNormalTexture()
	local disabled = button:GetDisabledTexture()

	local f = CreateFrame("Frame", nil, button)
	K.CreateBorder(f)
	f:SetAllPoints(button)
	button.backdrop = f

	button:SetParent(KkthnxUI_MicroBar)
	button:GetHighlightTexture():Kill()
	button:HookScript("OnEnter", onEnter)
	button:SetHitRectInsets(0, 0, 0, 0)

	if button.Flash then
		button.Flash:SetInside()
		button.Flash:SetTexture(nil)
	end

	pushed:SetTexCoord(0.22, 0.81, 0.26, 0.82)
	pushed:SetInside(f)

	normal:SetTexCoord(0.22, 0.81, 0.21, 0.82)
	normal:SetInside(f)

	if disabled then
		disabled:SetTexCoord(0.22, 0.81, 0.21, 0.82)
		disabled:SetInside(f)
	end
end

function Module:MainMenuMicroButton_SetNormal()
	MainMenuBarPerformanceBar:SetPoint("TOPLEFT", MainMenuMicroButton, "TOPLEFT", 9, -36)
end

function Module:MainMenuMicroButton_SetPushed()
	MainMenuBarPerformanceBar:SetPoint("TOPLEFT", MainMenuMicroButton, "TOPLEFT", 8, -37)
end

function Module:UpdateMicroButtonsParent()
	for i = 1, #MICRO_BUTTONS do
		_G[MICRO_BUTTONS[i]]:SetParent(KkthnxUI_MicroBar)
	end
end

-- we use this table to sort the micro buttons on our bar to match Blizzard"s button placements.
local __buttonIndex = {
	[8] = "CollectionsMicroButton",
	[9] = "EJMicroButton",
	[10] = (not C_StorePublic_IsEnabled() and GetCurrentRegionName() == "CN") and "HelpMicroButton" or "StoreMicroButton",
	[11] = "MainMenuMicroButton"
}

function Module:UpdateMicroBarVisibility()
	if InCombatLockdown() then
		Module.NeedsUpdateMicroBarVisibility = true
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	local visibility = "show"
	if visibility and visibility:match("[\n\r]") then
		visibility = visibility:gsub("[\n\r]","")
	end

	RegisterStateDriver(KkthnxUI_MicroBar.visibility, "visibility", (C["ActionBar"].MicroBar and visibility) or "hide")
end

function Module:UpdateMicroPositionDimensions()
	if not KkthnxUI_MicroBar then
		return
	end

	local numRows = 1
	local prevButton = KkthnxUI_MicroBar
	local offset = 4
	local spacing = offset + 2

	for i = 1, #MICRO_BUTTONS-1 do
		local button = _G[__buttonIndex[i]] or _G[MICRO_BUTTONS[i]]
		button:SetSize(20, 20 * 1.4)
		button:ClearAllPoints()

		if prevButton == KkthnxUI_MicroBar then
			button:SetPoint("TOPLEFT", prevButton, "TOPLEFT", offset, -offset)
		else
			button:SetPoint("LEFT", prevButton, "RIGHT", spacing, 0)
		end

		prevButton = button
	end

	if C["ActionBar"].MicroBarMouseover and not KkthnxUI_MicroBar:IsMouseOver() then
		KkthnxUI_MicroBar:SetAlpha(0.25)
	else
		KkthnxUI_MicroBar:SetAlpha(1)
	end

	Module.MicroWidth = (((_G["CharacterMicroButton"]:GetWidth() + spacing) * 11) - spacing) + (offset * 2)
	Module.MicroHeight = (((_G["CharacterMicroButton"]:GetHeight() + spacing) * numRows) - spacing) + (offset * 2)
	KkthnxUI_MicroBar:SetSize(Module.MicroWidth, Module.MicroHeight)

	self:UpdateMicroBarVisibility()
end

function Module:UpdateMicroButtons()
	GuildMicroButtonTabard:SetInside(GuildMicroButton)

	GuildMicroButtonTabard.background:SetInside(GuildMicroButton)
	GuildMicroButtonTabard.background:SetTexCoord(0.17, 0.87, 0.5, 0.908)

	GuildMicroButtonTabard.emblem:ClearAllPoints()
	GuildMicroButtonTabard.emblem:SetPoint("TOPLEFT", GuildMicroButton, "TOPLEFT", 4, -4)
	GuildMicroButtonTabard.emblem:SetPoint("BOTTOMRIGHT", GuildMicroButton, "BOTTOMRIGHT", -4, 8)

	self:UpdateMicroPositionDimensions()
end

function Module:OnEnable()
	if not C["ActionBar"].Enable then
		return
	end

	if C["ActionBar"].MicroBar ~= true then
		return
	end

	local microBar = CreateFrame("Frame", "KkthnxUI_MicroBar", UIParent)
	microBar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
	microBar:EnableMouse(false)

	microBar.visibility = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
	microBar.visibility:SetScript("OnShow", function()
		microBar:Show()
	end)
	microBar.visibility:SetScript("OnHide", function()
		microBar:Hide()
	end)

	for i = 1, #MICRO_BUTTONS do
		self:HandleMicroButton(_G[MICRO_BUTTONS[i]])
	end

	MicroButtonPortrait:SetAllPoints(CharacterMicroButton.backdrop)

	self:SecureHook("MainMenuMicroButton_SetPushed")
	self:SecureHook("MainMenuMicroButton_SetNormal")
	self:SecureHook("UpdateMicroButtonsParent")
	self:SecureHook("MoveMicroButtons", "UpdateMicroPositionDimensions")
	self:SecureHook("UpdateMicroButtons")

	UpdateMicroButtonsParent(microBar)

	self:MainMenuMicroButton_SetNormal()
	self:UpdateMicroPositionDimensions()

	if MainMenuBarPerformanceBar then
		MainMenuBarPerformanceBar:SetTexture(nil)
		MainMenuBarPerformanceBar:SetVertexColor(0, 0, 0, 0)
		MainMenuBarPerformanceBar:Hide()
	end

	K.Mover(microBar, "MicroBar", "MicroBar", {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0}, (((_G["CharacterMicroButton"]:GetWidth() + 6) * 11) - 6) + (4 * 2), (((_G["CharacterMicroButton"]:GetHeight() + 6) * 1) - 6) + (4 * 2))
end