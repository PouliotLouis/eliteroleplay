local OX_TARG = exports.ox_target
local OX_INV = exports.ox_inventory

local drugs = require('config.drugs')
local transfoConfig = require('config.transformation')

local debug = false

for _, drug in pairs(drugs) do
    OX_TARG:addBoxZone({
        coords = drug.harvest.coords,
        size = drug.harvest.size,
        rotation = drug.harvest.rotation,
        drawSprite = false,
        debug = debug,
        options = {
            {
                name = 'harvest_' .. drug.name,
                icon = drug.harvest.icon,
                iconColor = drug.harvest.iconColor,
                label = drug.harvest.label,
                distance = 1,
                onSelect = function()
                    if drug.harvest.requiredItem and OX_INV:Search('count', drug.harvest.requiredItem) < 1 then
                        TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'tenté de récolter ➜ ' .. drug.harvest.name, drug)

                        lib.notify({
                            type = 'error',
                            icon = drug.harvest.icon,
                            description = "Vous n'avez pas l'outil nécessaire pour récolter !"
                        })

                        return
                    end

                    TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'commencé à récolter ➜ ' .. drug.harvest.name, drug)

                    while true do
                        if not lib.callback.await('nos_drugs:server:hasInventorySpace', false, drug) then
                            lib.notify({
                                type = 'error',
                                icon = drug.harvest.icon,
                                description = "Vous n'avez plus de place dans vos poches !"
                            })
                            break
                        end

                        local isHarvesting = lib.progressCircle({
                            label = 'Récolte en cours...',
                            position = 'bottom',
                            duration = drug.harvest.duration,
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                                combat = true
                            },
                            anim = {
                                dict = 'amb@world_human_gardener_plant@male@enter',
                                clip = 'enter'
                            },
                        })

                        if not isHarvesting then
                            lib.notify({
                                type = 'warning',
                                icon = drug.harvest.icon,
                                description = 'Vous avez arrêté de récolter.'
                            })
                            break
                        end

                        lib.callback.await('nos_drugs:server:harvest', false, drug)
                    end
                end
            }
        }
    })

    OX_TARG:addBoxZone({
        coords = drug.transformation.coords,
        size = drug.transformation.size,
        rotation = drug.transformation.rotation,
        drawSprite = false,
        debug = debug,
        options = {
            {
                name = 'transformation_' .. drug.name,
                icon = drug.transformation.icon,
                iconColor = drug.transformation.iconColor,
                label = drug.transformation.label,
                distance = 1,
                onSelect = function()
                    local firstTimeTrying = true

                    while true do
                        if not lib.callback.await('nos_drugs:server:hasItemsToTransform', false, drug, 1) then
                            if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'tenté de transformer ➜ ' .. drug.transformation.name, drug) end
                            break
                        else
                            if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'commencé à transformer ➜ ' .. drug.transformation.name, drug) end
                            firstTimeTrying = false
                        end

                        local isTransforming = lib.progressCircle({
                            label = 'Transformation en cours...',
                            position = 'bottom',
                            duration = drug.transformation.duration,
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                                combat = true
                            },
                            anim = drug.transformation.anim,
                        })

                        if not isTransforming then
                                lib.notify({
                                    type = 'warning',
                                    icon = drug.transformation.icon,
                                    description = 'Vous avez arrêté de transformer.'
                                })

                            break
                        end
                        
                        lib.callback.await('nos_drugs:server:transformItems', false, drug, 1)
                    end
                end
            }
        }
    })

    if drug.transformation2 then
        OX_TARG:addBoxZone({
            coords = drug.transformation2.coords,
            size = drug.transformation2.size,
            rotation = drug.transformation2.rotation,
            drawSprite = false,
            debug = debug,
            options = {
                {
                    name = 'transformation2_' .. drug.name,
                    icon = drug.transformation2.icon,
                    iconColor = drug.transformation2.iconColor,
                    label = drug.transformation2.label,
                    distance = 1.5,
                    onSelect = function()
                        local firstTimeTrying = true

                        while true do
                            if not lib.callback.await('nos_drugs:server:hasItemsToTransform', false, drug, 2) then
                                if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'tenté de transformer ➜ ' .. drug.transformation2.name, drug) end
                                break
                            else
                                if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'commencé à transformer ➜ ' .. drug.transformation2.name, drug) end
                                firstTimeTrying = false
                            end

                            local isTransforming = lib.progressCircle({
                                label = 'Transformation en cours...',
                                position = 'bottom',
                                duration = drug.transformation2.duration,
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                    move = true,
                                    combat = true
                                },
                                anim = drug.transformation2.anim,
                            })

                            if not isTransforming then
                                    lib.notify({
                                        type = 'warning',
                                        icon = drug.transformation2.icon,
                                        description = 'Vous avez arrêté de transformer.'
                                    })

                                break
                            end
                            
                            lib.callback.await('nos_drugs:server:transformItems', false, drug, 2)
                        end
                    end
                }
            }
        })
    end

    if drug.transformation3 then
        OX_TARG:addBoxZone({
            coords = drug.transformation3.coords,
            size = drug.transformation3.size,
            rotation = drug.transformation3.rotation,
            drawSprite = false,
            debug = debug,
            options = {
                {
                    name = 'transformation3_' .. drug.name,
                    icon = drug.transformation3.icon,
                    iconColor = drug.transformation3.iconColor,
                    label = drug.transformation3.label,
                    distance = 1.5,
                    onSelect = function()
                        local firstTimeTrying = true

                        while true do
                            if not lib.callback.await('nos_drugs:server:hasItemsToTransform', false, drug, 3) then
                                if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'tenté de transformer ➜ ' .. drug.transformation3.name, drug) end
                                break
                            else
                                if firstTimeTrying then TriggerServerEvent('nos_drugs:server:foundIllegal', false, 'commencé à transformer ➜ ' .. drug.transformation3.name, drug) end
                                firstTimeTrying = false
                            end

                            local isTransforming = lib.progressCircle({
                                label = 'Transformation en cours...',
                                position = 'bottom',
                                duration = drug.transformation3.duration,
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                    move = true,
                                    combat = true
                                },
                                anim = drug.transformation3.anim,
                            })

                            if not isTransforming then
                                    lib.notify({
                                        type = 'warning',
                                        icon = drug.transformation3.icon,
                                        description = 'Vous avez arrêté de transformer.'
                                    })

                                break
                            end
                            
                            lib.callback.await('nos_drugs:server:transformItems', false, drug, 3)
                        end
                    end
                }
            }
        })
    end
end

-- for _, transfo in pairs(transfoConfig) do
--     OX_TARG:addBoxZone({
--         coords = transfo.point_de_transformation,
--         size = transfo.point_de_transformation_size,
--         rotation = transfo.point_de_transformation_rotation,
--         debug = transfo.point_de_transformation_debug,
--         options = {
--             {
--                 name = 'transformation_oxy',
--                 icon = transfo.box_icon,
--                 label = transfo.box_label,
--                 onSelect = function()
--                     local shouldTransform = lib.callback.await('nos-drugs:server:hasItemToTransform', false,  transfo)

--                     while shouldTransform do
--                         local result = lib.progressBar({
--                             duration = transfo.message_transformation.duration,
--                             label = "Transformation en cours...",
--                             useWhileDead = false,
--                             canCancel = true,
--                             disable = {
--                                 move = true,
--                                 car = true,
--                                 combat = true,
--                             }
--                         })

--                         if not result then
--                             lib.notify({
--                                 title = 'Transformation annulée',
--                                 description = "Tu as arrêté le processus de transformation.",
--                                 type = 'error',
--                                 icon = transfo.box_icon,
--                                 iconColor = 'FF0000'
--                             })
                
--                             break
--                         end

--                         lib.callback.await('nos-drugs:server:removeTransformedItem', false, transfo)

--                         Wait(100)

--                         shouldTransform = lib.callback.await('nos-drugs:server:hasItemToTransform', false, transfo)
--                     end
--                 end
--             }
--         }
--     })
-- end

-- RegisterNetEvent('nos:client:grindWeed', function()
--     local shouldGrind = lib.callback.await('nos-drugs:server:hasItemToGrindWeed')

--     while shouldGrind do
--         local result = lib.progressBar({
--             duration = 2000,
--             label = "Broyage du weed...",
--             useWhileDead = false,
--             canCancel = true,
--             disable = {
--                 sprint = true,
--                 car = true,
--                 combat = true,
--             }
--         })

--         if not result then
--             lib.notify({
--                 title = 'Broyage annulé',
--                 description = "Tu as arrêté de broyer du weed.",
--                 type = 'error',
--                 icon = 'cannabis',
--                 iconColor = 'FF0000'
--             })

--             break
--         end

--         lib.callback.await('nos-drugs:server:removeGrindedItem')

--         Wait(100)

--         shouldGrind = lib.callback.await('nos-drugs:server:hasItemToGrindWeed')
--     end
-- end)
