return {
    weed_lab = {
        name = "weed_lab",
        icon = "fas fa-cannabis",
        entrance = {
            coords = vec3(387.4, 3584.3, 33.45),
            size = vec3(0.25, 1.5, 2.4),
            rotation = 80.0,
        },
        spawn_entrance = vec4(1066.4, -3183.33, -39.16, 94.45),
        exit = {
            coords = vec3(1066.65, -3183.45, -39.0),
            size = vec3(0.2, 1.45, 2.5),
            rotation = 0.0,
        },
        spawn_exit = vec4(387.54, 3584.64, 33.29, 354.56),
    },
    meth_lab = {
        name = "meth_lab",
        icon = "fa-solid fa-flask-vial",
        entrance = {
            coords = vec3(1098.05, -1275.6, 21.25),
            size = vec3(1.55, 0.45, 2.7),
            rotation = 335.0,
        },
        spawn_entrance = vec4(996.81, -3200.69, -36.39, 273.26),
        exit = {
            coords = vec3(996.5, -3200.65, -36.05),
            size = vec3(1.55, 0.45, 2.4),
            rotation = 270.0,
        },
        spawn_exit = vec4(1098.27, -1275.25, 20.75, 336.21)
    },
    cocaine_lab = {
        name = "cocaine_lab",
        icon = "fa-solid fa-cubes-stacked",
        entrance = {
            coords = vec3(986.6, -2211.6, 37.2),
            size = vec3(1.5, 0.25, 2.5),
            rotation = 355.0,
        },
        spawn_entrance = vec4(1088.7, -3187.46, -38.99, 188.68),
        exit = {
            coords = vec3(1088.7, -3187.25, -38.85),
            size = vec3(1.5, 0.3, 2.3),
            rotation = 0.0,
        },
        spawn_exit = vec4(986.63, -2211.43, 37.05, 356.0)
    },


    -- Ascenseur 1 vers garage
    pillbox = {
        name = "pillbox",
        icon = "fa-solid fa-hospital",
        iconColor = "#0390FC",
        -- Garage ascenseur
        entrance = {
            label = "Monter au 3e étage",
            coords = vec3(342.2, -585.45, 29.3),
            size = vec3(3.9, 3.8, 3.1),
            rotation = 70.0,
        },
        spawn_entrance = vec4(330.43, -601.15, 43.28, 72.06),
        -- 3e étage ascenseur
        exit = {
            label = "Descendre au garage",
            coords = vec3(330.55, -601.25, 43.5),
            size = vec3(0.55, 2.85, 2.45),
            rotation = 340.5,
        },
        spawn_exit = vec4(341.28, -585.08, 28.8, 77.44),
    },
    -- Ascenseur 2 vers garage
    pillbox2 = {
        name = "pillbox",
        icon = "fa-solid fa-hospital",
        iconColor = "#0390FC",
        -- Garage ascenseur
        entrance = {
            label = "Monter au 3e étage",
            coords = vec3(343.55, -581.75, 29.3),
            size = vec3(3.85, 4.2, 3.3),
            rotation = 70.0,
        },
        spawn_entrance = vec4(332.33, -595.66, 43.28, 78.53),
        -- 3e étage ascenseur
        exit = {
            label = "Descendre au garage",
            coords = vec3(332.6, -595.8, 43.45),
            size = vec3(0.5, 2.9, 2.5),
            rotation = 339.25,
        },
        spawn_exit = vec4(342.81, -581.49, 28.8, 70.19),
    },
    -- Ascenseur 3 vers toit
    pillbox3 = {
        name = "pillbox",
        icon = "fa-solid fa-hospital",
        iconColor = "#0390FC",
        -- Garage ascenseur
        entrance = {
            label = "Monter au toit",
            coords = vec3(327.05, -604.1, 43.45),
            size = vec3(0.6, 2.9, 2.55),
            rotation = 69.75,
        },
        spawn_entrance = vec4(338.55, -583.81, 74.16, 258.11),
        -- 3e étage ascenseur
        exit = {
            label = "Descendre au 3e étage",
            coords = vec3(338.3, -583.75, 74.35),
            size = vec3(0.4, 3.25, 2.45),
            rotation = 159.75,
        },
        spawn_exit = vec4(327.14, -603.64, 43.28, 341.2),
    },

    -- Drugs
    -- Meth Lab (MC Business) ➜ 996.85, -3200.68, -36.39
    -- Weed Farm ➜ 1051.21, -3196.53, -39.13
    -- Cocaine Lockup ➜ 1093.6, -3196.6, -38.99

    -- Document Forgery (Bureau) ➜ 1165, -3196.6, -39.01

    -- Hôpital underground ➜ 275.446, -1361.11, 24.5378

    -- Porte avion ➜ 3084.73, -4770.709, 15.26167
    
    -- Union bank (prison un peu) ➜ 2.6968, -667.0166, 16.13061

    -- Sous-marin (on peut dire bateau aussi) ➜ 1561.236, 385.877, -50.685

    -- Strip club ➜ 126.135, -1278.583, 29.28

    -- Bahamamas ➜ -1390.0, -600.0, 30.0

    -- Entrepôt ➜ 1056.4, -3105.08, -39.0

    -- https://github.com/DurtyFree/gta-v-data-dumps


    -- Pour l'idée de vol d'identité et de carte de crédit
    -- 1165, -3196.6, -39.01306

    -- Idée pour armes illégales gratuites
    -- -1488.153, -1021.166, 5.000

    -- Idée lorsqu'un joueur achète un char
    -- 1202.407, -3251.251, -50.000
}