local OX = exports.ox_inventory
local QBX = exports.qbx_core

lib.callback.register('nos-sellshops:server:getBuyerItems', function(source, buyerName)

    return SVConfig.ShopItems[buyerName] or {}

end)

local function getItemCount(source, item)
    local src = source
    
    if not src then return end
   
    local itemCount = OX:GetItemCount(source, item)
   
    return itemCount
end

lib.callback.register('nos-sellshops:server:hasItem', function(source, item)  

    return getItemCount(source, item)

end)

local function processPurchase(src, item, itemPayoutAmount, itemPayoutItem)    
    local numberOfItems = getItemCount(src, item)
  
    local message = ''
    
    local currentInventoryItem = OX:GetItem(src, item, nil, false)  
   
    local payoutAmount = itemPayoutAmount
  
    local totalPayout =  numberOfItems * payoutAmount

    local payoutItem = itemPayoutItem

    if numberOfItems > 0 then
        
        local success = OX:RemoveItem(src, item, numberOfItems)
        
        if success then 
            local payoutItemInfo = OX:GetItem(src, payoutItem, nil, false)
            local canCarry = OX:CanCarryItem(src, payoutItem, totalPayout, false)      
          
            if canCarry then -- do the can carry check to be safe. In cash rewards are something other than money or the money has weight. 
                OX:AddItem(src, payoutItem, totalPayout)
                message = 'Vous avez vendu ' .. currentInventoryItem.label   .. ' et vous avez été payé ' .. totalPayout .. ' ' .. payoutItemInfo.label
                TriggerClientEvent('nos-sellshops:client:sendNotify', src, 'success', message)                
            else
                message = 'You could not sell ' .. currentInventoryItem.label .. ' because you could not carry the payout.'
                TriggerClientEvent('nos-sellshops:client:sendNotify', src, 'error', message)
                OX:AddItem(src, item, numberOfItems)
            end               
        else
            message = 'Failed to remove ' .. currentInventoryItem.label .. ' from your inventory.'
            TriggerClientEvent('nos-sellshops:client:sendNotify', src, 'error', message)
        end
    
    end 
end

lib.callback.register('nos-sellshops:server:sellItem', function(source, item, buyerName)
    local src = source
    
    if not src then return end

    local validItem = nil
    if SVConfig.ShopItems[buyerName] then
        for i = 1, #SVConfig.ShopItems[buyerName] do
            local shopItem = SVConfig.ShopItems[buyerName][i]
            if shopItem.name == item then
                validItem = shopItem
                break
            end
        end
    end

    if not validItem then
         print('SELL SHOP WARNING: Invalid amount or payoutItem')
        return
    end

    local itemPayoutAmount = validItem.amount
    local itemPayoutItem = validItem.payoutItem

    processPurchase(src, item, itemPayoutAmount, itemPayoutItem)
end)

lib.callback.register('nos-sellshops:server:getTotalItemsPrice', function(source, currentItemIndex, buyerName)
    local src = source
    local xPlayer = QBX:GetPlayer(src)
    if not xPlayer then return end

    local payoutItemName = SVConfig.ShopItems[buyerName][currentItemIndex].name
    local payoutItemAmount = SVConfig.ShopItems[buyerName][currentItemIndex].amount
    local payoutItemLabel = SVConfig.ShopItems[buyerName][currentItemIndex].payoutItemLabel

    local playerItems = xPlayer.Functions.GetItemByName(payoutItemName)

    if not playerItems then
        return 'Tu reçois: 0$' .. ' — ' .. payoutItemLabel
    end

    local itemCount = playerItems.count
    local montantTotal = math.floor(itemCount * payoutItemAmount)

    return 'Tu reçois: ' .. montantTotal .. '$' .. ' — ' .. payoutItemLabel
end)