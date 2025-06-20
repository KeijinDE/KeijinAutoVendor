-- Startup message
DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r |cffffff88KeijinAutoVendor|r v0.1.1 – Use /kav")

SLASH_KAV1 = "/kav"
KAV_DEBUG = false

SlashCmdList["KAV"] = function(msg)
  msg = string.lower(msg or "")
  if msg == "debug" then
    KAV_DEBUG = not KAV_DEBUG
    local state = KAV_DEBUG and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Debug mode " .. state .. ".")
  else
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r KeijinAutoVendor v0.1.1 – Use /kav debug")
  end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("MERCHANT_SHOW")

frame:SetScript("OnEvent", function()
  if event == "MERCHANT_SHOW" then
    if KAV_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] MERCHANT_SHOW triggered.")
    end

    -- Sofort reparieren
    KAV_HandleRepair()

    -- Verkauf verzögert (wegen ItemCache)
    local delayFrame = CreateFrame("Frame")
    local elapsedTime = 0
    delayFrame:SetScript("OnUpdate", function()
      elapsedTime = elapsedTime + arg1
      if elapsedTime >= 0.2 then
        delayFrame:SetScript("OnUpdate", nil)
        KAV_HandleGrayItems()
      end
    end)
  end
end)
