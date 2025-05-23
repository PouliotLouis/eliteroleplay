local config = require '@qbx_core.config.server'
local logger = require '@qbx_core.modules.logger'

local QBX = exports.qbx_core
local OX_INV = exports.ox_inventory

RegisterNetEvent('nos_drugs:server:foundIllegal', function(src, a, d)
    local src = src or source
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    logger.log({
        source = xPlayer.PlayerData.name,
        webhook = config.logging.webhook['drogues'],
        event = d.name:gsub("^%l", string.upper),
        color = 'white',
        message = ("Le joueur a %s."):format(a)
    })
end)

lib.callback.register('nos_drugs:server:hasInventorySpace', function(src, drug)
    local src = src or source
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    if OX_INV:CanCarryItem(src, drug.harvest.item, drug.harvest.max) then
        return true
    else
        return false
    end
end)

lib.callback.register('nos_drugs:server:hasItemsToTransform', function(src, drug, transformType)
    local src = src or source
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    if transformType == 1 then
        for _, item in pairs(drug.transformation.requiredItems) do
            if OX_INV:Search(src, 'count', item.name) < item.count then
                lib.notify(src, {
                    type = 'error',
                    icon = drug.transformation.icon,
                    description = item.message
                })

                return false
            end
        end
    elseif transformType == 2 then
        for _, item in pairs(drug.transformation2.requiredItems) do
            if OX_INV:Search(src, 'count', item.name) < item.count then
                lib.notify(src, {
                    type = 'error',
                    icon = drug.transformation2.icon,
                    description = item.message
                })

                return false
            end
        end
    -- elseif transformType == 3 then
    else
        for _, item in pairs(drug.transformation3.requiredItems) do
            if OX_INV:Search(src, 'count', item.name) < item.count then
                lib.notify(src, {
                    type = 'error',
                    icon = drug.transformation3.icon,
                    description = item.message
                })

                return false
            end
        end
    end

    return true;
end)

lib.callback.register('nos_drugs:server:harvest', function(src, drug)
    local src = src or source
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    local count = math.random(drug.harvest.min, drug.harvest.max)
    
    OX_INV:AddItem(src, drug.harvest.item, count, nil, nil)
end)

lib.callback.register('nos_drugs:server:transformItems', function(src, drug, transformType)
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    if transformType == 1 then
        for _, item in pairs(drug.transformation.receipeItems) do
            OX_INV:RemoveItem(src, item.name, item.count)
        end

        for _, item in pairs(drug.transformation.transformedItems) do
            OX_INV:AddItem(src, item.name, item.count)
        end
    elseif transformType == 2 then
        for _, item in pairs(drug.transformation2.receipeItems) do
            OX_INV:RemoveItem(src, item.name, item.count)
        end

        for _, item in pairs(drug.transformation2.transformedItems) do
            OX_INV:AddItem(src, item.name, item.count)
        end
    -- elseif transformType == 3 then
    else
        for _, item in pairs(drug.transformation3.receipeItems) do
            OX_INV:RemoveItem(src, item.name, item.count)
        end

        for _, item in pairs(drug.transformation3.transformedItems) do
            OX_INV:AddItem(src, item.name, item.count)
        end
    end
end)