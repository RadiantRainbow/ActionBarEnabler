local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    if ActionBarEnablerDB then return end

    StaticPopupDialogs["ACTIONBAR_ENABLER_CONFIRM"] = {
        text = "Enable action bars 2-6? This will reload your UI.",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
            SetActionBarToggles(true, true, true, true, true, false, false, false)
            ActionBarEnablerDB = true
            ReloadUI()
        end,
        OnCancel = function()
            ActionBarEnablerDB = true
            print("Action bars 2-6 were not enabled.")
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }

    StaticPopup_Show("ACTIONBAR_ENABLER_CONFIRM")
end)
