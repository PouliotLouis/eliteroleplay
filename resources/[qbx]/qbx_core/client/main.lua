QBX = {}

---@diagnostic disable-next-line: missing-fields
QBX.PlayerData = {}
QBX.Shared = require 'shared.main'
QBX.IsLoggedIn = false

SetDefaultVehicleNumberPlateTextPattern(-1, GetConvar("qbx:plateFormat", ".11 AAA"));

---@return table<string, Vehicle>
---@overload fun(key: string): Vehicle
function GetVehiclesByName(key)
    local vehicles = QBX.Shared.Vehicles
    return vehicles[key] or vehicles
end

exports('GetVehiclesByName', GetVehiclesByName)

---@return table<number, Vehicle>
---@overload fun(key: number): Vehicle
function GetVehiclesByHash(key)
    local vehicles = QBX.Shared.VehicleHashes
    return vehicles[key] or vehicles
end

exports('GetVehiclesByHash', GetVehiclesByHash)

---@return table<string, Vehicle[]>
function GetVehiclesByCategory()
    return qbx.table.mapBySubfield(QBX.Shared.Vehicles, 'category')
end

exports('GetVehiclesByCategory', GetVehiclesByCategory)

---@return table<number, Weapon>
---@overload fun(key: number): Weapon
function GetWeapons(key)
    local weapons = QBX.Shared.Weapons
    return weapons[key] or weapons
end

exports('GetWeapons', GetWeapons)

---@deprecated
---@return table<string, vector4>
function GetLocations()
    return QBX.Shared.Locations
end

---@diagnostic disable-next-line: deprecated
exports('GetLocations', GetLocations)

AddStateBagChangeHandler('isLoggedIn', ('player:%s'):format(cache.serverId), function(_, _, value)
    QBX.IsLoggedIn = value
end)

lib.callback.register('qbx_core:client:setHealth', function(health)
    SetEntityHealth(cache.ped, health)
end)

local mapText = require 'config.client'.pauseMapText
if mapText == '' or type(mapText) ~= 'string' then mapText = 'FiveM' end
AddTextEntry('FE_THDR_GTAO', mapText)

CreateThread(function()
    for _, v in pairs(GetVehiclesByName()) do
        if v.model and v.name then
            local gameName = GetDisplayNameFromVehicleModel(v.model)
            if gameName and gameName ~= 'CARNOTFOUND' then
                AddTextEntryByHash(joaat(gameName), v.name)
                
                -- Ajout des véhicules qui crée des erreurs de chargement
            elseif
                v.model ~= 'freightcar3' and
                v.model ~= 'coquette6' and
                v.model ~= 'chavosv6' and
                v.model ~= 'polterminus' and
                v.model ~= 'banshee3' and
                v.model ~= 'jester5' and
                v.model ~= 'driftcheburek' and
                v.model ~= 'titan2' and
                v.model ~= 'uranus' and
                v.model ~= 'firebolt' and
                v.model ~= 'driftfuto2' and
                v.model ~= 'duster2' and
                v.model ~= 'polcoquette4' and
                v.model ~= 'polcaracara' and
                v.model ~= 'cargobob5' and
                v.model ~= 'youga5' and
                v.model ~= 'driftjester3'
            then
                lib.print.warn(('Could not find gameName value in vehicles.meta for vehicle model %s'):format(v.model))
            end
        end
    end
end)

lib.callback.register('qbx_core:client:getVehicleClasses', function()
    local models = GetAllVehicleModels()
    local classes = {}
    for i = 1, #models do
        local model = models[i]
        local class = GetVehicleClassFromName(model)
        classes[joaat(model)] = class
    end
    return classes
end)
