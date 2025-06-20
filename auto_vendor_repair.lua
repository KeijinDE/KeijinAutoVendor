
function KAV_HandleRepair()
  if CanMerchantRepair() then
    local cost, canRepair = GetRepairAllCost()
    if canRepair and cost > 0 then
      RepairAllItems()
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r Repaired gear for " .. GetCoinTextureString(cost))
    elseif KAV_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Nothing to repair.")
    end
  elseif KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Merchant cannot repair.")
  end
end
