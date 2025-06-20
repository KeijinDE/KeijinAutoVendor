
DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r |cffffff88KeijinAutoVendor|r v0.1.0 – Use /kav")

SLASH_KAV1 = "/kav"
SlashCmdList["KAV"] = function(msg)
  msg = string.lower(msg or "")
  if msg == "debug" then
    KAV_DEBUG = not KAV_DEBUG
    local state = KAV_DEBUG and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Debug mode " .. state .. ".")
  else
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Auto-sells gray items & repairs gear.")
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Use /kav debug")
  end
end

-- Register for merchant event globally
local frame = CreateFrame("Frame")
frame:RegisterEvent("MERCHANT_SHOW")
frame:SetScript("OnEvent", function()
  if KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] MERCHANT_SHOW triggered.")
  end
  KAV_HandleRepair()
  KAV_HandleGrayItems()
end)
