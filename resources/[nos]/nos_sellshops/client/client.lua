local QBX = exports.ox_inventory

local function sendNotify(notifyType, message)
    exports.qbx_core:Notify(message, notifyType, 3000)
end

RegisterNetEvent('nos-sellshops:client:sendNotify')
AddEventHandler('nos-sellshops:client:sendNotify', function(notifyType, message)
    
    sendNotify(notifyType, message)
    
end)

local function LoadModel(model)
    RequestModel(model)
    local startTime = GetGameTimer()
    while not HasModelLoaded(model) do
        Wait(0)
        if GetGameTimer() - startTime > 5000 then
            DebugPrint("ERROR: Model load timeout:" .. " " .. model)
            break
        end
    end
end

local function hasItem(item)
    local itemCount = lib.callback.await('nos-sellshops:server:hasItem', false, item)
 
    local hasItem = false
    if itemCount > 0 then
        hasItem = true
    end   
   
    return hasItem
    
end

local function sellItem(item, itemPayoutAmount, itemPayoutItem, buyerName)
    lib.callback.await('nos-sellshops:server:sellItem', false, item, itemPayoutAmount, itemPayoutItem, buyerName)
end

function OpenBuyMenu(buyer)
    local buyerItems = lib.callback.await('nos-sellshops:server:getBuyerItems', false, buyer.name)

    local menu = {}
    for i = 1, #buyerItems  do
        local currentItem = buyerItems[i].name
        -- local itemPayoutAmount = buyerItems[i].amount
        local itemPayoutDesc = lib.callback.await('nos-sellshops:server:getTotalItemsPrice', false, i, buyer.name)
        menu[#menu + 1] = {       
            title = "J'achète: " .. QBX:Items(currentItem).label .. '\n' .. itemPayoutDesc,
            disabled = not hasItem(currentItem),
            onSelect = function()
                sellItem(currentItem, buyer.name )               
            end}
        end

    lib.registerContext({
        id = 'OpenBuyMenu',
        title = buyer.label,
        options = menu
    })
    lib.showContext('OpenBuyMenu')
end

for i = 1, #Config.Shops do
    local buyer = Config.Shops[i]
    LoadModel(buyer.pedModel)

    local ped = CreatePed(1, GetHashKey(buyer.pedModel), buyer.location.x, buyer.location.y, buyer.location.z - 1.0, buyer.location.w, false, true)
    SetEntityHeading(ped, buyer.location.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, buyer.pedScenario, 0, true)

    if buyer.blip then
        local blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, buyer.blip.sprite)
        SetBlipDisplay(blip, buyer.blip.display)
        SetBlipScale(blip, buyer.blip.scale)
        SetBlipColour(blip, buyer.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(buyer.label)
        EndTextCommandSetBlipName(blip)
    end

    exports.ox_target:addLocalEntity(ped, {
        label = buyer.label,
        name = buyer.name,
        icon = buyer.shopIcon,
        iconColor = buyer.shopIconColor,
        distance = 2.0,
        onSelect = function()
            OpenBuyMenu(buyer)
        end,
        
    })
end