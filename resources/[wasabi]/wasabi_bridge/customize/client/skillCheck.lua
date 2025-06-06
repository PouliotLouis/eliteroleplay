-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

--- Skill Check
---@param data table Same/similiar data to the ox_lib skillCheck function. Subject to change.
---@return boolean
function WSB.skillCheck(data)
    -- Customize this logic with your own skill check UI or ox_lib
    -- 'difficulty' (string - either 'easy', 'medium', 'hard' OR array for multiple),
    -- 'keys' (string - key required to press OR array of multiple keys to pick from at random)
    --
    -- example usage(Simple):
    -- WSB.skillCheck({'easy', 'medium' 'hard'})
    -- This is simple example of a 3 step skill check with a sequence of easy, medium, easy and using default bridge configured color.
    --
    -- example usage(Advanced):
    -- WSB.skillCheck({
    --    difficulty = {'easy', 'medium', 'hard'},
    --    keys = {'e', 'r', 't'}, 
    --    color = '#218988'
    --})
    -- This is an advanced example of a 3 step skill check with a sequence of easy, medium, hard and using custom color and keys.
    --
    -- (Basically follow the same as ox_lib skill check and transfer the options to your skill check system)]

    -- Remove under this to use your own skill check/ox_lib --
    if not data.difficulty then
        data = {
            difficulty = data
        }
    end
    if not data.color then data.color = Config.DefaultColor end
    if not data.keys then data.keys = 'e' end
    return SkillCheck(data.difficulty, data.keys, data.color) or false
    -- Remove above this to use your own skill check / ox_lib --


    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.skillCheck or customize!^0')
        return false
    end
    if data.difficulty then
        data = data.difficulty
    end
    return exports.ox_lib:skillCheck(data)
    ]]
end

exports('skillCheck', WSB.skillCheck) -- Export for use in other scripts
