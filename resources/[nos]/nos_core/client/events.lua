local OX = exports.ox_lib
local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData then return end

    local job = playerData.job.name

    if job == 'police' then
        TriggerEvent('wasabi_police:client:checkDuty', nil, false)
    elseif job == 'ems' then
        TriggerEvent('wasabi_ambulance:client:checkDuty', nil, false)
    end
end)

RegisterNetEvent('NosCore:client:RemoveRadialItem', function(item)
    for i = 1, #item do
        OX:removeRadialItem(item[i])
    end
end)