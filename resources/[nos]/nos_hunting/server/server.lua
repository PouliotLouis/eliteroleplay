local OX_INV = exports.ox_inventory
local QBX = exports.qbx_core

local config = require('config')

lib.callback.register('nos-hunting:server:addItemToPlayerInv', function(source, pedKilledHash)
    local src = source
    local player = QBX:GetPlayer(src)
    if not player then return end

    local animal = config.animals[tostring(pedKilledHash)]

    if not animal then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Dépeçage impossible !',
            description = "Impossible de dépecer cet animal.",
            type = "error",
            icon = 'fa-solid fa-drumstick-bite',
            iconColor = '#FF0000'
        })
        return
    end

    for _, loot in ipairs(animal.loot) do
        local itemName = loot.name
        local itemAmount = loot.amount

        print(itemName, itemAmount)
        -- Vérifiez si l'inventaire du joueur peut contenir l'objet
        print(OX_INV:CanCarryItem(src, itemName, itemAmount))

        if not OX_INV:CanCarryItem(src, itemName, itemAmount) then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Dépeçage impossible !',
                description = "Vos poches sont pleines !",
                type = "warning",
                icon = 'fa-solid fa-drumstick-bite',
                iconColor = '#EEFF04'
            })

            return
        end

        if itemAmount > 0 then
            -- Ajoutez l'objet à l'inventaire du joueur
            player.Functions.AddItem(itemName, itemAmount)
        end
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Dépeçage réussi !',
        description = "Vous avez dépecé l'animal avec succès.",
        type = "success",
        icon = 'fa-solid fa-drumstick-bite',
        iconColor = '#F09D9D'
    })
end)