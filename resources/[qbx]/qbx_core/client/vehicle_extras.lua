local addonVehicleNamesWithExtras = {
    ['pchall18'],
    ["pcharger18"],
    ['pcts20'],
    ['pdurango21'],
    ['pexp20'],
    ['pf15018'],
    ['pgt3rs21'],
    ['ptahoe18'],
    ['ptaurus13'],
    ['pvic11'],
    ['pwrx15'],
}

local function GetSpawnNameFromModelHash(hash)
    for name, _ in pairs(addonVehicleNamesWithExtras) do
        if GetHashKey(name) == hash then
            return name
        end
    end

    return nil
end

local authorizedZone = vec3(441.51, -985.11, 25.7)
local zoneRadius = 30

local vehExtrasAllowed = {
    police = {
        [0] = { -- Cadet
            ['ptaurus13'] = {
                [4] = "Pare-Buffle central",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [4] = "Pare-Buffle central",
                [12] = "Radar"
            },
        },
        [1] = { -- Officier
            ['pexp20'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pf15018'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [11] = "Rangement dans le coffre",
                [12] = "Radar arrière"
            },
            ['ptaurus13'] = {
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [12] = "Radar"
            },
        },
        [2] = { -- Sergent
            ['pchall18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pdurango21'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
                [8] = "Radar",
                [10] = "Spots lights",
            },
            ['pexp20'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pf15018'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [11] = "Rangement dans le coffre",
                [12] = "Radar arrière"
            },
            ['ptaurus13'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar"
            },
        },
        [3] = { -- Lieutenant
            ['pchall18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pcharger18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pdurango21'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
                [8] = "Radar",
                [10] = "Spots lights",
            },
            ['pexp20'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pf15018'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [11] = "Rangement dans le coffre",
                [12] = "Radar arrière"
            },
            ['ptaurus13'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [11] = "Antenne arrière",
                [12] = "Radar"
            },
        },
        [4] = { -- Capitaine
            ['pchall18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pcharger18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pcts20'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
            },
            ['pdurango21'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
                [8] = "Radar",
                [10] = "Spots lights",
            },
            ['pexp20'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pf15018'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [11] = "Rangement dans le coffre",
                [12] = "Radar arrière"
            },
            ['ptahoe18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['ptaurus13'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [11] = "Antenne arrière",
                [12] = "Radar"
            },
            ['pwrx15'] = {
                [1] = "Lumières pare-soleil",
                [3] = "Lumières vitre arrière",
                [4] = "Lumières calandre",
            },
        },
        [5] = { -- Chef
            ['pchall18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pcharger18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pcts20'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
            },
            ['pdurango21'] = {
                [1] = "Lumières de toit",
                [6] = "Pare-Buffle",
                [8] = "Radar",
                [10] = "Spots lights",
            },
            ['pexp20'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['pf15018'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [11] = "Rangement dans le coffre",
                [12] = "Radar arrière"
            },
            ['pgt3rs21'] = {
                [1] = "Lumières de toit",
                [2] = "2",
                [3] = "3",
                [4] = "4",
                [5] = "5",
                [6] = "6",
                [7] = "7",
                [8] = "8",
                [9] = "9",
                [10] = "10",
                [11] = "11",
                [12] = "Aileron"
            },
            ['ptahoe18'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar arrière"
            },
            ['ptaurus13'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [10] = "Antennes toit",
                [12] = "Radar"
            },
            ['pvic11'] = {
                [1] = "Lumières de toit",
                [4] = "Pare-Buffle central",
                [9] = "Spots lights",
                [11] = "Antenne arrière",
                [12] = "Radar"
            },
            ['pwrx15'] = {
                [1] = "Lumières pare-soleil",
                [3] = "Lumières vitre arrière",
                [4] = "Lumières calandre",
            },

            -- [1] = "Lumières de toit",
            -- [2] = "Lumières pare-soleil",
            -- [3] = "Lumières dashboard",
            -- [4] = "Pare-Buffle central",
            -- [5] = "Pare-Buffle bas",
            -- [6] = "Pare-Buffle complet",
            -- [7] = "Lumières de plaque",
            -- [8] = "Drogue sur le capot",
            -- [9] = "Spots lights",
            -- [10] = "Antennes toit",
            -- [11] = "Antenne arrière",
            -- [12] = "Radar"

            -- [1] = "Lumières de toit",
            -- [2] = "2",
            -- [3] = "3",
            -- [4] = "4",
            -- [5] = "5",
            -- [6] = "6",
            -- [7] = "7",
            -- [8] = "8",
            -- [9] = "9",
            -- [10] = "10",
            -- [11] = "11",
            -- [12] = "Aileron"
        },
    }
}

RegisterCommand('extras', function()
    local ped = cache.ped or PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local job = QBX.PlayerData.job.name
    local grade = QBX.PlayerData.job.grade.level
    local vehName = GetSpawnNameFromModelHash(GetEntityModel(vehicle))

    if vehicle == 0 or not DoesEntityExist(vehicle) then
        lib.notify({type = "error", description = "Tu dois être dans un véhicule."})
        return
    end

    if GetPedInVehicleSeat(vehicle, -1) ~= ped then
        lib.notify({type = "error", description = "Tu dois être le conducteur pour faire ça."})
        return
    end

    local playerCoords = GetEntityCoords(ped)
    if #(playerCoords - authorizedZone) > zoneRadius then
        lib.notify({type = "error", description = "Tu dois être dans les alentours du garage du LSPD."})
        return
    end

    if not vehExtrasAllowed[job][grade][vehName] then
        lib.notify({type = "error", description = "Aucun extra disponible pour ce véhicule."})
        return
    end

    local elements = {}
    for i, name in pairs(vehExtrasAllowed[job][grade][vehName]) do
        if DoesExtraExist(vehicle, i) then
            local enabled = IsVehicleExtraTurnedOn(vehicle, i)

            table.insert(elements, {
                title = name,
                icon = "puzzle-piece",
                description = enabled and "Activé" or "Désactivé",
                toggle = true,
                checked = enabled,
                onSelect = function()
                    local currentState = IsVehicleExtraTurnedOn(vehicle, i)
                    SetVehicleExtra(vehicle, i, currentState) -- On inverse l'état
                    lib.notify({
                        title = "Extra",
                        description = string.format("%s %s", name, currentState and "désactivé" or "activé"),
                        type = currentState and "error" or "success"
                    })
                    -- Rafraîchir le menu
                    Wait(200)
                    ExecuteCommand("extras")
                end
            })
        end
    end

    if #elements == 0 then
        lib.notify({type = "info", description = "Aucun extra disponible pour ce véhicule."})
        return
    end

    lib.registerContext({
        id = "extras_menu",
        title = "Gestion des Extras",
        options = elements
    })

    lib.showContext("extras_menu")
end)

-- Liveries command
RegisterCommand('liveries', function()
    local ped = cache.ped or PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        lib.notify({type = "error", description = "Vous devez être dans un véhicule !"})
        return
    end

    local playerCoords = GetEntityCoords(ped)
    if #(playerCoords - authorizedZone) > zoneRadius then
        lib.notify({type = "error", description = "Tu dois être dans les alentours du garage du LSPD."})
        return
    end

    local job = QBX.PlayerData.job.name
    local grade = QBX.PlayerData.job.grade.level
    local cid = QBX.PlayerData.citizenid

    -- Liste des liveries accessibles
    local liveryOptions = {}

    -- Personnalisation par citizen ID
    local citizenLiveries = {
        police = {
            ["J1JX5G5Z"] = { 4 }, -- Exemple: CID "J1JX5G5Z" Xavier Rivard
        }
    }

    -- Personnalisation par job
    local liveriesConfig = {
        police = {
            [0] = { 0 },           -- Recrue
            [1] = { 0 },           -- Officier
            [2] = { 0, 1 },        -- Sergent
            [3] = { 0, 1, 2 },     -- Lieutenant
            [4] = { 0, 1, 2, 3 },  -- Capitaine
            [5] = { 0, 1, 2, 3 }   -- Chef
        }
    }

    -- Nom des liveries par job
    local liveriesName = {
        police = {
            [0] = "LSPD",
            [1] = "LSPD Banalisé (noir)",
            [2] = "LSPD Banalisé (blanc)",
            [3] = "LSPD Banalisé (bleu)",
            [4] = "LSPD Xavier Rivard",
        },
        ranger = {
            [0] = "Ranger",
            [1] = "Ranger Chef Rivard"
        }
    }

    -- Mets les liveries par défaut du grade
    for _, l in pairs(liveriesConfig[job][grade]) do
        liveryOptions[#liveryOptions+1] = {
            title = "Wrap — " .. liveriesName[job][l],
            icon = "palette",
            onSelect = function()
                SetVehicleLivery(veh, l)
                lib.notify({type = "success", description = "Wrap changée au #" .. l})
                ExecuteCommand("liveries")
            end
        }
    end

    -- Ajoute les liveries personnels
    if citizenLiveries[job][cid] then
        for _, l in pairs(citizenLiveries[job][cid]) do
            liveryOptions[#liveryOptions+1] = {
                title = "Wrap — " .. liveriesName[job][l],
                icon = "palette",
                onSelect = function()
                    SetVehicleLivery(veh, l)
                    lib.notify({type = "success", description = "Wrap changée au #" .. l})
                    ExecuteCommand("liveries")
                end
            }
        end
    end

    -- Ouvre le menu
    lib.registerContext({
        id = 'police_livery_menu',
        title = 'Choisir un wrap',
        options = liveryOptions
    })

    lib.showContext('police_livery_menu')
end)