Config = Config or {}

-- NOTE: Setting the items a shop will buy and their prices is done in the server config file.
Config.Shops = {
   [1] = {        
        name = 'weed_baggy_buyer',
        label = 'Dealer de cannabis',
        pedModel = 'csb_ballasog',
        pedScenario = 'WORLD_HUMAN_SMOKING_POT',
        location = vec4(21.21, -1844.18, 24.6, 118.67),
        shopIcon = 'fas fa-cannabis',
        shopIconColor = '#00B327',
        blip = {
            sprite = 140,
            display = 4,
            scale = 0.5,
            color = 1
        },
    },
    [2] = {        
        name = 'blanchisseur',
        label = 'Blanchisseur',
        pedModel = 'a_m_m_hasjew_01',
        pedScenario = 'PROP_HUMAN_STAND_IMPATIENT',
        location = vec4(-3.4, -1821.07, 29.54, 235.77),
        shopIcon = 'fas fa-money-bill-transfer',
        shopIconColor = '#00D507',
        blip = {
            sprite = 272,
            display = 4,
            scale = 0.5,
            color = 1
        },
    },
    [3] = {        
        name = 'cocaine_buyer',
        label = "Dealer de cocaïne",
        pedModel = 'a_m_m_farmer_01',
        pedScenario = 'world_human_gardener_plant',
        location = vec4(2567.97, 4419.19, 39.11, 300.68),
        shopIcon = 'fas fa-leaf',
        shopIconColor = '#FFFFFF',
        blip = {
            sprite = 630,
            display = 4,
            scale = 0.5,
            color = 1
        },
    },
    [4] = {        
        name = 'meth_buyer',
        label = "Dealer de meth",
        pedModel = 'g_m_y_mexgoon_01',
        pedScenario = 'world_human_smoking_pot',
        location = vec4(486.76, -1736.2, 28.98, 3.39),
        shopIcon = 'fa-brands fa-ethereum',
        shopIconColor = '#00F7FF',
        blip = {
            sprite = 403,
            display = 4,
            scale = 0.5,
            color = 1
        },
    },
    [5] = {        
        name = 'meat_buyer',
        label = "Boucherie",
        pedModel = 'ig_chef',
        pedScenario = 'world_human_clipboard',
        location = vec4(961.89, -2111.62, 31.95, 88.69),
        shopIcon = 'fas fa-drumstick-bite',
        shopIconColor = '#F09D9D',
        blip = {
            sprite = 442,
            display = 4,
            scale = 1.0,
            color = 23
        },
    },
    [6] = {        
        name = 'illegal_meat_buyer',
        label = "Boucherie illégale",
        pedModel = 's_m_y_busboy_01',
        pedScenario = 'world_human_picnic',
        location = vec4(148.49, -2207.42, 4.69, 354.35),
        shopIcon = 'fas fa-drumstick-bite',
        shopIconColor = '#F09D9D',
        blip = {
            sprite = 442,
            display = 4,
            scale = 0.5,
            color = 1
        },
    },
}