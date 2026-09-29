local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

local function CreateConfirmDialog()
    local dialog = CreateFrame("Frame", "ActionBarEnablerDialog", UIParent)
    dialog:SetWidth(320)
    dialog:SetHeight(120)
    dialog:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
    dialog:SetFrameStrata("DIALOG")
    dialog:SetFrameLevel(100)
    dialog:EnableMouse(true)

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
    text:SetText("Enable action bars 2-6? This will reload your UI.")

    local yes = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    yes:SetWidth(100)
    yes:SetHeight(22)
    yes:SetPoint("BOTTOMLEFT", dialog, "BOTTOMLEFT", 20, 20)
    yes:SetText("Yes")
    yes:SetScript("OnClick", function()
        SetActionBarToggles(true, true, true, true, true, false, false, false)
        ActionBarEnablerDB = true
        dialog:Hide()
        ReloadUI()
    end)

    local no = CreateFrame("Button", nil, dialog, "UIPanelButtonTemplate")
    no:SetWidth(100)
    no:SetHeight(22)
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
