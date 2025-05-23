return {
    weed = {
        name = "cannabis",
        harvest = {
            name = "feuille de cannabis",
            label = "Récolter du cannabis",
            icon = "fas fa-cannabis",
            iconColor = "#00FF09",
            coords = vec3(-39.85, 1938.7, 190.0),
            size = vec3(1.35, 4.15, 1.7),
            rotation = 30.0,
            requiredItem = "scissors",
            item = "weed",
            min = 8,
            max = 14,
            duration = 2500,
        },
        transformation = {
            name = "sachet de cannabis",
            label = "Ensacher du cannabis",
            icon = "fa-solid fa-box",
            iconColor = "#00FF09",
            coords = vec3(1038.4, -3205.85, -38.65),
            size = vec3(1.15, 2.2, 1.05),
            rotation = 359.75,
            requiredItems = {
                { name = "weed", count = 10, message = "Vous n'avez pas assez de feuilles de cannabis." },
                { name = "grinder", count = 1, message = "Vous n'avez rien pour broyeur le cannabis." },
                { name = "empty_baggy", count = 1, message = "Vous n'avez rien pour ensacher le cannabis." },
            },
            receipeItems = {
                { name = "weed", count = 10 },
                { name = "empty_baggy", count = 1 }
            },
            transformedItems = {
                { name = "weed_baggy", count = 1 },
            },
            duration = 3250,
            anim = {                          
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                clip = "machinic_loop_mechandplayer"
            },
        }
    },
    meth = {
        name = "méthamphétamine",
        harvest = {
            name = "mélange de méthamphétamine",
            label = "Récolter du mélange de méthamphétamine",
            icon = "fa-brands fa-ethereum",
            iconColor = "#00F7FF",
            coords = vec3(3604.5, 3635.2, 40.8),
            size = vec3(0.8, 1.85, 0.95),
            rotation = 0.0,
            item = "meth_mixture",
            min = 1,
            max = 3,
            duration = 2500,
        },
        transformation = {
            name = "plateau de méthamphétamine",
            label = "Transformer le mélange de méthamphétamine",
            icon = "fa-solid fa-layer-group",
            iconColor = "#00F7FF",
            coords = vec3(1005.7, -3201.65, -39.0),
            size = vec3(1.7, 1.9, 2.0),
            rotation = 0.0,
            requiredItems = {
                { name = "meth_mixture", count = 2, message = "Vous n'avez pas assez de mélange à méthamphétamine." },
                { name = "empty_tray", count = 1, message = "Vous n'avez rien pour déposer le mélange." },
            },
            receipeItems = {
                { name = "meth_mixture", count = 2 },
                { name = "empty_tray", count = 1 }
            },
            transformedItems = {
                { name = "meth_tray", count = 1 },
            },
            duration = 4250,
            anim = {
                dict = 'amb@world_human_gardener_plant@male@enter',
                clip = 'enter'
            },
        },
        transformation2 = {
            name = "méthamphétamine",
            label = "Créer de la méthamphétamine",
            icon = "fa-brands fa-ethereum",
            iconColor = "#00F7FF",
            coords = vec3(1012.1, -3194.1, -39.4),
            size = vec3(2.2, 1.1, 1.1),
            rotation = 0.0,
            requiredItems = {
                { name = "meth_tray", count = 1, message = "Vous n'avez pas de plateau de méthamphétamine." },
                { name = "hammer", count = 1, message = "Vous n'avez rien pour émietté la méthamphétamine." },
            },
            receipeItems = {
                { name = "meth_tray", count = 1 },
            },
            transformedItems = {
                { name = "meth_crystal", count = 20 },
            },
            duration = 2250,
            anim = {                          
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                clip = "machinic_loop_mechandplayer"
            },
        },
        transformation3 = {
            name = "sachet de méthamphétamine",
            label = "Ensacher de la méthamphétamine",
            icon = "fa-solid fa-box",
            iconColor = "#00F7FF",
            coords = vec3(1014.95, -3194.15, -39.15),
            size = vec3(0.75, 0.35, 0.25),
            rotation = 0.0,
            requiredItems = {
                { name = "meth_crystal", count = 10, message = "Vous n'avez pas assez méthamphétamine." },
                { name = "empty_baggy", count = 1, message = "Vous n'avez rien pour ensacher le cannabis." },
            },
            receipeItems = {
                { name = "meth_crystal", count = 10 },
                { name = "empty_baggy", count = 1 },
            },
            transformedItems = {
                { name = "meth_baggy", count = 1 },
            },
            duration = 3250,
            anim = {                          
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                clip = "machinic_loop_mechandplayer"
            },
        }
    },
    coke = {
        name = "cocaïne",
        harvest = {
            name = "feuille de coca",
            label = "Récolter des feuilles de coca",
            icon = "fa-solid fa-leaf",
            iconColor = "#FFFFFF",
            coords = vec3(-598.0, 6074.5, 10.25),
            size = vec3(3.0, 3.75, 3.0),
            rotation = 0.0,
            requiredItem = "shear",
            item = "coca_leaf",
            min = 12,
            max = 18,
            duration = 2500,
        },
        transformation = {
            name = "plateau de cocaïne",
            label = "Mélanger les feuilles de coca",
            icon = "fa-solid fa-hill-rockslide",
            iconColor = "#FFFFFF",
            coords = vec3(1098.9, -3194.15, -39.3),
	        size = vec3(1, 2.45, 1.4),
	        rotation = 0.0,
            requiredItems = {
                { name = "coca_leaf", count = 20, message = "Vous n'avez pas assez de feuille de coca." },
                { name = "bakingsoda", count = 1, message = "Vous n'avez pas assez de bicarbonate de soude." },
                { name = "empty_tray", count = 1, message = "Vous n'avez rien pour déposer le mélange." },
            },
            receipeItems = {
                { name = "coca_leaf", count = 20, message = "Vous n'avez pas assez de feuille de coca." },
                { name = "bakingsoda", count = 1, message = "Vous n'avez pas assez de bicarbonate de soude." },
                { name = "empty_tray", count = 1, message = "Vous n'avez rien pour déposer le mélange." },
            },
            transformedItems = {
                { name = "cocaine_tray", count = 1 },
            },
            duration = 3250,
            anim = {                          
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                clip = "machinic_loop_mechandplayer"
            },
        },
        transformation2 = {
            name = "sachet de cocaïne",
            label = "Ensacher la cocaïne",
            icon = "fa-solid fa-weight-scale",
            iconColor = "#FFFFFF",
            coords = vec3(1092.15, -3195.45, -39.0),
            size = vec3(0.35, 0.45, 0.45),
            rotation = 0.0,
            requiredItems = {
                { name = "cocaine_tray", count = 1, message = "Vous n'avez pas assez de plateau de cocaïne." },
                { name = "scale", count = 1, message = "Vous n'avez rien pour peser la cocaïne." },
                { name = "empty_baggy", count = 2, message = "Vous n'avez rien pour ensacher la cocaïne." },
            },
            receipeItems = {
                { name = "cocaine_tray", count = 1 },
                { name = "empty_baggy", count = 2 }
            },
            transformedItems = {
                { name = "cocaine_baggy", count = 2 },
            },
            duration = 3250,
            anim = {                          
                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                clip = "machinic_loop_mechandplayer"
            },
        }
    },
}
