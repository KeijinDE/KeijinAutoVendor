
-- GrayAutoSell logic (adapted to KeijinAutoVendor)
KAV_DEBUG = false
local SELL = true
local grayItemPool = {}
local poolRunnerFrame = CreateFrame("Frame")
local sellDelay = 0.2

local function debug(text)
  if KAV_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r [Debug] " .. text)
  end
end

local function poolRunner()
  debug("Pool runner started at: " .. GetTime())
  local endTime = GetTime() + sellDelay

  poolRunnerFrame:SetScript("OnUpdate", function()
    if (endTime < GetTime()) then
      local e = table.remove(grayItemPool)
      if e then
        debug("Processing Bag: " .. e.bag .. " Slot: " .. e.slot)
        if SELL then
          UseContainerItem(e.bag, e.slot)
        else
          debug("NOT SOLD, SELL=false")
        end
      else
        poolRunnerFrame:SetScript("OnUpdate", nil)
        debug("Pool runner finished at: " .. GetTime())
      end
    end
  end)
end

function KAV_HandleGrayItems()
  for bag = 0, NUM_BAG_SLOTS do
    for slot = 1, GetContainerNumSlots(bag) do
      local itemLink = GetContainerItemLink(bag, slot)
      if itemLink then
        local _, _, itemID = string.find(itemLink, "item:(%d+):")
        if itemID then
          local name, _, rarity = GetItemInfo(tonumber(itemID))
          if rarity == 0 then
            debug("Queued gray item: " .. name)
            table.insert(grayItemPool, {bag = bag, slot = slot})
          end
        end
      end
    end
  end
  debug("Gray items found: " .. table.getn(grayItemPool))
  poolRunner()
end
