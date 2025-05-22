local QBX = exports.qbx_core
local OX = exports.ox_inventory
local config = require 'config.server'

local function getAvailableDrugs(source)
    local availableDrugs = {}
    local player = exports.qbx_core:GetPlayer(source)

    if not player then return nil end

    for i = 1, #config.cornerSellingDrugsList do
        local itemName = config.cornerSellingDrugsList[i]
        local itemCount = OX:Search(source, 'count', itemName)
        if itemCount > 0 then
            availableDrugs[#availableDrugs + 1] = {
                item = itemName,
                amount = itemCount,
                label = OX:Items()[itemName].label
            }
        end
    end
    return table.type(availableDrugs) ~= 'empty' and availableDrugs or nil
end

lib.callback.register('qb-drugs:server:getDrugOffer', function(source)
    local player = QBX:GetPlayer(source)
    if not player then return nil end
    local availableDrugs = getAvailableDrugs(player.PlayerData.source)
    if availableDrugs == nil then return nil end

    local randomDrug = math.random(1, #availableDrugs)
    local chosenDrug = availableDrugs[randomDrug]
    local offeredAmount = math.random(1, chosenDrug.amount > 15 and 15 or chosenDrug.amount)
    local basePrice = math.random(config.cornerSellingDrugsPrice[chosenDrug.item].min, config.cornerSellingDrugsPrice[chosenDrug.item].max)

    local amIBeingScammed = config.chanceToGetScam >= math.random(1, 100)
    local normalPrice = basePrice * offeredAmount
    local scamPrice = math.random(1, 3) * offeredAmount

    local totalPrice = amIBeingScammed and scamPrice or basePrice * offeredAmount

    return { chosen = chosenDrug, idx = randomDrug, amount = offeredAmount, total = totalPrice }
end)

RegisterNetEvent('qb-drugs:server:giveStealItems', function(drugType, amount)
    local availableDrugs = getAvailableDrugs(source)
    local player = QBX:GetPlayer(source)

    if not availableDrugs or not player then return end

    OX:AddItem(player.PlayerData.source, availableDrugs[drugType].item, amount)
    OX:AddItem(player.PlayerData.source, "money", math.random(130, 209))
end)

RegisterNetEvent('qb-drugs:server:sellCornerDrugs', function(drugType, amount, price)
    local player = exports.qbx_core:GetPlayer(source)
    local availableDrugs = getAvailableDrugs(player.PlayerData.source)

    if not availableDrugs or not player then return end

    local item = availableDrugs[drugType].item

    local hasItem = player.Functions.GetItemByName(item)
    if hasItem.amount >= amount then
        exports.qbx_core:Notify(player.PlayerData.source, locale('success.offer_accepted'), 'success')
        exports.ox_inventory:RemoveItem(player.PlayerData.source, item, amount)
        player.Functions.AddMoney('cash', price, 'sold-cornerdrugs')
        if config.policeCallChance >= math.random(1, 100) then
            TriggerEvent('police:server:policeAlert', locale('info.possible_drug_dealing'), nil, player.PlayerData.source)
        end
    else
        TriggerClientEvent('qb-drugs:client:cornerselling', player.PlayerData.source)
    end
end)

RegisterNetEvent('qb-drugs:server:robCornerDrugs', function(drugType, amount)
    local player = exports.qbx_core:GetPlayer(source)
    local availableDrugs = getAvailableDrugs(player.PlayerData.source)

    if not availableDrugs or not player then return end

    local item = availableDrugs[drugType].item

    exports.ox_inventory:RemoveItem(player.PlayerData.source, item, amount)
end)
