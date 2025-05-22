return {
    oxy = {
        box_icon = "fas fa-capsules",
        box_label = "Cusiner de l'oxycodone",
        item = "oxy",
        point_de_transformation = vec3(2328.55, 2570.34, 46.67),
        point_de_transformation_size = vec3(0.4, 0.5, 0.3),
        point_de_transformation_rotation = 60,
        point_de_transformation_debug = true,
        message_transformation = {
            title = "Transformation",
            description = "Tu as créé %s pots d'oxycodone",
            icon = "capsules",
            iconColor = "#9900E0",
            duration = 7500
        },
        items_requis = {
            { item = "phosphoric_acid", count = 1 },
            { item = "viscous_substance", count = 20 },
            { item = "empty_jar", count = 20 },
        },
        production = 20,
    },
    coke = {
        box_icon = "fas fa-leaf",
        box_label = "Cusiner de la pâte de cocaïne",
        item = "coke_paste_tray",
        point_de_transformation = vec3(37.57, -1209.18, 29.01),
        point_de_transformation_size = vec3(0.4, 0.4, 0.7),
        point_de_transformation_rotation = 60,
        point_de_transformation_debug = true,
        message_transformation = {
            title = "Transformation",
            description = "Tu as créé %s plateau de pâte de cocaïne",
            icon = "leaf",
            iconColor = "#FFFFFF",
            duration = 2200
        },
        items_requis = {
            { item = "baking_soda", count = 1 },
            { item = "coca_leaf", count = 5 },
        },
        production = 1,
    },
    coke = {
        box_icon = "fas fa-leaf",
        box_label = "Ensacher de la pâte de cocaïne",
        item = "cocaine_baggy",
        point_de_transformation = vec3(1978.87, -2607.2, 3.5),
        point_de_transformation_size = vec3(2.5, 2, 1),
        point_de_transformation_rotation = 145,
        point_de_transformation_debug = true,
        message_transformation = {
            title = "Transformation",
            description = "Tu as créé %s sachets de cocaïne",
            icon = "leaf",
            iconColor = "#FFFFFF",
            duration = 2200
        },
        items_requis = {
            { item = "coke_paste_tray", count = 1 },
            { item = "empty_baggy", count = 6 },
        },
        production = 6,
    },
}