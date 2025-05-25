local OX = exports.ox_target

local IPLs = require('config.IPLs')

for _, IPL in pairs(IPLs) do
    OX:addBoxZone({
        name = IPL.name,
        coords = IPL.entrance.coords,
        size = IPL.entrance.size,
        rotation = IPL.entrance.rotation,
        drawSprite = false,
        options = {
            label = IPL.entrance.label or "Entrer dans le batiment",
            distance = 1,
            icon = IPL.icon,
            iconColor = IPL.iconColor or "red",
            onSelect = function ()
                local ped = cache.ped or PlayerPedId()

                DoScreenFadeOut(300)
                while not IsScreenFadedOut() do
                    Wait(100)
                end

                SetEntityCoords(ped, IPL.spawn_entrance.x, IPL.spawn_entrance.y, IPL.spawn_entrance.z)
                SetEntityHeading(ped, IPL.spawn_entrance.w)

                Wait(700)
                DoScreenFadeIn(300)
            end
        }
    })

    OX:addBoxZone({
        name = IPL.name,
        coords = IPL.exit.coords,
        size = IPL.exit.size,
        rotation = IPL.exit.rotation,
        drawSprite = false,
        options = {
            label = IPL.exit.label or "Sortir du batiment",
            distance = 1,
            icon = IPL.icon,
            iconColor = IPL.iconColor or "red",
            onSelect = function ()
                local ped = cache.ped or PlayerPedId()

                DoScreenFadeOut(300)
                while not IsScreenFadedOut() do
                    Wait(100)
                end
                
                SetEntityCoords(ped, IPL.spawn_exit.x, IPL.spawn_exit.y, IPL.spawn_exit.z)
                SetEntityHeading(ped, IPL.spawn_exit.w)

                Wait(700)
                DoScreenFadeIn(300)
            end
        }
    }) 
end