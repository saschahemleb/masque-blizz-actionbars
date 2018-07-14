MBAB = {
	addonName=...,
}

local Masque = LibStub("Masque", true)
assert(Masque, "Masque not found")

local group = Masque:Group("MainMenuBar")

function MBAB:Main(self)
	self:AddActionBarButtons()
	self:AddBagButtons()
end

function MBAB:AddActionBarButtons()
	for _, name in pairs({
		'PetActionButton',
		'PossessButton',
		'StanceButton',
		'ActionButton',
		'MultiBarBottomLeftButton',
		'MultiBarBottomRightButton',
		'MultiBarLeftButton',
		'MultiBarRightButton',
	}) do
		for i = 1, 12 do
			local button = _G[name..i]
			if button then
				group:AddButton(button)
			end
		end
	end
end

function MBAB:AddBagButtons()
	group:AddButton(_G["MainMenuBarBackpackButton"])
	for i = 0, 3 do
		group:AddButton(_G["CharacterBag"..i.."Slot"])
	end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		MBAB:Main(MBAB)
	end
end)
