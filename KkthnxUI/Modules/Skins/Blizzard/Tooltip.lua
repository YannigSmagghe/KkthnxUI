local K, C = unpack(select(2, ...))
local ModuleSkins = K:GetModule("Skins")
local Module = K:GetModule("Tooltip")

local _G = _G
local unpack = unpack
local pairs = pairs
local table_insert = table.insert

local hooksecurefunc = hooksecurefunc

local function IslandTooltipStyle(self)
	if not self.IsSkinned then
		self:SetBackdrop(nil)
		self:CreateBorder()
		self.IsSkinned = true
	end
end

local function SkinTooltip()
	if C["Tooltip"].Enable ~= true then
		return
	end

	local GameTooltipStatusBarTexture = K.GetTexture(C["UITextures"].TooltipTextures)
	local GameTooltip = _G["GameTooltip"]
	local GameTooltipStatusBar = _G["GameTooltipStatusBar"]
	local WarCampaignTooltip = QuestScrollFrame.WarCampaignTooltip
	local StoryTooltip = QuestScrollFrame.StoryTooltip
	StoryTooltip:SetFrameLevel(4)

	ItemRefCloseButton:SkinCloseButton()

	-- World Quest Reward Icon
	GameTooltip.ItemTooltip:CreateBackdrop()
	GameTooltip.ItemTooltip.Backdrop:SetOutside(GameTooltip.ItemTooltip.Icon)
	GameTooltip.ItemTooltip.Backdrop:SetFrameLevel(GameTooltip.ItemTooltip:GetFrameLevel())
	GameTooltip.ItemTooltip.Count:ClearAllPoints()
	GameTooltip.ItemTooltip.Count:SetPoint("BOTTOMRIGHT", GameTooltip.ItemTooltip.Icon, "BOTTOMRIGHT", 1, 0)
	GameTooltip.ItemTooltip.Icon:SetTexCoord(K.TexCoords[1], K.TexCoords[2], K.TexCoords[3], K.TexCoords[4])

	hooksecurefunc(GameTooltip.ItemTooltip.IconBorder, "SetVertexColor", function(self, r, g, b)
		self:GetParent().Backdrop:SetBackdropBorderColor(r, g, b)
		self:SetTexture("")
	end)

	hooksecurefunc(GameTooltip.ItemTooltip.IconBorder, "Hide", function(self)
		self:GetParent().Backdrop:SetBackdropBorderColor()
	end)

	local tooltips = {
		_G.ItemRefTooltip,
		_G.ItemRefShoppingTooltip1,
		_G.ItemRefShoppingTooltip2,
		_G.ItemRefShoppingTooltip3,
		_G.AutoCompleteBox,
		_G.FriendsTooltip,
		_G.ShoppingTooltip1,
		_G.ShoppingTooltip2,
		_G.ShoppingTooltip3,
		_G.ReputationParagonTooltip,
		_G.EmbeddedItemTooltip,
		-- already have locals
		GameTooltip,
		StoryTooltip,
		WarCampaignTooltip,
	}

	local qualityTooltips = {
		GameTooltip,
		ItemRefShoppingTooltip1,
		ItemRefShoppingTooltip2,
		ItemRefTooltip,
		ShoppingTooltip1,
		ShoppingTooltip2,
	}

	for _, tt in pairs(tooltips) do
		Module:SecureHookScript(tt, "OnShow", "SetStyle")
	end

	for _, tt in pairs(qualityTooltips) do
		Module:SecureHookScript(tt, "OnTooltipSetItem", "GameTooltip_OnTooltipSetItem")
	end

	if GameTooltipStatusBar then
		GameTooltipStatusBar:SetStatusBarTexture(GameTooltipStatusBarTexture)
		GameTooltipStatusBar:CreateBorder()
		GameTooltipStatusBar:ClearAllPoints()
		GameTooltipStatusBar:SetPoint("BOTTOMLEFT", GameTooltip, "TOPLEFT", 3, 3)
		GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -3, 3)
	end

	Module:SecureHook("GameTooltip_ShowStatusBar")
	Module:SecureHook("GameTooltip_ShowProgressBar") -- Skin Progress Bars
	Module:SecureHook("GameTooltip_AddQuestRewardsToTooltip") -- Color Progress Bars
	Module:SecureHook("GameTooltip_UpdateStyle", "SetStyle")
	Module:SecureHookScript(GameTooltip, "OnUpdate", "CheckBackdropColor") -- There has to be a more elegant way of doing this.

	Module:RegisterEvent("ADDON_LOADED", function(_, addon)
		if addon == "Blizzard_IslandsQueueUI" then
			local IslandTooltip = _G["IslandsQueueFrameTooltip"]
			IslandTooltip:GetParent():GetParent():HookScript("OnShow", IslandTooltipStyle)
			IslandTooltip:GetParent().IconBorder:SetAlpha(0)
			IslandTooltip:GetParent().Icon:SetTexCoord(K.TexCoords[1], K.TexCoords[2], K.TexCoords[3], K.TexCoords[4])
		end
	end)
end

table_insert(ModuleSkins.SkinFuncs["KkthnxUI"], SkinTooltip)