local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    if ActionBarEnablerDB then return end

    StaticPopupDialogs["ACTIONBAR_ENABLER_CONFIRM"] = {
        text = "Enable action bars 2-6? This will reload your UI.",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
            SetActionBarToggles(1, 1, 1, 1, 1, 0, 0, 0)
            ActionBarEnablerDB = true
            ReloadUI()
        end,
        OnCancel = function()
            ActionBarEnablerDB = true
            DEFAULT_CHAT_FRAME:AddMessage("Action bars 2-6 were not enabled.")
        end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1,
    }

    StaticPopup_Show("ACTIONBAR_ENABLER_CONFIRM")
end)
