local K, C = unpack(select(2, ...))
local Module = K:GetModule("ActionBar")

local _G = _G

local IsUsableAction = _G.IsUsableAction
local IsActionInRange = _G.IsActionInRange

local UPDATE_DELAY = .2
local buttonColors, buttonsToUpdate = {}, {}
local updater = CreateFrame("Frame")

local colors = {
	["normal"] = {1.0, 1.0, 1.0},
	["oor"] = {0.8, 0.1, 0.1},
	["oom"] = {0.5, 0.5, 1.0},
	["unusable"] = {0.4, 0.4, 0.4}
}

function Module:OnUpdateRange(elapsed)
	self.elapsed = (self.elapsed or UPDATE_DELAY) - elapsed
	if self.elapsed <= 0 then
		self.elapsed = UPDATE_DELAY

		if not Module:UpdateButtons() then
			self:Hide()
		end
	end
end
updater:SetScript("OnUpdate", Module.OnUpdateRange)

function Module:UpdateButtons()
	if next(buttonsToUpdate) then
		for button in pairs(buttonsToUpdate) do
			self.UpdateButtonUsable(button)
		end
		return true
	end

	return false
end

function Module:UpdateButtonStatus()
	local action = self.action

	if action and self:IsVisible() and HasAction(action) then
		buttonsToUpdate[self] = true
	else
		buttonsToUpdate[self] = nil
	end

	if next(buttonsToUpdate) then
		updater:Show()
	end
end

function Module:UpdateButtonUsable(force)
	if force then
		buttonColors[self] = nil
	end

	local action = self.action
	local isUsable, notEnoughMana = IsUsableAction(action)

	if isUsable then
		local inRange = IsActionInRange(action)
		if inRange == false then
			Module.SetButtonColor(self, "oor")
		else
			Module.SetButtonColor(self, "normal")
		end
	elseif notEnoughMana then
		Module.SetButtonColor(self, "oom")
	else
		Module.SetButtonColor(self, "unusable")
	end
end

function Module:SetButtonColor(colorIndex)
	if buttonColors[self] == colorIndex then
		return
	end
	buttonColors[self] = colorIndex

	local r, g, b = unpack(colors[colorIndex])
	self.icon:SetVertexColor(r, g, b)
end

function Module:Register()
	self:HookScript("OnShow", Module.UpdateButtonStatus)
	self:HookScript("OnHide", Module.UpdateButtonStatus)
	self:SetScript("OnUpdate", nil)
	Module.UpdateButtonStatus(self)
end

local function button_UpdateUsable(button)
	Module.UpdateButtonUsable(button, true)
end

function Module:HookActionEvents()
	hooksecurefunc("ActionButton_OnUpdate", self.Register)
	hooksecurefunc("ActionButton_Update", self.UpdateButtonStatus)
	hooksecurefunc("ActionButton_UpdateUsable", button_UpdateUsable)
end