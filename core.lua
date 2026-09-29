local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

local function CreateConfirmDialog()
    local dialog = CreateFrame("Frame", "ActionBarEnablerDialog", UIParent, "BackdropTemplate")
    dialog:SetSize(320, 120)
    dialog:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
    dialog:SetFrameStrata("FULLSCREEN_DIALOG")
    dialog:SetFrameLevel(100)
    dialog:EnableMouse(true)
    dialog:SetMovable(true)
    dialog:RegisterForDrag("LeftButton")
    dialog:SetScript("OnDragStart", dialog.StartMoving)
    dialog:SetScript("OnDragStop", dialog.StopMovingOrSizing)

    dialog:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    local text = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("TOP", dialog, "TOP", 0, -20)
    text:SetWidth(280)
    text:SetText("Enable action bars 2-6?")

    local yes = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    yes:SetSize(100, 22)
    yes:SetPoint("BOTTOMLEFT", dialog, "BOTTOMLEFT", 20, 20)
    yes:SetText("Yes")
    yes:SetScript("OnClick", function()
        SetActionBarToggles(true, true, true, true, true, false, false, false)
        ActionBarEnablerDB = true
        dialog:Hide()

        if MultiActionBar_Update then
            MultiActionBar_Update()
        end

        print("Action bars 2-6 enabled.")
    end)

    local no = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    no:SetSize(100, 22)
    no:SetPoint("BOTTOMRIGHT", dialog, "BOTTOMRIGHT", -20, 20)
    no:SetText("No")
    no:SetScript("OnClick", function()
        ActionBarEnablerDB = true
        dialog:Hide()
        print("Action bars 2-6 were not enabled.")
    end)

    dialog:Show()
end

frame:SetScript("OnEvent", function()
    if ActionBarEnablerDB then return end
    CreateConfirmDialog()
end)

SLASH_ACTIONBARENABLER1 = "/abe"
SlashCmdList["ACTIONBARENABLER"] = function(msg)
    if msg == "reset" then
        ActionBarEnablerDB = nil
        print("ActionBarEnabler: reset. The dialog will show on next login.")
    else
        print("ActionBarEnabler: /abe reset")
    end
end
