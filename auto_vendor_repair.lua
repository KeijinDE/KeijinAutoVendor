local function KAV_FormatCopper(copper)
  local gold = math.floor(copper / (100 * 100))
  local silver = math.floor((copper - (gold * 100 * 100)) / 100)
  local copperOnly = math.fmod(copper, 100)
  return string.format("|cffffff00%dg|r |cffc7c7cf%ds|r |cffeda55f%dc|r", gold, silver, copperOnly)
end

function KAV_HandleRepair()
  if CanMerchantRepair() then
    local cost, canRepair = GetRepairAllCost()
    if canRepair and cost > 0 then
      RepairAllItems()
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Repaired gear for " .. KAV_FormatCopper(cost))
    elseif KAV_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Nothing to repair.")
    end
  elseif KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Merchant cannot repair.")
  end
end
