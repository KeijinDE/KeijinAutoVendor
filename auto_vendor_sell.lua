-- auto_vendor_sell.lua

local SELL = true
local grayItemPool = {}
local poolRunnerFrame = CreateFrame("Frame")
local sellDelay = 0.2
local soldItemCount = 0

local function debug(text)
  if KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAutoVendor]|r [Debug] " .. text)
  end
end

local function print(text)
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAutoVendor]|r " .. text)
end

local function poolRunner()
  local endTime = GetTime() + sellDelay
  poolRunnerFrame:SetScript("OnUpdate", function()
    if GetTime() >= endTime then
      local e = table.remove(grayItemPool)
      if e then
        if SELL then
          UseContainerItem(e.bag, e.slot)
          soldItemCount = soldItemCount + 1
        else
          debug("Skipping sell (SELL = false)")
        end
      else
        poolRunnerFrame:SetScript("OnUpdate", nil)
        if soldItemCount > 0 then
          print("Sold " .. tostring(soldItemCount) .. " gray item(s).")
        else
          print("No gray items to sell.")
        end
        debug("Pool runner finished at: " .. GetTime())
      end
    end
  end)
end

function KAV_HandleGrayItems()
  soldItemCount = 0
  for bag = 0, NUM_BAG_SLOTS do
    for slot = 1, GetContainerNumSlots(bag) do
      local link = GetContainerItemLink(bag, slot)
      if link then
        local _, _, itemID = string.find(link, "item:(%d+):")
        local name, _, rarity = GetItemInfo(itemID)
        if rarity == 0 then
          debug("Queued gray item: " .. name)
          table.insert(grayItemPool, { bag = bag, slot = slot })
        end
      end
    end
  end

  if table.getn(grayItemPool) > 0 then
    debug("Gray items found: " .. table.getn(grayItemPool))
    poolRunner()
  else
    print("No gray items to sell.")
  end
end
