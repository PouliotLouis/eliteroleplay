return {
    updateInterval = 5, -- how often to update player data in minutes

    money = {
        ---@alias MoneyType 'cash' | 'bank' | 'crypto'
        ---@alias Money {cash: number, bank: number, crypto: number}
        ---@type Money
        moneyTypes = { cash = 750, bank = 5000 }, -- type = startamount - Add or remove money types for your server (for ex. blackmoney = 0), remember once added it will not be removed from the database!
        dontAllowMinus = { 'cash', 'crypto' }, -- Money that is not allowed going in minus
        paycheckTimeout = 10, -- The time in minutes that it will give the paycheck
        paycheckSociety = false -- If true paycheck will come from the society account that the player is employed at
    },

    player = {
        hungerRate = 4.2, -- Rate at which hunger goes down.
        thirstRate = 3.8, -- Rate at which thirst goes down.

        ---@enum BloodType
        bloodTypes = {
            'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
        },

        ---@alias UniqueIdType 'citizenid' | 'AccountNumber' | 'PhoneNumber' | 'FingerId' | 'WalletId' | 'SerialNumber'
        ---@type table<UniqueIdType, {valueFunction: function}>
        identifierTypes = {
            citizenid = {
                valueFunction = function()
                    return lib.string.random('A.......')
                end,
            },
            AccountNumber = {
                valueFunction = function()
                    return 'US0' .. math.random(1, 9) .. 'QBX' .. math.random(1111, 9999) .. math.random(1111, 9999) .. math.random(11, 99)
                end,
            },
            PhoneNumber = {
                valueFunction = function()
                    return math.random(100,999) .. math.random(1000000,9999999)
                end,
            },
            FingerId = {
                valueFunction = function()
                    return lib.string.random('...............')
                end,
            },
            WalletId = {
                valueFunction = function()
                    return 'QB-' .. math.random(11111111, 99999999)
                end,
            },
            SerialNumber = {
                valueFunction = function()
                    return math.random(11111111, 99999999)
                end,
            },
        }
    },

    ---@alias TableName string
    ---@alias ColumnName string
    ---@type [TableName, ColumnName][]
    characterDataTables = {
        {'properties', 'owner'},
        {'bank_accounts_new', 'id'},
        {'playerskins', 'citizenid'},
        {'player_mails', 'citizenid'},
        {'player_outfits', 'citizenid'},
        {'player_vehicles', 'citizenid'},
        {'player_groups', 'citizenid'},
        {'players', 'citizenid'},
    }, -- Rows to be deleted when the character is deleted

    server = {
        pvp = true, -- Enable or disable pvp on the server (Ability to shoot other players)
        closed = false, -- Set server closed (no one can join except people with ace permission 'qbadmin.join')
        closedReason = 'Server Closed', -- Reason message to display when people can't join the server
        whitelist = false, -- Enable or disable whitelist on the server
        whitelistPermission = 'admin', -- Permission that's able to enter the server when the whitelist is on
        discord = 'discord.gg/q54jY3sw6c', -- Discord invite link
        checkDuplicateLicense = true, -- Check for duplicate rockstar license on join
        ---@deprecated use cfg ACE system instead
        permissions = { 'god', 'admin', 'mod' }, -- Add as many groups as you want here after creating them in your server.cfg
    },

    characters = {
        playersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
            ['license2:a7b5ee81fab002b4072bce7835b35fc3a80ad233'] = 2,
        },

        defaultNumberOfCharacters = 1, -- Define maximum amount of default characters (maximum 3 characters defined by default)
    },

    -- this configuration is for core events only. putting other webhooks here will have no effect
    logging = {
        webhook = {
            ['default'] = "https://discord.com/api/webhooks/1375616300574969917/0Lu7Hb3rmtb1ubJcE8RfJwUCgW7CWO8Nnnqc6vrjuigc2RJo8-DRAZggkuvyeSY_rcYC", -- default
            ['joinleave'] = "https://discord.com/api/webhooks/1375616300574969917/0Lu7Hb3rmtb1ubJcE8RfJwUCgW7CWO8Nnnqc6vrjuigc2RJo8-DRAZggkuvyeSY_rcYC", -- default
            ['ooc'] = "https://discord.com/api/webhooks/1375616300574969917/0Lu7Hb3rmtb1ubJcE8RfJwUCgW7CWO8Nnnqc6vrjuigc2RJo8-DRAZggkuvyeSY_rcYC", -- default
            ['anticheat'] = "https://discord.com/api/webhooks/1375613925923487924/3a5ICI36bWmtdXkqWWJHi2xSLUrznCdSzlXTcTwuBoW-zzqaQ4E1jkr8VTpsYk3TcvwH", -- default
            ['playermoney'] = "https://discord.com/api/webhooks/1375613925923487924/3a5ICI36bWmtdXkqWWJHi2xSLUrznCdSzlXTcTwuBoW-zzqaQ4E1jkr8VTpsYk3TcvwH", -- default
            ['admin'] = "https://discord.com/api/webhooks/1375613925923487924/3a5ICI36bWmtdXkqWWJHi2xSLUrznCdSzlXTcTwuBoW-zzqaQ4E1jkr8VTpsYk3TcvwH",
            ['drogues'] = "https://discord.com/api/webhooks/1375613510939312178/C8INy5y4V86nJvzJaTJ01B5_KWryLnTOvWNxQtaYKY8d8gFG1PfBxSDy5-PMvwqcTWzL"
        },
        role = {
            "<@&1375614120191328298>", -- Propriétaire 👑
        } -- Role to tag for high priority logs. Roles use <@%roleid> and users/channels are <@userid/channelid>
    },

    giveVehicleKeys = function(src, plate, vehicle)
        return exports.qbx_vehiclekeys:GiveKeys(src, vehicle)
    end,

    getSocietyAccount = function(accountName)
        return exports['Renewed-Banking']:getAccountMoney(accountName)
    end,

    removeSocietyMoney = function(accountName, payment)
        return exports['Renewed-Banking']:removeAccountMoney(accountName, payment)
    end,

    ---Paycheck function
    ---@param player Player Player object
    ---@param payment number Payment amount
    sendPaycheck = function (player, payment)
        player.Functions.AddMoney('bank', payment)
        Notify(player.PlayerData.source, locale('info.received_paycheck', payment))
    end,
}
