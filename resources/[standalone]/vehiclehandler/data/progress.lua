return {
    ['cleankit'] = {
        label = "Kit de nettoyage",
        duration = 15000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
    },
    ['tirekit'] = {
        label = "Kit de réparation de pneus",
        duration = 15000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            clip = "machinic_loop_mechandplayer",
            flag = 10
        },
    },
    ['smallkit'] = {
        label = "Kit de réparation de véhicule (petit)",
        duration = 20000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = "mini@repair",
            clip = "fixing_a_player"
        },
    },
    ['bigkit'] = {
        label = "Kit de réparation de véhicule (gros)",
        duration = 30000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = "mini@repair",
            clip = "fixing_a_player"
        },
    }
}