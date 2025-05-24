return {
    cityhalls = {
        {
            coords = vec3(-265.0, -963.6, 31.2),
            showBlip = true,
            blip = {
                label = 'City Services',
                shortRange = true,
                sprite = 487,
                display = 4,
                scale = 0.65,
                colour = 0,
            },
            licenses = {
                ['id'] = {
                    item = 'id_card',
                    label = 'ID',
                    cost = 150,
                },
                ['driver'] = {
                    item = 'driver_license',
                    label = 'Permis de conduire',
                    cost = 1250,
                },
                ['weapon'] = {
                    item = 'weapon_license',
                    label = "License d'arme",
                    cost = 750,
                },
            },
        },
    },

    employment = {
        enabled = false, -- Set to false to disable the employment menu
        jobs = {
            unemployed = 'Unemployed',
            trucker = 'Trucker',
            taxi = 'Taxi',
            tow = 'Tow Truck',
            reporter = 'News Reporter',
            garbage = 'Garbage Collector',
            bus = 'Bus Driver',
        },
    },
}
