local OX_TARG = exports.ox_target

local config = require('config')

local function isAuthorizedKillingWeapons(weaponHash)
    return config.authorizedKillingWeapons[tostring(weaponHash)] or false
end

local function isAuthorizedHarvestingWeapons(weaponHash)
    return config.authorizedHarvestingWeapons[tostring(weaponHash)] or false
end

-- Gestion de l'événement de mort d'un animal
AddEventHandler('gameEventTriggered', function(eventName, data)
    if eventName == 'CEventNetworkEntityDamage' then
        local victim = data[1]
        local attacker = data[2]
        -- local weaponHash = data[3] -- Me retourne présentement pas le bon hash
        local weaponHash = GetSelectedPedWeapon(attacker) -- Utiliser l'arme de l'attaquant

        if IsEntityAPed(victim) and not IsPedHuman(victim) and IsEntityDead(victim) then
            local pedType = GetPedType(victim)

            -- 28 = Animal
            if pedType == 28 then
                local isPedKilledByAuthorizedWeapon = isAuthorizedKillingWeapons(weaponHash)
                local pedKilledModel = GetEntityModel(victim)

                -- Utilisez ox_target pour interagir avec l'animal
                OX_TARG:addLocalEntity(victim, {
                    {
                        name = 'harvest_animal_meat',
                        label = "Dépecer l'animal",
                        icon = 'fa-solid fa-drumstick-bite',
                        iconColor = '#F09D9D',
                        onSelect = function()
                            local playerPed = PlayerPedId()
                            local playerCarryingWeapon = GetSelectedPedWeapon(playerPed)
                            local playerCarryingWeaponHash = GetHashKey(playerCarryingWeapon)
                            local hasAuthorizedHarvestingWeapon = isAuthorizedHarvestingWeapons(playerCarryingWeaponHash)

                            if hasAuthorizedHarvestingWeapon then
                                if not isPedKilledByAuthorizedWeapon then
                                    -- Affichez une notification pour le joueur
                                    lib.notify({
                                        title = 'Dépecage impossible',
                                        description = "La viande de cet animal est trop abîmée pour être récoltée.",
                                        type = 'warning',
                                        icon = 'fa-solid fa-drumstick-bite',
                                        iconColor = '#EEFF04'
                                    })
                                    DeleteEntity(victim)
                                    
                                    return
                                end

                                if lib.progressBar({
                                    duration = math.random(2500, 5000),
                                    label = 'Dépeçage en cours...',
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        move = true,
                                        car = true,
                                        combat = true,
                                    },
                                    anim = {
                                        dict = 'anim@gangops@facility@servers@bodysearch@',
                                        clip = 'player_search',
                                    }
                                }) then
                                    DeleteEntity(victim)
                                    lib.callback.await('nos-hunting:server:addItemToPlayerInv', false, pedKilledModel)
                                else 
                                    TriggerEvent('chat:addMessage', {
                                            args = { "Récolte annulée." }
                                        })
                                end
                            else
                                lib.notify({
                                    title = 'Dépecage impossible',
                                    description = "Vous avez besoin d'un couteau pour récolter la viande.",
                                    type = 'warning',
                                    icon = 'fa-solid fa-drumstick-bite',
                                    iconColor = '#EEFF04'
                                })
                            end
                        end
                    }
                })
            end
        end
    end
end)
