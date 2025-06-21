-- auto_vendor_repair.lua

local function Print(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r " .. msg)
end

local function Debug(msg)
  if KAV_DebugMode then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons][Debug]|r " .. msg)
  end
end

local function SafeCoinString(amount)
  if type(GetCoinTextureString) == "function" then
    return GetCoinTextureString(amount)
  else
    return tostring(amount) .. " copper"
  end
end

function KAV_HandleRepair()
  local canRepair = CanMerchantRepair()
  local repairCost = 0

  if type(GetRepairAllCost) == "function" then
    local cost, possible = GetRepairAllCost()
    repairCost = cost or 0
    canRepair = canRepair and possible
  end

  Debug("Repair check. cost=" .. tostring(repairCost) .. ", canRepair=" .. tostring(canRepair))

  if canRepair and repairCost > 0 then
    RepairAllItems()
    Debug("Repaired gear for " .. SafeCoinString(repairCost))
  elseif canRepair then
    Debug("Nothing to repair.")
  end
end
