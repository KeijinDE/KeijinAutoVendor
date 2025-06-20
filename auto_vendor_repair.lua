-- auto_vendor_repair.lua

function KAV_HandleRepair()
  local cost, canRepair = GetRepairAllCost()

  if KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Repair check: cost=" .. tostring(cost) .. ", canRepair=" .. tostring(canRepair))
  end

  if cost and cost > 0 and canRepair then
    RepairAllItems()
    if KAV_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Repaired items for " .. GetCoinTextureString(cost))
    end
  else
    if KAV_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] Nothing to repair.")
    end
  end
end