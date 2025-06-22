-- auto_vendor_repair.lua

local function Print(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAutoVendor]|r " .. msg)
end

local function Debug(msg)
  if KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAutoVendor][Debug]|r " .. msg)
  end
end

local function SafeCoinString(amount)
  return tostring(amount) .. " copper"
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
    Print("Repaired gear for " .. SafeCoinString(repairCost))
  elseif canRepair then
    Print("No repairs needed.")
  end
end
