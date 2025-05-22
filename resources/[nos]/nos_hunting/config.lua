return {
    authorizedKillingWeapons = {
        ['-1466123874'] = 'WEAPON_MUSKET',
        ['-598887786'] = 'WEAPON_MARKSMANPISTOL',
        ['487013001'] = 'WEAPON_PUMPSHOTGUN',
        ['-1716189206'] = 'WEAPON_KNIFE',
        ['-581044007'] = 'WEAPON_MACHETE'
    },
    authorizedHarvestingWeapons = {
        ['183714930'] = 'WEAPON_KNIFE',
        ['541296844'] = 'WEAPON_MACHETE'
    },
    animals = {
        -- a_c_deer
        ["-664053099"] = {
            loot = {
                [1] = {
                    name = "deer_meat",
                    amount = math.random(1, 3)
                },
                [2] = {
                    name = "deer_pelt",
                    amount = 1,
                },
                [3] = {
                    name = "deer_antlers",
                    amount = math.random(0, 100) > 95 and 2 or 0, -- 5% de chance d'obtenir des cornes
                }
            }
        },
        -- a_c_boar
        ["-832573324"] = {
            loot = {
                [1] = {
                    name = "boar_meat",
                    amount = 1,
                },
                [2] = {
                    name = "fat",
                    amount = math.random(500, 750),
                }
            }
        },
        -- a_c_coyote
        ["1682622302"] = {
            loot = {
                [1] = {
                    name = "coyote_meat",
                    amount = math.random(3, 5),
                },
                [2] = {
                    name = "coyote_fur",
                    amount = 1,
                }
            }
        },
        -- a_c_mtlion
        ["307287994"] = {
            loot = {
                [1] = {
                    name = "cougar_meat",
                    amount = math.random(5, 8),
                },
                [2] = {
                    name = "cougar_fur",
                    amount = 1,
                }
            }
        },
        -- a_c_cormorant
        ["1457690978"] = {
            loot = {
                [1] = {
                    name = "cormoran_meat",
                    amount = 1,
                }
            }
        },
        -- a_c_chickenhawk
        ["-1430839454"] = {
            loot = {
                [1] = {
                    name = "hawk_meat",
                    amount = 1,
                }
            }
        },
        -- a_c_rabbit_01
        ["-541762431"] = {
            loot = {
                [1] = {
                    name = "rabbit_meat",
                    amount = 1,
                },
                [2] = {
                    name = "rabbit_fur",
                    amount = 1,
                }
            }
        },
        -- a_c_cow
        ["-50684386"] = {
            loot = {
                [1] = {
                    name = "cow_meat",
                    amount = math.random(8, 12),
                },
                [2] = {
                    name = "wagyu_meat",
                    amount = math.random(0, 100) > 0 and 5 or 0,
                }
            }
        },
        -- a_c_pig
        ["-1323586730"] = {
            loot = {
                [1] = {
                    name = "pig_meat",
                    amount = math.random(4, 7),
                },
                [2] = {
                    name = "fat",
                    amount = math.random(500, 750),
                }
            }
        },
    },
}