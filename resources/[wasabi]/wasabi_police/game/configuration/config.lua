-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local seconds, minutes = 1000, 60000
Config = {}

-------------------------------------------------------------------
-- TO MODIFY NOTIFICATIONS TO YOUR OWN CUSTOM NOTIFICATIONS:-------
-------------- Navigate to wasabi_bridge/customize/ ---------------
-------------------------------------------------------------------
Config.CheckForUpdates = true -- Check for updates? Who would not want to know updates!?

-- Language Options are
-- 'en' (English)
-- 'fr' (French)
-- 'cn' (Chinese Simplified)
-- 'tw' (Chinese Traditional)
-- 'de' (German)
-- 'it' (Italian)
-- 'jp' (Japanese)
-- 'ko' (Korean)
-- 'pl' (Polish)
-- 'pt' (Portuguese)
-- 'es' (Spanish)
-- 'hi' (Hindi)
-- 'nl' (Dutch)
-- 'da' (Danish)
-- 'cs' (Czech)
-- If you would like us to add a language, join our discord and create a ticket!
-- All locale strings can be found in /game/configuration/locales/
Config.Language = 'fr'
Config.UIColor = '#03D5FF'     -- Can be 'red', 'blue', or a hex '#FF0000'
Config.JailUIColor = '#03D5FF' -- Can be 'red', 'blue', or a hex '#FF0000'

Config.jobMenu = 'F6'          -- Default job menu key
Config.useTarget = true        -- Enable target for police functions (Supports ox_target / qb-target)
Config.MobileMenu = {          -- THIS WILL USE A REGULAR MENU RATHER THAN A CONTEXT STYLE MENU!
    enabled = false,            -- Use a mobile menu rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'             -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.UseRadialMenu = false    -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB - Editable in client/radial.lua)

Config.customCarlock = true    -- If you use wasabi_carlock OR qb-carlock set to true(Add your own carlock system in wasabi_bridge/customize/client/carlock.lua)
Config.billingSystem =
'false'                        -- Current options: false (Disabled) / 'default' (For built-in System)/'esx' (For esx_billing) / 'qb' (QBCore) / 'okok' (For okokBilling) (Easy to add more/fully customize in client/cl_customize.lua)

--ONLY IF USING 'default' BILLING SYSTEM
Config.billingData = {
    chargeAccount = 'bank', --Cash or bank (The default method to charge player)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job sent the fine)
    -- (If false, fines will be deducted from the player but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,

    fines = { --Fine presets
        { label = 'Stationnement gênant ou interdit',      amount = 250 },
        { label = 'Conduite sans permis',                  amount = 1250 },
        { label = 'Outrage à agent ',                      amount = 1000 },
        { label = "Port d'arme sans permis",               amount = 1250 },
        { label = 'Vol de véhicule',                       amount = 1000 },
        { label = 'Excès de vitesse 1 à 20 km/h',          amount = 250 },
        { label = 'Excès de vitesse 21 à 40 km/h',         amount = 500 },
        { label = 'Excès de vitesse 41 à 60 km/h',         amount = 1000 },
        { label = 'Excès de vitesse 61 à 80 km/h',         amount = 2000 },
        { label = 'Excès de vitesse 81 à 100 km/h',        amount = 3000 },
        { label = 'Excès de vitesse supérieur à 100 km/h', amount = 5000 },
    }
}

Config.OldQBManagement = false -- If you use older qb-management(Unrelated to ESX)

Config.AdvancedParking = false -- Delete vehicles with their exports(Script named advanced parking)

Config.Jail = {
    enabled = true,                          -- Enable jail feature?
    input = true,                            -- Enable input? Some needs it
    jail = '',                               -- Current options: 'qb' (For qb-prison) / 'r_prison' (For r_scripts prison: https://r-scripts.tebex.io/) / 'rcore' (For rcore-prison) / 'tk_jail' (For tk_jail) / 'hd_jail' (For hd_jail) / 'myPrison' (For myPrison) / 'qalle-jail' (For qalle-jail) / 'plouffe ' (For Plouffe Jail) / 'mx' (For mxJail) / 'custom' (For custom)
    BuiltInPrison = {
        enabled = true,                      -- Enable built-in prison system?
        persistentJail = true,               -- Persistent jail? (If false, jail will be reset on reload)
        coords = vec3(1845.0, 2585.0, 45.0), -- Coords of prison
        spawn = {
            { coords = vec4(1745.77, 2489.61, 50.41, 212.01) },
            { coords = vec4(1751.86, 2492.73, 50.44, 213.77) },
            { coords = vec4(1760.82, 2498.14, 50.42, 208.26) },
            { coords = vec4(1754.85, 2494.59, 45.82, 212.49) },
            { coords = vec4(1748.84, 2491.35, 45.80, 203.43) }
        },
        release = vec4(1845.0, 2585.0, 45.0, 0.0), -- Coords of released
        jailOutfit = {
            male = {                               -- Male variation
                clothing = {
                    -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                    -- https://docs.fivem.net/natives/?_0xD4F7B05C
                    { component = 11, drawable = 5,  texture = 2 }, -- Torso
                    { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                    { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                    { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                    { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                },
                props = {
                    -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                    -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                    --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                }
            },
            female = {
                clothing = {
                    -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                    -- https://docs.fivem.net/natives/?_0xD4F7B05C
                    { component = 11, drawable = 4,  texture = 0 }, -- Torso
                    { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                    { component = 4,  drawable = 25, texture = 0 }, -- Pants
                    { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                    { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                },
                props = {
                    -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                    -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                    --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                }
            }
        },

    },
}
-- NOTE: If using qb-prison, you must make one small change to qb-prison.
-- SEE https://docs.wasabiscripts.com/scripts/wasabi_police/customizations#qb-prison-integration

Config.searchPlayers = true     -- Allow police jobs to search players for items (Must have inventory in bridge or one already supported in cl_customize.lua - or add your own!)
Config.weaponsAsItems = true     -- (If you're unsure leave as true!)This is typically for older ESX and inventories that still use weapons as weapons and not items

Config.spikeStripsEnabled = true -- Enable functionality of spike strips (Disable if you use difference script for spike strips)

--[[ These resources can trigger:
    wasabi_police:handcuffPlayer
    wasabi_police:escortPlayer
    wasabi_police:inVehiclePlayer
    wasabi_police:outVehiclePlayer
]]
Config.AllowedResources = {
    'qb-core',
    'qb-radialmenu', -- For civilians to be able to use radial menu features(Already had compatibility without edit)
}

Config.AllowedJobs = { -- THIS HAS NOTHING TO DO with Config.policeJobs, only with triggering events above
    --'bloods'
}

Config.GrantWeaponLicenses = {
    enabled = true,          -- If you want police to have option to grant/revoke weapons licenses
    license_name = 'weapon', -- Name of license
    minGrade = 1,            -- Min grade to use this function
    menuPosition =
    'bottom-right'           -- Choose where menu of player select is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}

Config.CCTVCameras = { -- CCTV Cameras
    enabled = false,     -- Enable CCTV Cameras?
    jobLock = 'police', -- Job lock? or access to all police jobs by using false
    saveToDatabase = true, -- Save CCTV data to database? (If false, data will be stored in server memory/reset on server restarts)

    jobs = {            -- Jobs & minimum ranks that can add/modify/delete CCTV Cameras
        -- Must be in Config.policeJobs as well
        police = 0,     -- Job 'police' with minimum rank 0
        --        sheriff = 2,    -- Job 'sheriff' with minimum rank 2
    },
    destoryable = true, -- Can players destroy CCTV Cameras?
    blip = {
        enabled = true,      -- Enable blips for CCTV Cameras?
        label = 'CCTV Camera', -- Blip label
        sprite = 604,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
        short = false,        -- Short range blip?
    },

    EnabledKeys = {  --Enabled keys while in camera view
      --W A S D BackSpace 
        32, 34, 8, 9, 177
    },

    options = {
        {
            label = 'CCTV Camera #1', -- Label of CCTV Camera
            prop = 'prop_cctv_cam_01a', -- Prop name
        },
        {
            label = 'CCTV Camera #2',
            prop = 'prop_cctv_cam_01b',
        },
        {
            label = 'CCTV Camera #3',
            prop = 'prop_cctv_cam_06a',
        },
        {
            label = 'CCTV Camera #4',
            prop = 'prop_cctv_cam_05a',
        },
    },
    locations = { -- Locations of CCTV Cameras
        enabled = true, -- Enable locations of CCTV Cameras?
        data = {
            {
    
                name = 'Shop (Innocence Blvd)', -- Label of CCTV Camera
                prop = 'prop_cctv_cam_06a', -- Prop name
                coords = vector3(23.8389778137207, -1348.9283447265626, 31.53925323486328),  --coords":{"x":23.8389778137207,"y":-1348.9283447265626,"z":31.53925323486328}
                heading = 119.99991607666016, --heading
            },
            {
                name = 'Shop (Inseno Road)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(-3037.25, 584.399169921875, 9.89759731292724),
                heading = 224.99984741210938,
            },
            {
                name = 'Shop (Barbareno Road)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(-3240.68603515625, 999.1280517578125, 14.87293338775634),
                heading = 199.9998016357422,
            },
            {
                name = 'Shop (Great Ocean Highway)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(1726.5582275390626, 6414.02783203125, 37.07946395874023),
                heading = 94.99994659423828,
            },
            {
                name = 'Shop (Grape Seed Main Street)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(1706.2977294921876, 4926.40576171875, 44.10588836669922),
                heading = 239.99984741210938,
            },
            {
                name = 'Shop (Alhambra Drive)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(1960.42431640625, 3738.34716796875, 34.38598251342773),
                heading = 149.9998321533203,
            },
            {
                name = 'Shop (Route 68)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(549.0037841796875, 2672.68896484375, 43.89537048339844),
                heading = 304.99969482421877,
            },
            {
                name = 'Shop (Senora Freeway)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(2679.138671875, 3278.020263671875, 57.58337097167969),
                heading = 179.999755859375,
            },
            {
                name = 'Shop (Palomino Freeway)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(2558.8310546875, 380.1410827636719, 110.66519927978516),
                heading = 209.9998016357422,
            },
            {
                name = 'Shop (Clinton Avenue)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(371.39739990234377, 324.99755859375, 105.60862731933594),
                heading = 104.99993133544922,
            },
            {
                name = 'Shop (North Rockford Drive)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(-1827.2593994140626, 793.8814086914063, 140.25299072265626),
                heading = 44.99998092651367,
            },
            {
                name = 'Shop (Grove Street)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(-47.95944213867187, -1750.7666015625, 31.46323776245117),
                heading = 324.99945068359377,
            },
            {
                name = 'Shop (Ginger Street)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(-711.623779296875, -908.9114379882813, 21.25783157348632),
                heading = 0.0,
            },
            {
                name = 'Shop (Mirror Park Blvd)',
                prop = 'prop_cctv_cam_06a',
                coords = vector3(1158.4505615234376, -319.10296630859377, 71.24732971191406),
                heading = 14.99969005584716,
            },
        }
    }

}

Config.RadarPosts = {           -- Radar posts for speed detection

    enabled = false,             -- Enable radar posts (Shows option in job menu for approved jobs)?
    saveToDatabase = true,      -- Save radar data to database? (If false, data will be stored in server memory/reset on server restarts)

    disableCameraFlash = false, -- Disable camera flash effect when player is caught speeding?

    measurement = 'kmh',        -- Measurement of speed (Options: 'mph' / 'kmh')

    jobs = {                    -- Jobs & minimum ranks that can add/modify/delete radar posts
        -- Must be in Config.policeJobs as well
        police = 0,             -- Job 'police' with minimum rank 0
        sheriff = 2,            -- Job 'sheriff' with minimum rank 2
    },

    whitelistJobs = { -- Jobs that do not get fined for speeding
        -- Do not worry about jobs from Config.policeJobs, they are automatically whitelisted
        'ambulance',

    },

    chargeAccount = 'bank',       -- Cash or bank (The default method to charge player
    allowNegativeBalance = false, -- Allow players to go into negative balance? (If false, player must have enough money to pay fine)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job placed the radar post that detected speeding)
    -- (If false, fines will be deducted from the speeder but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,

    thresholds = {   -- Speed thresholds for fines
        [5] = 50,    -- 5 over = $50 fine
        [10] = 100,  -- 10 over = $100 fine
        [20] = 500,  -- 20 over = $500 fine
        [30] = 1000, -- 30 over = $1000 fine
        [40] = 2000, -- 40 over = $2000 fine
        [50] = 5000, -- 50 over = $5000 fine
    },

    blip = {
        enabled = false,      -- Enable blips for radar posts?
        label = 'Radar Post', -- Blip label
        sprite = 184,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
        short = false,        -- Short range blip?
    },

    options = {
        {
            label = 'Radar Post #1',     -- Label of radar post
            prop = 'prop_cctv_pole_01a', -- Prop name
        },
        {
            label = 'Radar Post #2',
            prop = 'prop_cctv_pole_02',
        },
        {
            label = 'Radar Post #3',
            prop = 'prop_cctv_pole_03',
        },
        {
            label = 'Radar Post #4',
            prop = 'prop_cctv_pole_04',
        },
    }
}

Config.GSR = {                 -- Gunshot residue settings
    enabled = true,           -- Enabled?
    cleanInWater = true,       -- Can clean GSR while in water?
    timeToClean = 5 * seconds, -- How long to clean GSR in water if enabled
    autoClean = 600,           -- (IN SECONDS)How long before residue clears itself? Set to false if undesired to auto clean GSR
    command = 'gsr'            -- Command for testing for GSR? Set to false if undesired
}

Config.tackle = {
    enabled = true,    -- Enable tackle?
    policeOnly = true, -- Police jobs only use tackle?
    hotkey = 'G'       -- What key to press while sprinting to start tackle of target
}

Config.seizeCash = {  -- ONLY FOR QBCORE WITHOUT CASH AS ITEM
    enabled = false,  -- Enabled?
    item = 'moneybag' -- Item to add after seizedCash
}

Config.handcuff = {                             -- Config in regards to cuffing
    defaultCuff = 'hard',                       -- Default cuff type (Options: 'soft' / 'hard') Changing this will be the default hotkey cuff type
    persistentCuff = true,                      -- Verify player's cuffed status during login (Install '_EXTRA_ESX_INSTALL/ESX_PERSISTENT_CUFF.sql' if using ESX)
    timer = 20 * minutes,                       -- Time before player is automatically unrestrained(Set to false if not desired)
    hotkey = 'J',                               -- What key to press to handcuff people(Set to false for no hotkey)
    cuffDeadPlayers = false,                    -- Allow cuffing dead players?
    skilledEscape = {
        enabled = true,                         -- Allow criminal to simulate resisting by giving them a chance to break free from cuffs via skill check
        difficulty = { 'easy', 'medium', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    },
    cuffItem = {                                -- Have handcuffs as usable item? (ITEM NAME MUST BE IN ITEMS / YOU MUST ADD YOURSELF)
        enabled = false,                        -- Enable a handcuff usable item?? Must be in items table/database with name defined below
        required = true,                        -- Requires handcuff item to be in inventory when any handcuff function is used
        item = 'handcuffs'                      -- Item name (DONT FORGET to make sure its in your items)
    },
    lockpicking = {                             -- Lockpicking someone else out of handcuffs
        enabled = true,                        -- Enable handcuffs to be able to be lockpicked off(MUST HAVE LOCKPICK ITEM IN ITEMS)
        item = 'bobby_pin',
        breakChance = 50,                       -- Chance of lockpick breaking if failed (Set to 100 for 100% or 0 for never breaking)
        difficulty = { 'easy', 'medium', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    }
}

Config.TrackingBracelet = { -- Tracking Bracelet
    enabled = true,          -- Enable tracking bracelet?
    jobLock = 'police', -- Job lock? or access to all police jobs by using false
    jobs = {            -- Jobs & minimum ranks that can add/modify/delete CCTV Cameras
        -- Must be in Config.policeJobs as well
        police = 1,     -- Job 'police' with minimum rank 0
        --        sheriff = 2,    -- Job 'sheriff' with minimum rank 2
    },
    blip = {
        enabled = true,      -- Enable blips for tracking bracelets?
        label = 'Suivi: %s', -- Blip label
        sprite = 304,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
    },
    item = 'tracking_bracelet', -- Item required to use tracking bracelet
    timer = 20 * minutes,    -- Time before player is automatically untracked(Set to false if not desired)
}

Config.policeJobs = { -- Police jobs
    'police',
    'sheriff'
    -- 'reporter'
}

Config.GPSBlips = {
    enabled = true,      -- Enabled?
    item = false,        -- Item required? Note: You have to use it then
    sprites = {
        none = 373,      -- Blip for when not in a vehicle
        car = 672,       -- Blip for when in vehicles
        bike = 226,      -- Blip for when on bikes
        boat = 427,      -- Blip for when in boats
        helicopter = 43, -- Blip for when in helicopters
        plane = 307,     -- Blip for when in planes
    },
    settings = {
        color = {
            default = 1, -- Default blip color
            police = 38,  -- Blip color for police
            sheriff = 81, -- Blip color for sheriff
        },
        scale = 0.8,
        short = false,
        category = 7
    }
}

Config.Props = { -- What props are avaliable in the "Place Objects" section of the job menu

    {
        title = 'Barrier',             -- Label
        description = '',              -- Description (optional)
        model = `prop_barrier_work05`, -- Prop name within `
        freeze = true,                 -- Make prop unmovable
        groups = {                     -- ['job_name'] = min_rank
            ['police'] = 0,
            ['sheriff'] = 0,
        }
    },
    {
        title = 'Barricade',
        description = '',
        model = `prop_mp_barrier_01`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['sheriff'] = 0,
        }
    },
    {
        title = 'Traffic Cones',
        description = '',
        model = `prop_roadcone02a`,
        freeze = false, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['sheriff'] = 0,
        }
    },
    {
        title = 'Spike Strip',
        description = '',
        model = `p_ld_stinger_s`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['sheriff'] = 0,
        }
    },

}

Config.Locations = {
    LSPD = {
        -- Done
        blip = {
            enabled = true,
            coords = vec3(464.57, -992.0, 30.69),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Police - Mission Row'
        },

        -- Done
        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(464.87, -977.37, 30.69), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Punch In/Out',
                coords = vec3(453.64999389648, -986.34997558594, 31.0),
                heading = 91.06,
                distance = 1.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        -- Done
        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(460.64, -985.64, 30.73), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Ouvrir son ordinateur',
                coords = vec3(461.45, -986.20, 30.7),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        -- Done
        armoury = {
            enabled = true,                                                                              -- Set to false if you don't want to use
            coords = vec3(482.54, -994.70, 30.75),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 'S_M_Y_Cop_01',                                                                        -- Ped model or false for no ped
            label = "[E] - Ouvrir l'armurerie",                                                              -- String of text ui
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = "Ouvrir l'armurerie",
                coords = vec3(482.54, -994.70, 30.75), 
                heading = 24.95,
                distance = 4.0,
                width = 1.5,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                -- [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                --     { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                --     { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                --     { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                --     { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                --     --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                --     --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                -- },
                [0] = { -- Stagiaire
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },

                },
                [1] = { -- Officier
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'WEAPON_HEAVYPISTOL',      label = 'Pistolet lourd',               multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'ammo-45',                 label = '.45 ACP',                      multiple = true,    price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                },
                [2] = { -- Sergent
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'WEAPON_HEAVYPISTOL',      label = 'Pistolet lourd',               multiple = false,   price = false },
                    { name = 'WEAPON_PUMPSHOTGUN_MK2',  label = 'Fusil à pompe MK2',            multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'ammo-45',                 label = '.45 ACP',                      multiple = true,    price = false },
                    { name = 'ammo-shotgun',            label = 'Calibre 12',                   multiple = true,    price = false },
                    { name = 'at_scope_holo',           label = 'Viseur holographique',         multiple = false,   price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                },
                [3] = { -- Lieutenant
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'WEAPON_HEAVYPISTOL',      label = 'Pistolet lourd',               multiple = false,   price = false },
                    { name = 'WEAPON_PUMPSHOTGUN_MK2',  label = 'Fusil à pompe MK2',            multiple = false,   price = false },
                    { name = 'WEAPON_SMG',              label = 'MP5',                          multiple = false,   price = false },
                    { name = 'WEAPON_TACTICALRIFLE',    label = 'M4A1',                         multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'ammo-45',                 label = '.45 ACP',                      multiple = true,    price = false },
                    { name = 'ammo-shotgun',            label = 'Calibre 12',                   multiple = true,    price = false },
                    { name = 'ammo-rifle',              label = '5.56x45',                      multiple = true,    price = false },
                    { name = 'at_flashlight',           label = 'Lumière tactique',             multiple = false,   price = false },
                    { name = 'at_scope_smg',            label = 'Viseur SMG',                   multiple = false,   price = false },
                    { name = 'at_scope_holo',           label = 'Viseur holographique',         multiple = false,   price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                },
                [4] = { -- Capitaine
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'WEAPON_HEAVYPISTOL',      label = 'Pistolet lourd',               multiple = false,   price = false },
                    { name = 'WEAPON_PUMPSHOTGUN_MK2',  label = 'Fusil à pompe MK2',            multiple = false,   price = false },
                    { name = 'WEAPON_SMG',              label = 'MP5',                          multiple = false,   price = false },
                    { name = 'WEAPON_TACTICALRIFLE',    label = 'M4A1',                         multiple = false,   price = false },
                    { name = 'WEAPON_CARBINERIFLE_MK2', label = 'Carabine MK2',                 multiple = false,   price = false },
                    { name = 'WEAPON_SNIPERRIFLE',      label = 'Fusil de précision',           multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'ammo-45',                 label = '.45 ACP',                      multiple = true,    price = false },
                    { name = 'ammo-shotgun',            label = 'Calibre 12',                   multiple = true,    price = false },
                    { name = 'ammo-rifle',              label = '5.56x45',                      multiple = true,    price = false },
                    { name = 'ammo-sniper',             label = '7.62x51',                      multiple = true,    price = false },
                    { name = 'at_flashlight',           label = 'Lumière tactique',             multiple = false,   price = false },
                    { name = 'at_scope_smg',            label = 'Viseur SMG',                   multiple = false,   price = false },
                    { name = 'at_scope_holo',           label = 'Viseur holographique',         multiple = false,   price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                },
                [5] = { -- Chef de police
                    { name = 'radio',                   label = 'Radio',                        multiple = false,   price = false },
                    { name = 'WEAPON_NIGHTSTICK',       label = 'Matraque',                     multiple = false,   price = false },
                    { name = 'WEAPON_FLASHLIGHT',       label = 'Lampe de poche',               multiple = false,   price = false },
                    { name = 'WEAPON_STUNGUN',          label = 'Taser',                        multiple = false,   price = false },
                    { name = 'WEAPON_COMBATPISTOL',     label = 'Pistolet de combat',           multiple = false,   price = false },
                    { name = 'WEAPON_HEAVYPISTOL',      label = 'Pistolet lourd',               multiple = false,   price = false },
                    { name = 'WEAPON_PUMPSHOTGUN_MK2',  label = 'Fusil à pompe MK2',            multiple = false,   price = false },
                    { name = 'WEAPON_SMG',              label = 'MP5',                          multiple = false,   price = false },
                    { name = 'WEAPON_TACTICALRIFLE',    label = 'M4A1',                         multiple = false,   price = false },
                    { name = 'WEAPON_CARBINERIFLE_MK2', label = 'Carabine MK2',                 multiple = false,   price = false },
                    { name = 'WEAPON_SNIPERRIFLE',      label = 'Fusil de précision',           multiple = false,   price = false },
                    { name = 'ammo-9',                  label = '9mm',                          multiple = true,    price = false },
                    { name = 'ammo-45',                 label = '.45 ACP',                      multiple = true,    price = false },
                    { name = 'ammo-shotgun',            label = 'Calibre 12',                   multiple = true,    price = false },
                    { name = 'ammo-rifle',              label = '5.56x45',                      multiple = true,    price = false },
                    { name = 'ammo-sniper',             label = '7.62x51',                      multiple = true,    price = false },
                    { name = 'at_flashlight',           label = 'Lumière tactique',             multiple = false,   price = false },
                    { name = 'at_scope_smg',            label = 'Viseur SMG',                   multiple = false,   price = false },
                    { name = 'at_scope_holo',           label = 'Viseur holographique',         multiple = false,   price = false },
                    { name = 'bulletproof_vest_police', label = 'Gillet pare-balles (police)',  multiple = false,   price = false },
                },
            }
        },

        cloakroom = {
            enabled = true,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.95, -999.1, 30.69),  -- Coords of cloakroom
            label = '[E] - Changer ces vêtements', -- String of text ui of cloakroom
            range = 4.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Done
        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = true,                        -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(485.45, -994.70, 31.05), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Ouvrir son casier',
            maxWeight = 75000,                    -- Max weight of locker (75kg = 75000)
            slots = 40,                           -- Max slots of locker
            target = {
                enabled = true,                    -- If enabled, the location above will be obsolete
                label = 'Ouvrir son casier',
                coords = vec3(485.45, -994.70, 31.05),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        -- Done
        evidenceLocker = {
            enabled = true,                       -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(473.39, -991.29, 26.2), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Ouvrir un casier de saisies',
            target = {
                enabled = true, -- If enabled, the location above will be obsolete
                label = "Ouvrir un casier de saisies",
                coords = vec3(473.39, -991.29, 26.2),
                heading = 266.23,
                distance = 1.0,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },

        vehicles = {                                   -- Vehicle Garage
            enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(458.96, -993.7, 25.7), -- Area to prompt vehicle garage
                range = 4,                           -- Range it will prompt from coords above
                label = '[E] - Ouvrir le garage',
                return_label = '[E] - Ranger le véhicule'
            },
            spawn = {
                land = {
                    [0] = {
                        coords = vec3(445.8, -986.07, 25.28), -- Coords of where land vehicle spawn/return
                        heading = 270.79
                    },
                    [1] = {
                        coords = vec3(445.8, -988.83, 25.25),
                        heading = 270.79
                    },
                    [2] = {
                        coords = vec3(445.8, -991.45, 25.24),
                        heading = 270.79
                    },
                    [3] = {
                        coords = vec3(445.8, -994.26, 25.24),
                        heading = 270.79
                    },
                    [4] = {
                        coords = vec3(445.8, -997.0, 25.24),
                        heading = 270.79
                    },
                    -- 2e rangée
                    [5] = {
                        coords = vec3(437.0, -986.19, 25.25),
                        heading = 90.5
                    },
                    [6] = {
                        coords = vec3(437.0, -988.85, 25.24),
                        heading = 90.5
                    },
                    [7] = {
                        coords = vec3(437.0, -991.51, 25.24),
                        heading = 90.5
                    },
                    [8] = {
                        coords = vec3(437.0, -994.25, 25.24),
                        heading = 90.5
                    },
                    [9] = {
                        coords = vec3(437.0, -996.93, 25.24),
                        heading = 90.5
                    },
                    -- 3e rangée
                    [10] = {
                        coords = vec3(425.79, -997.1, 25.24),
                        heading = 270.52
                    },
                    [11] = {
                        coords = vec3(425.99, -994.38, 25.24),
                        heading = 270.52
                    },
                    [12] = {
                        coords = vec3(425.95, -991.69, 25.24),
                        heading = 270.52
                    },
                    [13] = {
                        coords = vec3(426.03, -988.96, 25.24),
                        heading = 270.52
                    },
                    [14] = {
                        coords = vec3(425.82, -984.3, 25.24),
                        heading = 270.52
                    },
                    [15] = {
                        coords = vec3(425.99, -981.59, 25.24),
                        heading = 270.52
                    },
                    [16] = {
                        coords = vec3(426.18, -978.89, 25.24),
                        heading = 270.52
                    },
                    [17] = {
                        coords = vec3(425.9, -976.12, 25.24),
                        heading = 270.52
                    }
                },
                air = {
                    [1] = {
                        coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                        heading = 0.01
                    },
                    [2] = {
                        coords = vec3(481.64, -983.18, 41.39),
                        heading = 0.01
                    }
                }
            },
            options = {
                [0] = { -- Cadet
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                },

                [1] = { -- Officier
                    ['pexp20'] = {
                        label = 'Ford Explorer 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pf15018'] = {
                        label = 'Ford F150 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Rangement dans le coffre
                            [12] = true, -- Radar arrière
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                },

                [2] = { -- Sergent
                    ['pchall18'] = {
                        label = 'Dodge Demon 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pdurango21'] = {
                        label = 'Dodge Durango 2021',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = true, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = true, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pexp20'] = {
                        label = 'Ford Explorer 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pexp20b'] = {
                        label = 'Ford Explorer 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pf15018'] = {
                        label = 'Ford F150 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Rangement dans le coffre
                            [12] = true, -- Radar arrière
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13b'] = {
                        label = 'Ford Taurus 2013 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11b'] = {
                        label = 'Ford Crown Victoria 2011 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['polmav2'] = { 
                        label = 'Maverick',
                        category = 'air',
                        livery = 1,
                    },
                },

                [3] = { -- Lieutenant
                    ['pchall18'] = {
                        label = 'Dodge Demon 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pchall18b'] = {
                        label = 'Dodge Demon 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pcharger18'] = {
                        label = 'Dodge Charger 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pcharger18b'] = {
                        label = 'Dodge Charger 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pdurango21'] = {
                        label = 'Dodge Durango 2021',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = true, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = true, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pdurango21b'] = {
                        label = 'Dodge Durango 2021 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = false, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = false, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = false, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pexp20'] = {
                        label = 'Ford Explorer 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pexp20b'] = {
                        label = 'Ford Explorer 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pf15018'] = {
                        label = 'Ford F150 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Rangement dans le coffre
                            [12] = true, -- Radar arrière
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pf15018b'] = {
                        label = 'Ford F150 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = false, -- Rangement dans le coffre
                            [12] = false, -- Radar arrière
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13b'] = {
                        label = 'Ford Taurus 2013 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11b'] = {
                        label = 'Ford Crown Victoria 2011 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['polmav2'] = { 
                        label = 'Maverick',
                        category = 'air',
                        livery = 1,
                    },
                },

                [4] = { -- Capitaine
                    ['pchall18'] = {
                        label = 'Dodge Demon 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pchall18b'] = {
                        label = 'Dodge Demon 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pcharger18'] = {
                        label = 'Dodge Charger 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pcharger18b'] = {
                        label = 'Dodge Charger 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pcts20'] = {
                        label = 'Cadillac CTS 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Lumières calandre
                            [5] = true, -- Lumières vitre arrière
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pcts20b'] = {
                        label = 'Cadillac CTS 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Lumières calandre
                            [5] = true, -- Lumières vitre arrière
                            [6] = false, -- Pare-Buffle
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pdurango21'] = {
                        label = 'Dodge Durango 2021',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = true, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = true, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pdurango21b'] = {
                        label = 'Dodge Durango 2021 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = false, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = false, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = false, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pexp20'] = {
                        label = 'Ford Explorer 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pexp20b'] = {
                        label = 'Ford Explorer 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pf15018'] = {
                        label = 'Ford F150 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Rangement dans le coffre
                            [12] = true, -- Radar arrière
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pf15018b'] = {
                        label = 'Ford F150 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = false, -- Rangement dans le coffre
                            [12] = false, -- Radar arrière
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['ptahoe18'] = {
                        label = 'Chevrolet Tahoe 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptahoe18b'] = {
                        label = 'Chevrolet Tahoe 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13b'] = {
                        label = 'Ford Taurus 2013 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11b'] = {
                        label = 'Ford Crown Victoria 2011 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pwrx15'] = {
                        label = 'Subaru WRX STI 2015',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières pare-soleil
                            [2] = false, -- Lumières dashboard
                            [3] = true, -- Lumières vitre arrière
                            [4] = true, -- Lumières calandre
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pwrx15b'] = {
                        label = 'Subaru WRX STI 2015 (B)',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières pare-soleil
                            [2] = false, -- Lumières dashboard
                            [3] = true, -- Lumières vitre arrière
                            [4] = true, -- Lumières calandre
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['polmav2'] = { 
                        label = 'Maverick',
                        category = 'air',
                        livery = 1,
                    },
                },

                [5] = { -- Chef
                    ['pchall18'] = {
                        label = 'Dodge Demon 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pchall18b'] = {
                        label = 'Dodge Demon 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pcharger18'] = {
                        label = 'Dodge Charger 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pcharger18b'] = {
                        label = 'Dodge Charger 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pcts20'] = {
                        label = 'Cadillac CTS 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Lumières calandre
                            [5] = true, -- Lumières vitre arrière
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pcts20b'] = {
                        label = 'Cadillac CTS 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Lumières calandre
                            [5] = true, -- Lumières vitre arrière
                            [6] = false, -- Pare-Buffle
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pdurango21'] = {
                        label = 'Dodge Durango 2021',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = true, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = true, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = true, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pdurango21b'] = {
                        label = 'Dodge Durango 2021 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = false, -- Lumières dashboard
                            [4] = true, -- Lumières arrières
                            [5] = false, -- Lumières de plaque
                            [6] = false, -- Pare-Buffle
                            [7] = false, -- Pare-Buffle complet
                            [8] = false, -- Radar
                            [9] = true, -- Antennes toit
                            [10] = false, -- Spots lights
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pexp20'] = {
                        label = 'Ford Explorer 2020',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pexp20b'] = {
                        label = 'Ford Explorer 2020 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pf15018'] = {
                        label = 'Ford F150 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Rangement dans le coffre
                            [12] = true, -- Radar arrière
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pf15018b'] = {
                        label = 'Ford F150 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = false, -- Rangement dans le coffre
                            [12] = false, -- Radar arrière
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pgt3rs21'] = {
                        label = 'Porsche GT3-RS 2021',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- 2
                            [3] = true, -- 3
                            [4] = false, -- Non présent
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = true, -- 12
                        },
                        livery = 2,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pgt3rs21b'] = {
                        label = 'Porsche GT3-RS 2021 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- 2
                            [3] = false, -- 3
                            [4] = false, -- Non présent
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = true, -- 12
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['ptahoe18'] = {
                        label = 'Chevrolet Tahoe 2018',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptahoe18b'] = {
                        label = 'Chevrolet Tahoe 2018 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['ptaurus13'] = {
                        label = 'Ford Taurus 2013',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['ptaurus13b'] = {
                        label = 'Ford Taurus 2013 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Pare-Buffle bas
                            [6] = false, -- Pare-Buffle complet
                            [7] = true, -- Lumières de plaque
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pvic11'] = {
                        label = 'Ford Crown Victoria 2011',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = true, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = true, -- Spots lights
                            [10] = true, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = true, -- Radar
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pvic11b'] = {
                        label = 'Ford Crown Victoria 2011 (B)',
                        category = 'land',
                        extras = {
                            [1] = false, -- Lumières de toit
                            [2] = true, -- Lumières pare-soleil
                            [3] = true, -- Lumières dashboard
                            [4] = false, -- Pare-Buffle central
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = true, -- Lumières vitre arrière
                            [8] = false, -- Drogue sur le capot
                            [9] = false, -- Spots lights
                            [10] = false, -- Antennes toit
                            [11] = true, -- Antenne arrière
                            [12] = false, -- Radar
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['pwrx15'] = {
                        label = 'Subaru WRX STI 2015',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières pare-soleil
                            [2] = false, -- Lumières dashboard
                            [3] = true, -- Lumières vitre arrière
                            [4] = true, -- Lumières calandre
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 0,
                        plateCiv = false,
                        plateIndex = 4
                    },
                    ['pwrx15b'] = {
                        label = 'Subaru WRX STI 2015 (B)',
                        category = 'land',
                        extras = {
                            [1] = true, -- Lumières pare-soleil
                            [2] = false, -- Lumières dashboard
                            [3] = true, -- Lumières vitre arrière
                            [4] = true, -- Lumières calandre
                            [5] = false, -- Non présent
                            [6] = false, -- Non présent
                            [7] = false, -- Non présent
                            [8] = false, -- Non présent
                            [9] = false, -- Non présent
                            [10] = false, -- Non présent
                            [11] = false, -- Non présent
                            [12] = false, -- Non présent
                        },
                        livery = 1,
                        plateCiv = true,
                        plateIndex = 1
                    },
                    ['polmav2'] = { 
                        label = 'Maverick',
                        category = 'air',
                        livery = 0,
                    },













                    -- ['pgt3rs21'] = {
                    --     label = 'Porsche GT3-RS 2021',
                    --     category = 'land',
                    --     extras = {
                    --         [1] = true, -- 1
                    --         [2] = true, -- 2
                    --         [3] = true, -- 3
                    --         [4] = true, -- 4
                    --         [5] = true, -- 5
                    --         [6] = true, -- 6
                    --         [7] = true, -- 7
                    --         [8] = true, -- 8
                    --         [9] = true, -- 9
                    --         [10] = true, -- 10
                    --         [11] = true, -- 11
                    --         [12] = true, -- 12
                    --     },
                    --     livery = 0,
                    --     plateCiv = false,
                    --     plateIndex = 4
                    -- },
                    -- ['polmav'] = { 
                    --     label = 'Maverick',
                    --     category = 'air',
                    -- },
                },
            }
        },
    },
}
