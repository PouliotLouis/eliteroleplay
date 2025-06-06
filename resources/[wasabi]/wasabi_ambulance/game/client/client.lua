-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
isDead, disableKeys, isReviving, inMenu, medbagCoords, isBusy, Authorized, OnPainKillers, GameShake, InjuryRunning, IsCheckedIn, EMSAvailable =
    nil, nil, nil, nil, nil, nil, nil, false, false, false, false, 0
NassPaintball = nil
local deathInjury, previousHealth, previousArmour
plyRequests = {}
currentDrugEffect, nodOutRunning = false, false
local targetedVehicle = nil
local isPlayerLoaded = false

CreateThread(function()
    while not wsb.playerLoaded do Wait(1000) end
    isPlayerLoaded = true

    if Config.policeCanTreat and Config.policeCanTreat.enabled and wsb.hasGroup(Config.policeCanTreat.jobs) then
        Authorized = true
    end
    if Config.UseRadialMenu then
        AddRadialItems()
    end
    if Config.targetSystem then
        wsb.target.model({ Config.BagProp }, {
            options = {
                {
                    event = 'wasabi_ambulance:pickupBag',
                    icon = 'fas fa-hand-paper',
                    label = Strings.pickup_bag_target,
                    distance = 1.5,
                    canInteract = function(entity)
                        local canInteract = false
                        if Entity(entity).state.useable then canInteract = true end
                        if isPlayerDead() or IsPedInAnyVehicle(wsb.cache.ped, false) then canInteract = false end
                        return canInteract
                    end
                },
                {
                    event = 'wasabi_ambulance:interactBag',
                    icon = 'fas fa-briefcase',
                    label = Strings.interact_bag_target,
                    distance = 1.5,
                    canInteract = function(entity)
                        local canInteract = false
                        if Entity(entity).state.useable then canInteract = true end
                        if isPlayerDead() or IsPedInAnyVehicle(wsb.cache.ped, false) then canInteract = false end
                        return canInteract
                    end
                },
            },
            job = 'all',
            distance = 1.5
        })
        wsb.target.player({
            options = {
                {
                    event = 'wasabi_ambulance:diagnosePlayer',
                    icon = 'fas fa-stethoscope',
                    label = Strings.diagnose_patient,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        return true
                    end,
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:reviveTarget',
                    icon = 'fas fa-medkit',
                    label = Strings.revive_patient,
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:healTarget',
                    icon = 'fas fa-bandage',
                    label = Strings.heal_patient,
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:useSedative',
                    icon = 'fas fa-syringe',
                    label = Strings.sedate_patient,
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                }
            },
            distance = 1.5
        })

        wsb.target.vehicle({
            options = {
                --[[                {
                    event = 'wasabi_ambulance:enterBackVehicle',
                    icon = 'fas fa-car',
                    label = Strings.enter_vehicle_back,
                    canInteract = function(entity)
                        if not wsb.isOnDuty() then return false end
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) or MovingStretcher then return false end
                        return true
                    end,
                    job = Config.ambulanceJob,
                    groups = Config.ambulanceJob
                },]] -- Lame
                {
                    event = 'wasabi_ambulance:toggleStretcher',
                    icon = 'fas fa-car',
                    label = Strings.toggle_stretcher,
                    canInteract = function(entity)
                        if not wsb.isOnDuty() then return false end
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) or MovingStretcher then return false end
                        local alreadyDeployed = HasAmbulanceSpawnedStretcher(VehToNet(entity))
                        local stretcherInside = GetStretcherInVehicle(entity)
                        return not alreadyDeployed or stretcherInside
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:stretcherInVehicle',
                    icon = 'fas fa-car',
                    label = Strings.stretcher_in_vehicle,
                    canInteract = function(entity)
                        if not wsb.isOnDuty() then return false end
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) then return false end
                        local stretcherInside = GetStretcherInVehicle(entity)
                        if stretcherInside then return false end
                        if MovingStretcher then return true end
                        if not GetClosestStretcher(3.0) then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:removeDeadFromVehicle',
                    icon = 'fas fa-car',
                    label = Strings.remove_dead_target,
                    canInteract = function(entity)
                        if not wsb.isOnDuty() then return false end
                        local deadPlayerID = GetDeadPlayerInsideVehicle(entity)
                        return deadPlayerID
                    end
                },
                {
                    event = 'wasabi_ambulance:placeInVehicle',
                    icon = 'fas fa-car',
                    label = Strings.place_patient,
                    canInteract = function(entity)
                        if not wsb.isOnDuty() then return false end
                        if not IsVehicleAmbulance(entity) then return false end
                        local coords = GetEntityCoords(entity)
                        local closestPlayer = wsb.getClosestPlayer(coords, 4.0)
                        if not closestPlayer then return false end
                        targetedVehicle = entity
                        if IsPedInAnyVehicle(GetPlayerPed(closestPlayer), false) then return true end
                        if not Config.EnableStretcher then return true end
                        if IsPlayerUsingStretcher(closestPlayer) then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
            },
            distance = 1.5
        })
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not wsb or not wsb.playerLoaded then return end
    if Config.UseRadialMenu then AddRadialItems() end
    TriggerServerEvent('wasabi_ambulance:requestSync', true)
end)

AddEventHandler('onClientMapStart', function()
    if Config.DisableSpawnManagerExecute then return end
    exports.spawnmanager:spawnPlayer()
    Wait(5000)
    exports.spawnmanager:setAutoSpawn(false)
end)

wsb.onCache('ped', function(ped)
    if not DoesEntityExist(ped) then return end
    if ped == wsb.cache.ped then return end
    SetHealthDefaults()
end)

RegisterNetEvent('wasabi_ambulance:setEMSOnline', function(ems)
    EMSAvailable = ems
    SendNUIMessage({
        action = 'updateEmsOnline',
        emsOnline = EMSAvailable or 0,
        translationStrings = UIStrings,
        showCount = Config.ShowEMSCountOnDeath or false
    })
end)

RegisterNetEvent('wasabi_bridge:playerLoaded', function()
    while not wsb?.playerLoaded and not wsb?.playerData?.job do Wait(1000) end
    local nassPaintball = GetResourceState('nass_paintball')
    if Config.NassPaintball.autoDetect and (nassPaintball == 'started' or nassPaintball == 'starting') then
        NassPaintball = true
    end
    if Config.AntiCombatLog.enabled then
        CreateThread(function()
            while not DoesEntityExist(PlayerPedId()) do Wait(500) end
            local dead
            if wsb.framework == 'qb' then
                dead = wsb.playerData.metadata["isdead"] or false
                if not dead and Config.LastStand then
                    dead = wsb.playerData.metadata["inlaststand"] or false
                end
            elseif wsb.framework == 'esx' then
                dead = wsb.awaitServerCallback('wasabi_ambulance:checkDeath')
            end
            if dead then
                Wait(Config.CombatLogCheckWait or 3000)
                SetEntityHealth(PlayerPedId(), 0)
                if Config.AntiCombatLog.notification.enabled then
                    TriggerEvent('wasabi_bridge:notify', Config.AntiCombatLog.notification.title,
                        Config.AntiCombatLog.notification.desc, 'error', 'skull-crossbones')
                end
            else
                local previousVitals = wsb.awaitServerCallback('wasabi_ambulance:checkPreviousVitals')
                if previousVitals then
                    Wait(3000)
                    if previousVitals.health then
                        SetEntityHealth(PlayerPedId(), previousVitals.health)
                    end
                    if previousVitals.injuries and next(previousVitals.injuries) then
                        PlayerInjury = previousVitals.injuries
                        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
                    end
                end
            end
        end)
    elseif wsb.framework == 'qb' then
        if wsb.playerData.metadata["isdead"] or wsb.playerData.metadata["inlaststand"] then
            TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, false)
            wsb.playerData.metadata["isdead"] = false
            wsb.playerData.metadata["inlaststand"] = false
        end
    end
    Wait(3000)
    TriggerServerEvent('wasabi_ambulance:requestSync')
end)

RegisterNetEvent('wasabi_bridge:setJob', function(job)
    TriggerServerEvent('wasabi_ambulance:requestSync')
    Authorized = false
    if Config?.policeCanTreat?.enabled then
        if wsb.hasGroup(Config.policeCanTreat.jobs) then
            Authorized = true
        end
    end
    if wsb.framework == 'qb' then
        local ambulanceJob = false
        for _, jobType in ipairs(Config.ambulanceJobs) do
            if job.name == jobType then
                ambulanceJob = true
                break
            end
        end

        if ambulanceJob then
            if Config.UseRadialMenu then
                AddRadialItems()
            end
        else
            if Config.UseRadialMenu then
                RemoveRadialItems()
            end
        end
        return
    end
    if wsb.isOnDuty() and wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
        if Config.UseRadialMenu then
            RemoveRadialItems()
        end
    else
        if Config.UseRadialMenu then
            AddRadialItems()
        end
    end
end)

if Config.lowHealthAlert.enabled then
    CreateThread(function()
        local notified
        while true do
            Wait(1500)
            local health = GetEntityHealth(wsb.cache.ped)
            if health ~= 0 and health < Config.lowHealthAlert.health and not notified then
                TriggerEvent('wasabi_bridge:notify', Config.lowHealthAlert.notification.title,
                    Config.lowHealthAlert.notification.description, 'error')
                notified = true
            elseif notified and health >= Config.lowHealthAlert.health then
                notified = nil
            end
        end
    end)
end

CreateThread(function()
    local setDeadFace = false
    while true do
        local sleep = 1500
        if isDead and (IsPedArmed(wsb.cache.ped, 1) or IsPedArmed(wsb.cache.ped, 2) or IsPedArmed(wsb.cache.ped, 4)) then
            SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
        end
        if isDead == 'dead' or disableKeys or (isDead == 'laststand' and Config.DisableLastStandCrawl) then
            sleep = 0
            DisableAllControlActions(0)
            for k, data in pairs(Config.EnabledKeys.dead) do
                EnableControlAction(0, data, true)
            end
            if isReviving and Config.EnabledKeys.revive then
                for _, keys in pairs(Config.EnabledKeys.revive) do
                    EnableControlAction(0, keys, true)
                end
            end
        end
        if isDead == 'dead' and not setDeadFace then
            setDeadFace = true
            SetFacialIdleAnimOverride(PlayerPedId(), 'dead_2', 0)
        end
        if not isDead and setDeadFace then
            setDeadFace = false
            ClearFacialIdleAnimOverride(PlayerPedId())
        end
        Wait(sleep)
    end
end)

-- Spawn event
local firstSpawn = true
AddEventHandler('wasabi_bridge:onPlayerSpawn', function(noAnim)
    if firstSpawn then
        firstSpawn = false
        return
    end
    isDead = false
    if Config.DeathScreenEffects then AnimpostfxStopAll() end
    if not noAnim then
        wsb.stream.animDict('get_up@directional@movement@from_knees@action')
        TaskPlayAnim(wsb.cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0,
            false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
    end
    HideDeathNui()
    TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
end)

-- Death Event
local originalDeath
local originalLocation
AddEventHandler('wasabi_bridge:onPlayerDeath', function(data)
    if not isPlayerLoaded then return end
    if NassPaintball then
        if exports.nass_paintball:inGame() then return end
    end
    if OccupyingStretcher then
        local occupyingStretcher = OccupyingStretcher
        OccupyingStretcher = nil


        CreateThread(function()
            local stretcherID = GetActiveStretcherIDFromEntity(occupyingStretcher)
            local serverID = GetPlayerServerId(PlayerId())
            if stretcherID and serverID then
                Wait(100)
                TriggerServerEvent('wasabi_ambulance:placePlayerOnStretcher', stretcherID, serverID)
            end
        end)
    end
    if not isDead then
        originalDeath = data.deathCause
        local _, bone = GetPedLastDamageBone(wsb.cache.ped)
        if originalLocation ~= Bones[bone] then
            originalLocation = Bones[bone]
        end
    end
    if isDead == 'laststand' and originalDeath then
        if data.deathCause == -842959696 then
            data.deathCause = originalDeath
        else
            local _, bone = GetPedLastDamageBone(wsb.cache.ped)
            if originalLocation ~= Bones[bone] then
                originalLocation = Bones[bone]
            end
        end
        originalDeath = nil
    end
    if data.deathCause == 0 then
        local onFire = false
        if IsEntityOnFire(wsb.cache.ped) then
            deathInjury = 'burned'
            onFire = true
        end
        local deathSource = wsb.getClosestPlayer(vec3(data.victimCoords.x, data.victimCoords.y, data.victimCoords.z), 3.0)
        local _, bone = GetPedLastDamageBone(wsb.cache.ped)
        if originalLocation ~= Bones[bone] then
            originalLocation = Bones[bone]
        end
        if deathSource and not onFire then
            local deathSourcePed = GetPlayerPed(deathSource)
            local weapon = GetSelectedPedWeapon(deathSourcePed)
            local foundInjury
            for k, v in pairs(InjuryReasons) do
                for i = 1, #v do
                    if v[i] == weapon then
                        deathInjury = tostring(k)
                        foundInjury = true
                        break
                    end
                end
            end
            if weapon and not foundInjury then deathInjury = CheckWeaponType(weapon) end
            if deathInjury == 'shot' then deathInjury = 'beat' end
        end
    elseif data.deathCause == -842959696 then
        deathInjury = 'bleedout'
    else
        local foundInjury
        for k, v in pairs(InjuryReasons) do
            for i = 1, #v do
                if v[i] == data.deathCause then
                    deathInjury = tostring(k)
                    foundInjury = true
                    break
                end
            end
        end
        if not foundInjury then deathInjury = CheckWeaponType(data.deathCause) end
    end

    if Config.UseRadialMenu then
        DisableRadial(true)
    end

    PlayerInjury = {}
    if Config.DeathLogs then
        local killer = GetPedSourceOfDeath(wsb.cache.ped)
        local dCause = GetPedCauseOfDeath(wsb.cache.ped)
        local deathCause
        if IsEntityAPed(killer) and IsPedAPlayer(killer) then
            killer = NetworkGetPlayerIndexFromPed(killer)
        elseif IsEntityAVehicle(killer) and IsEntityAPed(GetPedInVehicleSeat(killer, -1)) and IsPedAPlayer(GetPedInVehicleSeat(killer, -1)) then
            killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(dCause, -1))
        end
        if (killer == PlayerId()) then
            deathCause = 'suicide'
        elseif (killer == nil or killer == 0) then
            deathCause = 'unknown'
        end
        if deathCause == 'suicide' or deathCause == 'unknown' then
            TriggerServerEvent('wasabi_ambulance:logDeath', dCause, nil)
        elseif killer then
            TriggerServerEvent('wasabi_ambulance:logDeath', dCause, GetPlayerServerId(killer))
        end
    end
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    local injuryData = {
        injury = deathInjury or Strings.unknown,
        location = originalLocation
    }
    TriggerServerEvent('wasabi_ambulance:injurySync', injuryData)
    if not Config.DisableHeadShotKill and Config.LastStand and not isDead and injuryData.injury == 'shot' and injuryData.location == 'head' then
        OnPlayerDeath(false)
        return
    end
    if not Config.LastStand or IsPedInAnyVehicle(wsb.cache.ped, false) and Config.StayInVehicleOnDeath then
        OnPlayerDeath(false)
        return
    end
    OnLastStand()
end)

-- Live injury
RegisterNetEvent('wasabi_ambulance:syncInjury', function(data, notify)
    PlayerInjury = data
    if not notify then return end
    if #PlayerInjury < 1 then
        TriggerEvent('wasabi_bridge:notify', Strings.player_treated, Strings.treated_fully_desc, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.player_treated, Strings.treated_not_fully_desc, 'inform')
    end
end)

if Config.EnableLiveInjury then
    local previousHealth = 200
    AddEventHandler('gameEventTriggered', function(event, data)
        if event == "CEventNetworkEntityDamage" then
            if NassPaintball then
                if exports.nass_paintball:inGame() then return end
            end
            local victim = data[1]
            local playerId = NetworkGetPlayerIndexFromPed(victim)
            if playerId ~= PlayerId() then return end
            if (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim)) then return end
            local health = GetEntityHealth(wsb.cache.ped)
            local armour = GetPedArmour(wsb.cache.ped)
            if not previousHealth then previousHealth = health end
            if not previousArmour then previousArmour = armour end
            local healthDamage = (previousHealth - health)
            local armourDamage = (previousArmour - armour)
            if healthDamage > (Config?.DamageDetectThreshold?.health or 10) then
                ChanceInjury()
            elseif armourDamage > (Config?.DamageDetectThreshold?.armour or 5) then
                ChanceInjury()
            end
        end
    end)

    -- Loop for debugging
    --[[CreateThread(function()
        while true do
            Wait(2000)
            if next(PlayerInjury) then
                for k, v in pairs(PlayerInjury) do
                    print(k, v.data.level, v.data.bleed)
                end
            end
        end
    end)]]

    function GetIdentifier()
        local identifier = wsb.awaitServerCallback('wasabi_ambulance:getIdentifier')
        return identifier or false
    end

    -- Main loop
    CreateThread(function()
        local lastNotificationSent = 0
        local staggering = false
        local limping = false
        local notificationCooldown = Config.InjuryNotificationFrequency
        local lastBleedCheck = 0
        local loggedInjury = {}
        local loggedHealth = {}
        local playerIsLoaded = true
        local health = 200
        local sentBlackoutNotification = false
        local sentBlackoutTime = GetGameTimer()

        while true do
            local sleep = 100
            local moveRate = 1.0
            local shouldLimp = false
            local ped = PlayerPedId()
            local playerId = PlayerId()
            if wsb.cache.ped and DoesEntityExist(wsb.cache.ped) then
                health = GetEntityHealth(wsb.cache.ped)
            end
            if not wsb.playerLoaded and playerIsLoaded then
                local identifier = GetIdentifier()
                if identifier then
                    loggedInjury[identifier] = PlayerInjury
                    loggedHealth[identifier] = health
                end
                playerIsLoaded = false
                DrugIntake = {}
                nodOutRunning = false
                currentDrugEffect = false
                isDead = false
                PlayerInjury = {}
                TriggerServerEvent('wasabi_ambulance:injurySync', false)
                TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, false, true)
            elseif wsb.playerLoaded and not playerIsLoaded then
                playerIsLoaded = true
                local identifier = GetIdentifier()
                if identifier then
                    if loggedHealth[identifier] then
                        SetEntityHealth(wsb.cache.ped, loggedHealth[identifier])
                    end
                    if loggedInjury[identifier] and next(loggedInjury[identifier]) then
                        PlayerInjury = loggedInjury[identifier]
                        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
                    end
                end
            end
            if next(PlayerInjury) then
                InjuryRunning = true
                -- Bleed handling
                if GetGameTimer() - lastBleedCheck > 10000 then
                    local totalBleed = 0
                    for _, v in pairs(PlayerInjury) do
                        if v.type == 'shot' or v.type == 'stabbed' then
                            totalBleed = totalBleed + (v.data.bleed or 0)
                        else
                            if v and v.data then
                                v.data.bleed = 0
                            end
                        end
                    end
                    if totalBleed > 0 then
                        local currentHealth = GetEntityHealth(ped)
                        SetEntityHealth(ped, currentHealth - totalBleed)
                    end
                    lastBleedCheck = GetGameTimer()
                end

                if not OnPainKillers then
                    for k, v in pairs(PlayerInjury) do
                        -- Adjust the severity to 4 levels
                        if not v or not v.data then
                            v.data = { level = 0, bleed = 0 }
                        end
                        if v.data.level or 0 > 4 then v.data.level = 4 end
                        if v.data.bleed or 0 > 4 then v.data.bleed = 4 end

                        if not OnPainKillers then
                            -- Handle head injuries
                            if k == 'head' then
                                if not sentBlackoutNotification and Config.BlackoutEffect then
                                    --if v.data.level == 2 and not staggering and 50 <= math.random(1,100) then
                                    --    staggering = true
                                    --    local success = SimulatePedStagger(ped, 3000)
                                    --    if success then Wait(3000) end
                                    --    staggering = false
                                    if v.data.level == 3 then
                                        BlackoutEffect(700, 3000)
                                        SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                        SendBlackoutNotify(k)
                                        sentBlackoutNotification = true
                                    elseif v.data.level >= 4 then
                                        BlackoutEffect(700, 4000)
                                        SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                        SendBlackoutNotify(k)
                                        sentBlackoutNotification = true
                                    end
                                end
                            end

                            -- Handle chest injuries
                            if (k == 'upper_body') and v.type == 'shot' then
                                shouldLimp = true
                            end

                            -- Handle spine injuries
                            if k == 'spine' then
                                if v.data.level == 1 and moveRate > 0.9 then
                                    shouldLimp = true
                                    sleep = 0
                                    moveRate = 0.9
                                elseif v.data.level == 2 and moveRate > 0.75 then
                                    if moveRate > 0.75 then
                                        sleep = 0
                                        moveRate = 0.75
                                    end
                                    -- if 60 <= math.random(1,100) and not staggering then
                                    --     staggering = true
                                    --     local success = SimulatePedStagger(ped, 2000)
                                    --     if success then Wait(2000) end
                                    --     staggering = false
                                    -- end
                                elseif v.data.level == 3 then
                                    if moveRate > 0.6 then moveRate = 0.6 end
                                    if not sentBlackoutNotification and Config.BlackoutEffect then
                                        if 60 <= math.random(1, 100) then
                                            local success = BlackoutEffect(700, 3000)
                                            if success then
                                                SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                                Wait(3000)
                                                SendBlackoutNotify(k)
                                                sentBlackoutNotification = true
                                            end
                                            --elseif not staggering and 50 <= math.random(1,100) then
                                            --    staggering = true
                                            --    local success = SimulatePedStagger(ped, 3000)
                                            --    if success then Wait(3000) end
                                            --    staggering = false
                                        end
                                    end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                elseif v.data.level >= 4 then
                                    if moveRate > 0.4 then moveRate = 0.4 end
                                    if not sentBlackoutNotification and Config.BlackoutEffect then
                                        if 50 <= math.random(1, 100) then
                                            local success = BlackoutEffect(700, 4000)
                                            if success then
                                                SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                                Wait(4000)
                                                SendBlackoutNotify(k)
                                                sentBlackoutNotification = true
                                            end
                                            --elseif not staggering and 60 <= math.random(1,100) then
                                            --    staggering = true
                                            --    local success = SimulatePedStagger(ped, 4000)
                                            --    if success then Wait(4000) end
                                            --    staggering = false
                                        end
                                    end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                end
                            end

                            -- Handle arm injuries
                            if k == 'right_arm' or k == 'left_arm' then
                                sleep = 5
                                if v.data.level >= 1 and (IsPlayerFreeAiming(playerId) or IsPedShooting(ped)) then
                                    SimulateAimPain(ped)
                                elseif v.data.level >= 1 and GameShake then
                                    StopGameplayCamShaking(false)
                                    GameShake = false
                                end
                            end

                            -- Handle leg injuries
                            if k == 'left_leg' or k == 'right_leg' then
                                if v.data.level == 1 and moveRate > 0.9 then
                                    moveRate = 0.9
                                    sleep = 0
                                elseif v.data.level >= 2 then
                                    if moveRate > 0.65 then moveRate = 0.75 end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                end
                            end
                            if v.data.limp then
                                shouldLimp = true
                                limping = true
                            end
                        end

                        -- Limb handling
                        if shouldLimp and GetPedMovementClipset(ped) ~= `move_m@injured` then
                            SetPedMovementClipset(ped, 'move_m@injured', 0)
                            limping = true
                        elseif not shouldLimp and GetPedMovementClipset(ped) == `move_m@injured` then
                            ResetPedMovementClipset(ped, 0)
                            limping = false
                        end
                    end

                    if Config.InjuryNotification and GetGameTimer() - lastNotificationSent > notificationCooldown and not sentBlackoutNotification then
                        SendInjuredNotification()
                        lastNotificationSent = GetGameTimer()
                    end
                    if moveRate < 0.6 then
                        sleep = 0
                        DisableControlAction(0, 21, true)
                        if IsDisabledControlJustPressed(0, 21) then
                            TriggerEvent('wasabi_bridge:notify', Strings.cant_run, Strings.cant_run_desc, 'error')
                        end
                    end
                    --[[ if moveRate < 1.0 then
                        SetPedMoveRateOverride(ped, moveRate)
                    end]]
                    if sentBlackoutNotification and GetGameTimer() - sentBlackoutTime > 30000 then
                        sentBlackoutNotification = false
                        sentBlackoutTime = GetGameTimer()
                    end
                end
                Wait(sleep)
            elseif not PlayerInjury or #PlayerInjury < 1 then
                if GameShake then
                    StopGameplayCamShaking(false)
                    GameShake = nil
                    Wait(2000)
                elseif InjuryRunning then
                    TriggerServerEvent('wasabi_ambulance:injurySync', false)
                    InjuryRunning = false
                    Wait(2000)
                elseif limping then
                    ResetPedMovementClipset(wsb.cache.ped, 0)
                    limping = false
                    Wait(2000)
                else
                    Wait(2000)
                end
            else
                Wait(2000)
            end
        end
    end)
end

-- Pain Killers
if Config.EnablePainPills then
    RegisterNetEvent('wasabi_ambulance:intakePills', function(item, data)
        if wsb.awaitServerCallback('wasabi_ambulance:removeItem', item) then
            PlayTakePillAnimation()
            DrugIntake[#DrugIntake + 1] = {
                item = item,
                label = data.label,
                duration = data.duration,
                level = data.level
            }
        end
    end)

    -- Pain Killer Effect Loop
    local drugEffectsStarted = false

    CreateThread(function()
        while true do
            Wait(1000)
            local totalDuration = 0
            local totalLevel = 0
            local toRemove = {}

            if #DrugIntake > 0 then
                drugEffectsStarted = true
                for index, drugInfo in ipairs(DrugIntake) do
                    drugInfo.duration = drugInfo.duration - 1

                    totalDuration = totalDuration + drugInfo.duration
                    totalLevel = totalLevel + drugInfo.level

                    if drugInfo.duration < 1 then
                        table.insert(toRemove, index)
                    end
                end

                for i = #toRemove, 1, -1 do
                    table.remove(DrugIntake, toRemove[i])
                end

                SetDrugEffect(wsb.cache.ped, totalLevel)
                OnPainKillers = true
            elseif drugEffectsStarted then
                ClearDrugEffects(PlayerPedId())
                drugEffectsStarted = false
                Wait(4000)
            else
                OnPainKillers = false
                Wait(4000)
            end
        end
    end)
end

AddEventHandler('wasabi_ambulance:toggleDuty', function()
    local job, grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
    if not job then return end
    if wsb.framework == 'qb' then
        wsb.playerData.job.onduty = not wsb.playerData.job.onduty
    end
    TriggerEvent('wasabi_ambulance:client:checkDuty', nil, true)
    TriggerServerEvent('wasabi_ambulance:svToggleDuty', false)
end)

AddEventHandler('wasabi_ambulance:accessStash', function()
    if not wsb.framework == 'qb' then return end
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'ambulance_' .. wsb.playerData.citizenid)
    TriggerEvent('inventory:client:SetCurrentStash', 'ambulance_' .. wsb.playerData.citizenid)
end)

AddEventHandler('wasabi_ambulance:enterBackVehicle', function()
    local coords = GetEntityCoords(wsb.cache.ped)
    local vehicle = wsb.getClosestVehicle(vector3(coords.x, coords.y, coords.z), 7.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local freeSeat
    for i = 1, 2 do
        if IsVehicleSeatFree(vehicle, i) then
            freeSeat = i
            break
        end
    end
    if not freeSeat then
        TriggerEvent('wasabi_bridge:notify', Strings.no_back_seat, Strings.no_back_seat_desc, 'error')
        return
    end
    TaskEnterVehicle(wsb.cache.ped, vehicle, -1, freeSeat, 2.0, 1, 0)
end)


-- I am monster thread
CreateThread(function()
    while not wsb?.playerData?.job do Wait(500) end
    for k, v in pairs(Config.Locations) do
        if v.Blip.Enabled then
            CreateBlip(v.Blip.Coords, v.Blip.Sprite, v.Blip.Color, v.Blip.String, v.Blip.Scale, false, 'coords', true)
        end
        if v?.clockInAndOut?.enabled then
            if v.clockInAndOut.target.enabled then
                if wsb.framework == 'esx' then
                    if not Config.ambulanceJobs or #Config.ambulanceJobs == 0 then
                        Config.ambulanceJobs = Config.ambulances
                    else
                        for i = 1, #Config.ambulanceJobs do
                            Config.ambulanceJobs[#Config.ambulanceJobs + 1] = 'off' .. Config.ambulanceJobs[i]
                        end
                    end
                end
                wsb.target.boxZone(k .. '_toggleduty', v.clockInAndOut.target.coords, v.clockInAndOut.target.width,
                    v.clockInAndOut.target.length, {
                        heading = v.clockInAndOut.target.heading,
                        minZ = v.clockInAndOut.target.minZ,
                        maxZ = v.clockInAndOut.target.maxZ,
                        job = Config.ambulanceJob or JobArrayToTarget(true),
                        distance = 2.0,
                        options = {
                            {
                                event = 'wasabi_ambulance:toggleDuty',
                                icon = 'fa-solid fa-business-time',
                                label = v.clockInAndOut.target.label,
                                groups = Config.ambulanceJob or JobArrayToTarget()
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    while true do
                        local sleep = 1500
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                        if jobName then
                            hasJob = jobName
                        elseif wsb.framework == 'esx' then
                            local jobs = Config.ambulanceJobs or Config.ambulanceJob
                            if type(jobs) == 'table' then
                                for i = 1, #jobs do
                                    jobName, jobGrade = wsb.hasGroup('off' .. jobs[i])
                                    if jobName then
                                        hasJob = jobName
                                        break
                                    end
                                end
                            else
                                jobName, jobGrade = wsb.hasGroup('off' .. jobs)
                                if jobName then hasJob = jobName end
                            end
                        end
                        if hasJob then
                            local coords = GetEntityCoords(wsb.cache.ped)
                            local dist = #(coords - v.clockInAndOut.coords)
                            if dist <= v.clockInAndOut.distance then
                                if not textUI then
                                    wsb.showTextUI(v.clockInAndOut.label)
                                    textUI = true
                                end
                                sleep = 0
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent('wasabi_ambulance:svToggleDuty', k)
                                end
                            elseif textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
        end
        if v?.PersonalLocker?.enabled then
            if v.PersonalLocker.target.enabled then
                if wsb.framework == 'esx' then
                    for i = 1, #Config.ambulanceJobs do
                        Config.ambulanceJobs[#Config.ambulanceJobs + 1] = 'off' .. Config.ambulanceJobs[i]
                    end
                end
                wsb.target.boxZone(k .. '_personallocker', v.PersonalLocker.target.coords, v.PersonalLocker.target.width,
                    v.PersonalLocker.target.length, {
                        heading = v.PersonalLocker.target.heading,
                        minZ = v.PersonalLocker.target.minZ,
                        maxZ = v.PersonalLocker.target.maxZ,
                        job = Config.ambulanceJob or JobArrayToTarget(),
                        distance = 2.0,
                        options = {
                            {
                                event = 'wasabi_ambulance:personalLocker',
                                icon = 'fa-solid fa-archive',
                                label = v.PersonalLocker.target.label,
                                job = Config.ambulanceJob or JobArrayToTarget(),
                                groups = Config.ambulanceJob or JobArrayToTarget(),
                                station = k
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    wsb.points.new({
                        coords = v.PersonalLocker.coords,
                        distance = v.PersonalLocker.distance,
                        nearby = function(self)
                            if not self.isClosest or (self.currentDistance > v.PersonalLocker.distance) then return end
                            local hasJob
                            local jobName, jobGrade = wsb.hasGroup(Config.ambulanceJobs)
                            if jobName then hasJob = jobName end
                            if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                                if not wsb.playerData.job.onduty then hasJob = nil end
                            end
                            if hasJob and v.PersonalLocker.jobLock then
                                if hasJob == v.PersonalLocker.jobLock then
                                    if not textUI then
                                        wsb.showTextUI(v.PersonalLocker.label)
                                        textUI = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        OpenPersonalStash(k)
                                    end
                                end
                            elseif hasJob and not v.PersonalLocker.jobLock then
                                if not textUI then
                                    wsb.showTextUI(v.PersonalLocker.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    OpenPersonalStash(k)
                                end
                            end
                        end,
                        onExit = function()
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    })
                end)
            end
        end
        if v.BossMenu.Enabled then
            if v.BossMenu?.Target?.enabled then
                wsb.target.boxZone(k .. '_emsboss', v.BossMenu.Target.coords, v.BossMenu.Target.width,
                    v.BossMenu.Target.length, {
                        heading = v.BossMenu.Target.heading,
                        minZ = v.BossMenu.Target.minZ,
                        maxZ = v.BossMenu.Target.maxZ,
                        job = Config.ambulanceJob or JobArrayToTarget(),
                        distance = 2.0,
                        options = {
                            {
                                name = k .. 'ems_boss',
                                event = 'wasabi_ambulance:openBossMenu',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = 2.0,
                                label = v.BossMenu.Target.label,
                                job = Config.ambulanceJob or JobArrayToTarget(),
                                groups = Config.ambulanceJob or JobArrayToTarget()
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    while true do
                        local sleep = 1500
                        local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                        if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                            if not wsb.isOnDuty() then hasJob = nil end
                        end
                        if hasJob then
                            local coords = GetEntityCoords(wsb.cache.ped)
                            local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.BossMenu.Coords.x, v.BossMenu.Coords.y, v.BossMenu.Coords.z))
                            if dist <= v.BossMenu.Distance then
                                if not textUI then
                                    wsb.showTextUI(v.BossMenu.Label)
                                    textUI = true
                                end
                                sleep = 0
                                if IsControlJustReleased(0, 38) then
                                    wsb.openBossMenu(hasJob)
                                end
                            else
                                if textUI then
                                    wsb.hideTextUI()
                                    textUI = nil
                                end
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
        end
        if v.CheckIn.Enabled then
            if v.CheckIn?.Target?.enabled then
                wsb.target.boxZone(k .. '_emscheckin', v.CheckIn.Target.coords, v.CheckIn.Target.width,
                    v.CheckIn.Target.length, {
                        heading = v.CheckIn.Target.heading,
                        minZ = v.CheckIn.Target.minZ,
                        maxZ = v.CheckIn.Target.maxZ,
                        distance = v.CheckIn.Target.distance,
                        options = {
                            {
                                name = k .. 'ems_checkin',
                                event = 'wasabi_ambulance:attemptCheckin',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = v.CheckIn.Target.distance,
                                label = v.CheckIn.Target.label,
                                hospital = k
                            }
                        }
                    })
            end
            local checkInTimer = GetGameTimer()
            CreateThread(function()
                local ped, pedSpawned
                local textUI
                while true do
                    local sleep = 1500
                    local playerPed = wsb.cache.ped
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.CheckIn.Coords.x, v.CheckIn.Coords.y, v.CheckIn.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        wsb.stream.animDict('mini@strip_club@idles@bouncer@base')
                        wsb.stream.model(v.CheckIn.Ped, 7000)
                        ped = CreatePed(28, v.CheckIn.Ped, v.CheckIn.Coords.x, v.CheckIn.Coords.y, v.CheckIn.Coords.z,
                            v.CheckIn.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif not v.CheckIn?.Target?.enabled and dist <= v.CheckIn.Distance then
                        if not textUI then
                            wsb.showTextUI(v.CheckIn.Label)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, v.CheckIn.HotKey) then
                            local cooldown = 3000
                            if v.CheckIn.DisableHospitalBeds then cooldown = v.CheckIn.Duration end
                            if GetGameTimer() - checkInTimer > cooldown then
                                checkInTimer = GetGameTimer()
                                textUI = nil
                                wsb.hideTextUI()
                                TriggerServerEvent('wasabi_ambulance:tryRevive', k)
                            else
                                TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown,
                                    Strings.checkin_cooldown_desc, 'error')
                            end
                        end
                    elseif dist >= (v.CheckIn.Distance + 1) and textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = nil
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.Cloakroom.Enabled then
            CreateThread(function()
                local textUI
                while true do
                    local sleep = 1500
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.isOnDuty() then hasJob = nil end
                    end
                    if hasJob then
                        local ped = wsb.cache.ped
                        local coords = GetEntityCoords(ped)
                        local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.Cloakroom.Coords.x, v.Cloakroom.Coords.y, v.Cloakroom.Coords.z))
                        if dist <= v.Cloakroom.Range then
                            if not textUI then
                                wsb.showTextUI(v.Cloakroom.Label)
                                textUI = true
                            end
                            sleep = 0
                            if IsControlJustReleased(0, v.Cloakroom.HotKey) then
                                openOutfits(k)
                            end
                        else
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.MedicalSupplies.Enabled then
            if Config.targetSystem then
                wsb.target.boxZone(k .. '_medsup', v.MedicalSupplies.Coords, 1.0, 1.0, {
                    heading = v.MedicalSupplies.Heading,
                    minZ = v.MedicalSupplies.Coords.z - 1.5,
                    maxZ = v.MedicalSupplies.Coords.z + 1.5,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    distance = 1.5,
                    options = {
                        {
                            name = k .. '_medsup',
                            type = 'client',
                            job = Config.ambulanceJob or JobArrayToTarget(),
                            groups = Config.ambulanceJob or JobArrayToTarget(),
                            distance = 1.5,
                            event = 'wasabi_ambulance:medicalSuppliesMenu',
                            icon = 'fa-solid fa-suitcase-medical',
                            label = Strings.request_supplies_target,
                            hospital = k
                        }
                    }
                })
            end
            CreateThread(function()
                local ped, pedSpawned, textUI
                while true do
                    local sleep = 1500
                    local playerPed = wsb.cache.ped
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.isOnDuty() then hasJob = nil end
                    end
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.MedicalSupplies.Coords.x, v.MedicalSupplies.Coords.y, v.MedicalSupplies.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        wsb.stream.animDict('mini@strip_club@idles@bouncer@base')
                        wsb.stream.model(v.MedicalSupplies.Ped, 7000)
                        ped = CreatePed(28, v.MedicalSupplies.Ped, v.MedicalSupplies.Coords.x, v.MedicalSupplies.Coords
                            .y, v.MedicalSupplies.Coords.z, v.MedicalSupplies.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif dist <= 2.5 and not Config.targetSystem then
                        if not textUI and hasJob then
                            wsb.showTextUI(Strings.open_shop_ui)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, 38) and hasJob then
                            medicalSuppliesMenu(k)
                            sleep = 1500
                        end
                    elseif dist >= 2.6 and not Config.targetSystem and textUI then
                        wsb.hideTextUI()
                        textUI = false
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = false
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.Vehicles.Enabled then
            CreateThread(function()
                local zone = v.Vehicles.Zone
                local textUI
                while true do
                    local sleep = 1500
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if hasJob and wsb.framework == 'qb' then
                        if not wsb.isOnDuty() then hasJob = nil end
                    end
                    if hasJob then
                        local playerPed = wsb.cache.ped
                        local coords = GetEntityCoords(playerPed)
                        local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(zone.coords.x, zone.coords.y, zone.coords.z))
                        local dist2 = #(vector3(coords.x, coords.y, coords.z) - vector3(v.Vehicles.Spawn.air[0].coords.x, v.Vehicles.Spawn.air[0].coords.y, v.Vehicles.Spawn.air[0].coords.z))
                        if dist < zone.range + 1 and not inMenu and not IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
                            if not textUI then
                                wsb.showTextUI(zone.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                openVehicleMenu(k)
                                sleep = 1500
                            end
                        elseif dist < zone.range + 1 and not inMenu and IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
                            if not textUI then
                                textUI = true
                                wsb.showTextUI(zone.return_label)
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                if DoesEntityExist(wsb.cache.vehicle) then
                                    DoScreenFadeOut(800)
                                    while not IsScreenFadedOut() do Wait(100) end
                                    SetEntityAsMissionEntity(wsb.cache.vehicle, true, true)

                                    local plate = GetVehicleNumberPlateText(wsb.cache.vehicle)
                                    local model = GetEntityModel(wsb.cache.vehicle)
                                    wsb.removeCarKeys(plate, model, wsb.cache.vehicle)
                                    if Config.EnableStretcher then DeleteStretcherFromVehicle(wsb.cache.vehicle) end
                                    if Config.AdvancedParking then
                                        exports["AdvancedParking"]:DeleteVehicle(wsb.cache.vehicle, false)
                                    else
                                        DeleteVehicle(wsb.cache.vehicle)
                                    end
                                    DoScreenFadeIn(800)
                                end
                            end
                        elseif dist2 < 10 and IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
                            if not textUI then
                                textUI = true
                                wsb.showTextUI(zone.return_label)
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                if DoesEntityExist(wsb.cache.vehicle) then
                                    DoScreenFadeOut(800)
                                    while not IsScreenFadedOut() do Wait(100) end
                                    SetEntityAsMissionEntity(wsb.cache.vehicle, true, true)

                                    local plate = GetVehicleNumberPlateText(wsb.cache.vehicle)
                                    local model = GetEntityModel(wsb.cache.vehicle)
                                    wsb.removeCarKeys(plate, model, wsb.cache.vehicle)
                                    if Config.EnableStretcher then DeleteStretcherFromVehicle(wsb.cache.vehicle) end
                                    if Config.AdvancedParking then
                                        exports["AdvancedParking"]:DeleteVehicle(wsb.cache.vehicle, false)
                                    else
                                        DeleteVehicle(wsb.cache.vehicle)
                                    end
                                    SetEntityCoordsNoOffset(playerPed, zone.coords.x, zone.coords.y, zone.coords.z, false,
                                        false, false)
                                    DoScreenFadeIn(800)
                                end
                            end
                        else
                            if textUI then
                                textUI = nil
                                wsb.hideTextUI()
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end
end)

if Config.EnableStandaloneCheckIns then
    CreateThread(function()
        for id, checkInSpots in pairs(Config.StandaloneCheckIns) do
            if checkInSpots.Target.enabled then
                wsb.target.boxZone('standalone_checkin_' .. id, checkInSpots.Target.coords, checkInSpots.Target.width,
                    checkInSpots.Target.length, {
                        heading = checkInSpots.Target.heading,
                        minZ = checkInSpots.Target.minZ,
                        maxZ = checkInSpots.Target.maxZ,
                        distance = checkInSpots.Target.distance,
                        options = {
                            {
                                name = 'standalone_checkin_' .. id,
                                event = 'wasabi_ambulance:attemptCheckin',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = checkInSpots.Target.distance,
                                label = checkInSpots.Target.label,
                                hospital = 'standalone',
                                standaloneID = id
                            }
                        }
                    })
            end
            local standaloneCheckInTimer = GetGameTimer()
            CreateThread(function()
                local ped, pedSpawned
                local textUI
                while true do
                    local sleep = 1500
                    local playerPed = wsb.cache.ped
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(checkInSpots.Coords.x, checkInSpots.Coords.y, checkInSpots.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        wsb.stream.animDict('mini@strip_club@idles@bouncer@base')
                        wsb.stream.model(checkInSpots.Ped, 7000)
                        ped = CreatePed(28, checkInSpots.Ped, checkInSpots.Coords.x, checkInSpots.Coords.y,
                            checkInSpots.Coords.z, checkInSpots.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif not checkInSpots?.Target?.enabled and dist <= checkInSpots?.Distance then
                        if not textUI then
                            wsb.showTextUI(checkInSpots.Label)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, checkInSpots.HotKey) then
                            local cooldownTime = 3000
                            if checkInSpots.DisableHospitalBeds then cooldownTime = checkInSpots.Duration + 500 end
                            if GetGameTimer() - standaloneCheckInTimer > cooldownTime then
                                standaloneCheckInTimer = GetGameTimer()
                                textUI = nil
                                wsb.hideTextUI()
                                TriggerServerEvent('wasabi_ambulance:tryStandaloneRevive', id)
                            else
                                TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown,
                                    Strings.checkin_cooldown_desc, 'error')
                            end
                        end
                    elseif dist >= (checkInSpots.Distance + 1) and textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = nil
                    end
                    Wait(sleep)
                end
            end)
        end
    end)
end

RegisterNetEvent('wasabi_ambulance:useBandage', function()
    local HasItem = wsb.awaitServerCallback('wasabi_ambulance:itemCheck', Config.Bandages.item)
    if not HasItem or HasItem < 1 then return end
    TriggerServerEvent('wasabi_ambulance:useBandage', wsb.cache.serverId)
    local progressUI
    if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end

    if wsb.progressUI({
            duration = Config.Bandages.duration,
            label = Strings.healing_self_prog,
            position = Config.ProgressCircleLocation,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'missheistdockssetup1clipboard@idle_a',
                clip = 'idle_a'
            },
            color = Config.UIColor 
        }, progressUI) then
        local health = GetEntityHealth(wsb.cache.ped)
        health = (Config.Bandages.hpRegen * 2) + health
        if health > 200 then health = 200 end
        SetEntityHealth(PlayerPedId(), health + 0.0)
        if Config.Bandages.healBleed and next(PlayerInjury) then
            ClearPatientSymptoms()
        end
        if Config.MythicHospital then
            TriggerEvent('mythic_hospital:client:RemoveBleed')
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
    else
        TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
    end
end)

RegisterNetEvent('wasabi_ambulance:syncRequests', function(_plyRequests, quiet)
    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
    if wsb.framework == 'qb' then
        if not wsb.isOnDuty() then hasJob = nil end
    end
    if hasJob then
        plyRequests = _plyRequests
        if not quiet then
            TriggerEvent('wasabi_bridge:notify', Strings.assistance_title, Strings.assistance_desc, 'error',
                'suitcase-medical')
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:weaponRemove', function()
    RemoveAllPedWeapons(wsb.cache.ped, true)
end)

if wsb.framework == 'esx' then
    RegisterNetEvent('esx_ambulancejob:revive', function()
        TriggerEvent('wasabi_ambulance:revive') -- ESX Compatibility
    end)
end

RegisterNetEvent('wasabi_ambulance:revivePlayer', function(serverdata)
    local playerId = PlayerId()
    if isDead then
        local injury = serverdata
        HideDeathNui()
        TriggerEvent('wasabi_ambulance:customInjuryClear')
        SetEntityInvincible(wsb.cache.ped, false)
        if GetPlayerInvincible(playerId) then SetPlayerInvincible(playerId, false) end

        TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
        DrugIntake = {}
        ClearDrugEffects(PlayerPedId())
        isDead = false
        while not DoesEntityExist(wsb.cache.ped) do Wait(500) end
        if IsPedDeadOrDying(PlayerPedId(), false) then
            local coords = GetEntityCoords(wsb.cache.ped)
            local heading = GetEntityHeading(wsb.cache.ped)
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
        else
            ClearPedTasks(wsb.cache.ped)
        end
        if GetEntityHealth(wsb.cache.ped) < 200 then SetEntityHealth(wsb.cache.ped, 200) end
        wsb.stream.animDict('get_up@directional@movement@from_knees@action')
        TaskPlayAnim(wsb.cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0,
            false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
        ClearPedBloodDamage(wsb.cache.ped)
        if Config.MythicHospital then
            TriggerEvent('mythic_hospital:client:RemoveBleed')
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
        FreezeEntityPosition(wsb.cache.ped, false)
        DoScreenFadeIn(800)
        if Config.DeathScreenEffects then AnimpostfxStopAll() end
        if wsb.framework == 'esx' then
            TriggerServerEvent('esx:onPlayerSpawn')
            TriggerEvent('esx:onPlayerSpawn')
        elseif wsb.framework == 'qb' then
            TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
            TriggerServerEvent('hud:server:RelieveStress', 100)
            TriggerEvent('wasabi_bridge:onPlayerSpawn')
        end
        if not IsCheckedIn then
            ClearPedTasks(wsb.cache.ped)
        end
        if Config.UseRadialMenu then
            DisableRadial(false)
        end
        Wait(1000)
        if not injury then return end
        ApplyDamageToPed(wsb.cache.ped, Config.ReviveHealth[injury], false)
    end
end)


RegisterNetEvent('wasabi_ambulance:revive', function(noAnim)
    TriggerEvent('wasabi_ambulance:customInjuryClear')
    SetEntityInvincible(wsb.cache.ped, false)
    local playerId = PlayerId()
    if GetPlayerInvincible(playerId) then SetPlayerInvincible(playerId, false) end

    TriggerServerEvent('wasabi_ambulance:injurySync', false)
    HideDeathNui()
    TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
    DrugIntake = {}
    nodOutRunning = false
    currentDrugEffect = false
    --[[ DoScreenFadeOut(800)
    while not IsScreenFadedOut() do
        Wait(50)
    end]]
    while not DoesEntityExist(wsb.cache.ped) do Wait(500) end

    if IsPedDeadOrDying(wsb.cache.ped) then
        local coords = GetEntityCoords(wsb.cache.ped)
        local heading = GetEntityHeading(wsb.cache.ped)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    elseif not IsCheckedIn then
        ClearPedTasks(wsb.cache.ped)
    end
    if GetEntityHealth(wsb.cache.ped) < 200 then SetEntityHealth(wsb.cache.ped, 200) end
    if not noAnim then
        wsb.stream.animDict('get_up@directional@movement@from_knees@action')
        TaskPlayAnim(wsb.cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0,
            false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
    end
    ClearPedBloodDamage(wsb.cache.ped)
    isDead = false
    PlayerInjury = {}
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    if Config.DeathScreenEffects then AnimpostfxStopAll() end
    if wsb.framework == 'esx' then
        TriggerServerEvent('esx:onPlayerSpawn')
        TriggerEvent('esx:onPlayerSpawn', (noAnim or false))
    elseif wsb.framework == 'qb' then
        TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
        TriggerServerEvent('hud:server:RelieveStress', 100)
        TriggerEvent('wasabi_bridge:onPlayerSpawn', (noAnim or false))
    end
    if Config.UseRadialMenu then
        DisableRadial(false)
    end
    Wait(1000)
    if IsCheckedIn then return end
    ClearPedTasks(wsb.cache.ped)
end)

RegisterNetEvent('wasabi_ambulance:heal', function(full, quiet)
    local ped = wsb.cache.ped
    local maxHealth = 200
    if not full then
        local health = GetEntityHealth(ped)
        local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
        SetEntityHealth(ped, newHealth + 0.0)
    else
        SetEntityHealth(ped, maxHealth + 0.0)
        if wsb.framework == 'qb' then
            TriggerServerEvent('hospital:server:resetHungerThirst')
            TriggerServerEvent('hud:server:RelieveStress', 100)
        end
    end
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    if Config.EnableLiveInjury and full then ClearPatientSymptoms() end
    if not quiet then
        TriggerEvent('wasabi_bridge:notify', Strings.player_successful_heal, Strings.player_healed_desc, 'success')
    end
    if Config.EMSItems.heal.healBleed and next(PlayerInjury) then
        for _, injury in pairs(PlayerInjury) do
            if injury.data.bleed > 0 then
                injury.data.bleed = 0
            end
        end
        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
    end
end)

RegisterNetEvent('wasabi_ambulance:sedate', function()
    local ped = wsb.cache.ped
    TriggerEvent('wasabi_bridge:notify', Strings.assistance_title, Strings.assistance_desc, 'success', 'syringe')
    ClearPedTasks(ped)
    wsb.stream.animDict(Config.DeathAnimation.anim)
    disableKeys = true
    TaskPlayAnim(ped, Config.DeathAnimation.anim, Config.DeathAnimation.lib, 8.0, 8.0, -1, 33, 0, false, false, false)
    FreezeEntityPosition(ped, true)
    Wait(Config.EMSItems.sedate.duration)
    FreezeEntityPosition(ped, false)
    disableKeys = false
    ClearPedTasks(ped)
    RemoveAnimDict(Config.DeathAnimation.anim)
end)

RegisterNetEvent('wasabi_ambulance:intoVehicle', function()
    local ped = wsb.cache.ped
    local coords = GetEntityCoords(ped)
    if IsPedInAnyVehicle(ped, false) and not OccupyingStretcher then
        coords = GetOffsetFromEntityInWorldCoords(ped, -2.0, 1.0, 0.0)
        SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
    else
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 6.0) then
            local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 6.0, 0, 71)
            if DoesEntityExist(vehicle) and not OccupyingStretcher then
                local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
                for i = maxSeats - 1, 0, -1 do
                    if IsVehicleSeatFree(vehicle, i) then
                        freeSeat = i
                        break
                    end
                end
                if freeSeat then
                    TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
                end
            end
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:syncObj', function(netObj)
    local obj = NetToObj(netObj)
    deleteObj(obj)
end)

RegisterNetEvent('wasabi_ambulance:useSedative', function()
    useSedative()
end)

RegisterNetEvent('wasabi_ambulance:useMedbag', function()
    useMedbag()
end)

RegisterNetEvent('wasabi_ambulance:treatPatient', function(injury)
    treatPatient(injury)
end)

AddEventHandler('wasabi_ambulance:buyItem', function(data)
    TriggerServerEvent('wasabi_ambulance:restock', data)
end)

AddEventHandler('wasabi_ambulance:placeInVehicle', function()
    if not targetedVehicle or not DoesEntityExist(targetedVehicle) then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local closestPlayer = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 3.0)
    if not closestPlayer then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    local targetId = GetPlayerServerId(closestPlayer)
    if IsPlayerUsingStretcher(targetId) then return end
    TriggerServerEvent('wasabi_ambulance:putInVehicle', targetId)
end)

AddEventHandler('wasabi_ambulance:openBossMenu', function()
    wsb.openBossMenu()
end)

local checkInTimer = GetGameTimer()
AddEventHandler('wasabi_ambulance:attemptCheckin', function(data)
    if not data.hospital then return end
    local cooldown = 3000
    if data.hospital == 'standalone' then
        if Config.StandaloneCheckIns[data.standaloneID].DisableHospitalBeds then
            cooldown = Config.StandaloneCheckIns
                [data.standaloneID].Duration + 500
        end
        if GetGameTimer() - checkInTimer > cooldown then
            checkInTimer = GetGameTimer()
            TriggerServerEvent('wasabi_ambulance:tryStandaloneRevive', data.standaloneID)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown, Strings.checkin_cooldown_desc, 'error')
        end
        return
    end
    local hospital = Config.Locations[data.hospital]
    if not hospital then return end
    if not hospital.CheckIn.Target.enabled then return end
    if hospital.CheckIn.DisableHospitalBeds then cooldown = hospital.CheckIn.Duration + 500 end
    if GetGameTimer() - checkInTimer > cooldown then
        checkInTimer = GetGameTimer()
        TriggerServerEvent('wasabi_ambulance:tryRevive', data.hospital)
    else
        TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown, Strings.checkin_cooldown_desc, 'error')
    end
end)

AddEventHandler('wasabi_ambulance:spawnVehicle', function(data)
    inMenu = false
    local model = data.model

    local category = Config.Locations[data.hospital].Vehicles.Options[data.grade][data.model].category
    local spawnLocs = Config.Locations[data.hospital].Vehicles.Spawn[category]
    local extras = Config.Locations[data.hospital].Vehicles.Options[data.grade][data.model].extras
    local livery = Config.Locations[data.hospital].Vehicles.Options[data.grade][data.model].livery
    local plateIndex = Config.Locations[data.hospital].Vehicles.Options[data.grade][data.model].plateIndex
    local spawnLoc = nil

    if not IsModelInCdimage(GetHashKey(model)) then
        print('Vehicle model not found: ' .. model)
    else
        local spawnLocFound = false
        for i, sl in pairs(spawnLocs) do
            local nearbyVehicles = wsb.getNearbyVehicles(vec3(sl.coords.x, sl.coords.y, sl.coords.z), 4, true)

            if #nearbyVehicles == 0 then
                spawnLoc = spawnLocs[i]
                spawnLocFound = true
                break
            end
        end

        if not spawnLocFound then
            TriggerEvent('wasabi_bridge:notify', Strings.spawn_blocked, Strings.spawn_blocked_desc, 'error')
            return
        end

        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
            Wait(100)
        end
        wsb.stream.model(model, 12000)
        local vehicle = CreateVehicle(GetHashKey(model), spawnLoc.coords.x, spawnLoc.coords.y, spawnLoc.coords.z,
            spawnLoc.heading, true, false)

        -- Added those lines to set extras and the vehicle's livery and plate
        if extras and #extras > 0 then
            for i = 1, #extras do
                SetVehicleExtra(vehicle, i, not extras[i])
            end
        end

        SetVehicleLivery(vehicle, livery)

        if category == 'land' then
            if not plateCiv then
                SetVehicleNumberPlateText(vehicle, 'F' .. math.random(000000, 999999))
            end

            SetVehicleNumberPlateTextIndex(vehicle, plateIndex)
            SetVehicleDirtLevel(vehicle, 0.0)

            -- Max mods
            SetVehicleModKit(vehicle, 0)
            -- Moteur
            SetVehicleMod(vehicle, 11, GetNumVehicleMods(vehicle, 11) - 1, false)
            -- Freins
            SetVehicleMod(vehicle, 12, GetNumVehicleMods(vehicle, 12) - 1, false)
            -- Transmission
            SetVehicleMod(vehicle, 13, GetNumVehicleMods(vehicle, 13) - 1, false)
            -- Turbo
            ToggleVehicleMod(vehicle, 18, true)
            -- Tires
            SetVehicleTyresCanBurst(vehicle, false)
        end

        -- Appliquer la couleur principale et secondaire
        SetVehicleColours(vehicle, 0, 0)
        SetVehicleExtraColours(vehicle, 0, 0)
        -- Définir la peinture comme mat
        SetVehicleModColor_1(vehicle, 0, 0, 0)
        SetVehicleModColor_2(vehicle, 0, 0)

        model = GetEntityModel(vehicle)
        if Config.customCarlock then
            local plate = GetVehicleNumberPlateText(vehicle)
            wsb.giveCarKeys(plate, model, vehicle)
        end
        if Config.FuelSystem then
            SetCarFuel(vehicle, 100)
        end
        TaskWarpPedIntoVehicle(wsb.cache.ped, vehicle, -1)
        SetModelAsNoLongerNeeded(model)

        -- Débarrer les portes au spawn
        if GetResourceState('qbx_vehiclekeys') == 'started' then
            TriggerEvent('qb-vehiclekeys:server:setVehLockState', netId, 1)
        else
            SetVehicleDoorsLocked(veh, 1)
        end
        -- Ended

        DoScreenFadeIn(800)
    end
end)

AddEventHandler('wasabi_ambulance:crutchMenu', function()
    if isPlayerDead() then return end
    exports.wasabi_crutch:OpenCrutchMenu()
end)

AddEventHandler('wasabi_ambulance:crutchRemoveMenu', function()
    if isPlayerDead() then return end
    exports.wasabi_crutch:OpenCrutchRemoveMenu()
end)

AddEventHandler('wasabi_ambulance:chairMenu', function()
    if isPlayerDead() then return end
    exports.wasabi_crutch:OpenChairMenu()
end)

AddEventHandler('wasabi_ambulance:chairRemoveMenu', function()
    if isPlayerDead() then return end
    exports.wasabi_crutch:OpenChairRemoveMenu()
end)

AddEventHandler('wasabi_ambulance:billPatient', function()
    if isPlayerDead() then return end
    if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
        local coords = GetEntityCoords(wsb.cache.ped)
        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        else
            local targetId = GetPlayerServerId(player)
            if Config.billingSystem == 'okok' then
                TriggerEvent('okokBilling:ToggleCreateInvoice')
            else
                local input = wsb.inputDialog(Strings.bill_patient, { Strings.amount }, Config.UIColor)
                if not input then return end
                local input1 = tonumber(input[1])
                if type(input1) ~= 'number' then return end
                local amount = math.floor(input1)
                if amount < 1 then
                    TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
                elseif Config.billingSystem == 'pefcl' then
                    TriggerServerEvent('wasabi_ambulance:billPlayer', targetId, amount)
                elseif Config.billingSystem == 'qb' then
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    TriggerServerEvent('wasabi_ambulance:qbBill', targetId, amount, hasJob)
                    local gender = Strings.mr
                    if wsb.playerData.charinfo.gender == 1 then
                        gender = Strings.mrs
                    end
                    local charinfo = wsb.playerData.charinfo
                    TriggerServerEvent('qb-phone:server:sendNewMail', {
                        sender = wsb.playerData.job.label,
                        subject = Strings.debt_collection,
                        message = (Strings.db_email):format(gender, charinfo.lastname, amount),
                        button = {}
                    })
                elseif Config.billingSystem == 'esx' then
                    TriggerServerEvent('esx_billing:sendBill', targetId, 'society_ambulance', 'EMS', amount)
                else
                    print('No proper billing system selected in configuration!') -- Replace this with your own billing
                end
            end
        end
    end
end)

AddEventHandler('wasabi_ambulance:medicalSuppliesMenu', function(data)
    medicalSuppliesMenu(data.hospital)
end)

AddEventHandler('wasabi_ambulance:gItem', function(data)
    gItem(data)
end)

AddEventHandler('wasabi_ambulance:interactBag', function()
    InteractBag()
end)

AddEventHandler('wasabi_ambulance:pickupBag', function()
    pickupBag()
end)

AddEventHandler('wasabi_ambulance:removeDeadFromVehicle', function(data)
    local entity = data.entity
    local serverID = GetDeadPlayerInsideVehicle(entity)
    if not serverID then return end
    TriggerServerEvent('wasabi_ambulance:putInVehicle', serverID, true)
end)

AddEventHandler('wasabi_ambulance:personalLocker', function(data)
    OpenPersonalStash(data.station)
end)

AddEventHandler('wasabi_ambulance:dispatchMenu', function()
    openDispatchMenu()
end)

AddEventHandler('wasabi_ambulance:setRoute', function(data)
    setRoute(data)
end)

AddEventHandler('wasabi_ambulance:diagnosePlayer', function()
    diagnosePlayer()
end)
RegisterNetEvent('wasabi_ambulance:reviveTarget')
AddEventHandler('wasabi_ambulance:reviveTarget', function()
    reviveTarget()
end)

RegisterNetEvent('wasabi_ambulance:healTarget')
AddEventHandler('wasabi_ambulance:healTarget', function()
    healTarget()
end)

RegisterNetEvent('wasabi_ambulance:hospitalCheckIn', function(hospital)
    if not Config.Locations[hospital] then return end
    AttemptCheckIn(hospital)
end)

RegisterNetEvent('wasabi_ambulance:standaloneCheckIn', function(id)
    if not Config.StandaloneCheckIns[id] then return end
    AttemptCheckIn('standalone', id)
end)

RegisterNetEvent('wasabi_ambulance:deleteStretcherFromVehicle', function(netId)
    local vehicle = NetToVeh(netId)
    if not vehicle or not DoesEntityExist(vehicle) then return end
    DeleteStretcherFromVehicle(vehicle)
end)

--QBCORE COMPATIBILITY START
RegisterNetEvent('wasabi_ambulance:killPlayer', function()
    SetEntityHealth(wsb.cache.ped, 0.0)
end)

RegisterNetEvent('hospital:client:adminHeal', function()
    TriggerEvent('wasabi_ambulance:heal', true, true)
end)

RegisterNetEvent('hospital:client:KillPlayer', function()
    TriggerEvent('wasabi_ambulance:killPlayer')
end)

RegisterNetEvent('hospital:client:CheckStatus', function()
    TriggerEvent('wasabi_ambulance:diagnosePlayer')
end)

RegisterNetEvent('hospital:client:RevivePlayer', function()
    TriggerEvent('wasabi_ambulance:reviveTarget')
end)

RegisterNetEvent('hospital:client:TreatWounds', function()
    TriggerEvent('wasabi_ambulance:healTarget')
end)

RegisterNetEvent('hospital:client:Revive', function()
    TriggerEvent('wasabi_ambulance:revive')
end)

RegisterNetEvent('qb-radialmenu:client:TakeStretcher', function()
    ToggleStretcher()
end)

RegisterNetEvent('qb-radialmenu:client:RemoveStretcher', function()
    local closestStretcher = GetClosestStretcher(3.0)
    if not closestStretcher then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    PlaceStretcherInVehicle(closestStretcher.id)
end)
--QBCORE COMPATIBILITY END

RegisterCommand('emsJobMenu', function()
    OpenJobMenu()
end)

AddEventHandler('wasabi_ambulance:emsJobMenu', function()
    OpenJobMenu()
end)

TriggerEvent('chat:removeSuggestion', '/emsJobMenu')

RegisterKeyMapping('emsJobMenu', Strings.key_map_text, 'keyboard', Config.jobMenu)
