return {
    ['testburger'] = {
        label = 'Test Burger',
        weight = 220,
        degrade = 60,
        client = {
            image = 'burger_chicken.png',
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            export = 'ox_inventory_examples.testburger'
        },
        server = {
            export = 'ox_inventory_examples.testburger',
            test = 'what an amazingly delicious burger, amirite?'
        },
        buttons = {
            {
                label = 'Lick it',
                action = function(slot)
                    print('You licked the burger')
                end
            },
            {
                label = 'Squeeze it',
                action = function(slot)
                    print('You squeezed the burger :(')
                end
            },
            {
                label = 'What do you call a vegan burger?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('A misteak.')
                end
            },
            {
                label = 'What do frogs like to eat with their hamburgers?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('French flies.')
                end
            },
            {
                label = 'Why were the burger and fries running?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('Because they\'re fast food.')
                end
            }
        },
        consume = 0.3
    },

    ['bandage'] = {
        label = 'Bandage',
        weight = 115,
    },

    ['medikit'] = {
        label = 'Trousse de soins',
        weight = 250,
    },

    ['defibrilateur'] = {
        label = 'Défibrillateur',
        weight = 500,
    },

    ['burger'] = {
        label = 'Burger',
        weight = 220,
        client = {
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            notification = 'You ate a delicious burger'
        },
    },

    ['burger_chicken'] = {
        label = 'Burger au poulet',
        weight = 220,
        client = {
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            notification = 'Vous mangez un burger au poulet...'
        },
    },

    ['sprunk'] = {
        label = 'Sprunk',
        weight = 350,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 2500,
            notification = 'You quenched your thirst with a sprunk'
        }
    },

    ['parachute'] = {
        label = 'Parachute',
        weight = 8000,
        stack = false,
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

    ['garbage'] = {
        label = 'Garbage',
    },

    ['paperbag'] = {
        label = 'Paper Bag',
        weight = 1,
        stack = false,
        close = false,
        consume = 0
    },

    ['panties'] = {
        label = 'Knickers',
        weight = 10,
        consume = 0,
        client = {
            status = { thirst = -100000, stress = -25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
            usetime = 2500,
        }
    },

    ['lockpick'] = {
        label = 'Lockpick',
        weight = 160,
    },

    ['phone'] = {
        label = 'Phone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function() return exports.npwd:setPhoneDisabled(false) end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function() return exports.npwd:setPhoneDisabled(true) end)
                end
            end
        }
    },

    ['mustard'] = {
        label = 'Mustard',
        weight = 500,
        client = {
            status = { hunger = 25000, thirst = 25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
            usetime = 2500,
            notification = 'You... drank mustard'
        }
    },

    ['water'] = {
        label = 'Water',
        weight = 500,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
            usetime = 2500,
            cancel = true,
            notification = 'You drank some refreshing water'
        }
    },


    -- Veste pare-balles
    ['bulletproof_vest_light'] = {
        label = 'Gillet pare-balles (léger)',
        weight = 1500,
        stack = false,
        description = 'Un gilet pare-balles léger, idéal pour les situations à faible risque. (30/100)',
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
        }
    },

    ['bulletproof_vest_heavy'] = {
        label = 'Gillet pare-balles (lourd)',
        weight = 2000,
        stack = false,
        description = 'Un gilet pare-balles lourd, idéal pour les situations à risque élevé. (60/100)',
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 4000
        }
    },

    ['bulletproof_vest_military'] = {
        label = 'Gillet pare-balles (militaire)',
        weight = 2500,
        stack = false,
        description = 'Un gilet pare-balles militaire, idéal pour les situations à risque extrême. (100/100)',
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 5000
        }
    },

    ['bulletproof_vest_police'] = {
        label = 'Gillet pare-balles (police)',
        weight = 2500,
        stack = false,
        description = 'Un gilet pare-balles de police. (100/100)',
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 5000
        }
    },

    ['clothing'] = {
        label = 'Clothing',
        consume = 0,
    },

    ['money'] = {
        label = 'Argent',
    },

    ['black_money'] = {
        label = 'Argent sale',
    },

    ['id_card'] = {
        label = 'ID',
    },

    ['driver_license'] = {
        label = 'Permis de conduire',
    },

    ['weapon_license'] = {
        label = "License d'arme",
    },

    ['lawyerpass'] = {
        label = "Carte d'avocat",
    },

    ['radio'] = {
        label = 'Radio',
        weight = 1000,
        allowArmed = true,
        consume = 0,
        client = {
            event = 'mm_radio:client:use'
        }
    },

    ['jammer'] = {
        label = 'Radio Jammer',
        weight = 10000,
        allowArmed = true,
        client = {
            event = 'mm_radio:client:usejammer'
        }
    },

    ['radiocell'] = {
        label = 'AAA Cells',
        weight = 1000,
        stack = true,
        allowArmed = true,
        client = {
            event = 'mm_radio:client:recharge'
        }
    },

    ['advancedlockpick'] = {
        label = 'Advanced Lockpick',
        weight = 500,
    },

    ['screwdriverset'] = {
        label = 'Screwdriver Set',
        weight = 500,
    },

    ['electronickit'] = {
        label = 'Electronic Kit',
        weight = 500,
    },

    ['cleaningkit'] = {
        label = 'Cleaning Kit',
        weight = 500,
    },

    ['repairkit'] = {
        label = 'Repair Kit',
        weight = 2500,
    },

    ['advancedrepairkit'] = {
        label = 'Advanced Repair Kit',
        weight = 4000,
    },

    ['diamond_ring'] = {
        label = 'Diamond',
        weight = 1500,
    },

    ['rolex'] = {
        label = 'Golden Watch',
        weight = 1500,
    },

    ['goldbar'] = {
        label = 'Gold Bar',
        weight = 1500,
    },

    ['goldchain'] = {
        label = 'Golden Chain',
        weight = 1500,
    },

    ['firstaid'] = {
        label = 'First Aid',
        weight = 2500,
    },

    ['painkillers'] = {
        label = 'Analgésiques',
        weight = 125,
    },

    ['firework1'] = {
        label = '2Brothers',
        weight = 1000,
    },

    ['firework2'] = {
        label = 'Poppelers',
        weight = 1000,
    },

    ['firework3'] = {
        label = 'WipeOut',
        weight = 1000,
    },

    ['firework4'] = {
        label = 'Weeping Willow',
        weight = 1000,
    },

    ['steel'] = {
        label = 'Steel',
        weight = 100,
    },

    ['rubber'] = {
        label = 'Rubber',
        weight = 100,
    },

    ['metalscrap'] = {
        label = 'Metal Scrap',
        weight = 100,
    },

    ['iron'] = {
        label = 'Iron',
        weight = 100,
    },

    ['copper'] = {
        label = 'Copper',
        weight = 100,
    },

    ['aluminium'] = {
        label = 'Aluminium',
        weight = 100,
    },

    ['plastic'] = {
        label = 'Plastic',
        weight = 100,
    },

    ['glass'] = {
        label = 'Glass',
        weight = 100,
    },

    ['gatecrack'] = {
        label = 'Gatecrack',
        weight = 1000,
    },

    ['cryptostick'] = {
        label = 'Crypto Stick',
        weight = 100,
    },

    ['trojan_usb'] = {
        label = 'Trojan USB',
        weight = 100,
    },

    ['toaster'] = {
        label = 'Toaster',
        weight = 5000,
    },

    ['small_tv'] = {
        label = 'Small TV',
        weight = 100,
    },

    ['security_card_01'] = {
        label = 'Security Card A',
        weight = 100,
    },

    ['security_card_02'] = {
        label = 'Security Card B',
        weight = 100,
    },

    ['drill'] = {
        label = 'Drill',
        weight = 5000,
    },

    ['thermite'] = {
        label = 'Thermite',
        weight = 1000,
    },

    ['diving_gear'] = {
        label = 'Diving Gear',
        weight = 30000,
    },

    ['diving_fill'] = {
        label = 'Diving Tube',
        weight = 3000,
    },

    ['antipatharia_coral'] = {
        label = 'Antipatharia',
        weight = 1000,
    },

    ['dendrogyra_coral'] = {
        label = 'Dendrogyra',
        weight = 1000,
    },

    ['jerry_can'] = {
        label = 'Jerrycan',
        weight = 3000,
    },

    ['nitrous'] = {
        label = 'Nitrous',
        weight = 1000,
    },

    ['wine'] = {
        label = 'Wine',
        weight = 500,
    },

    ['grape'] = {
        label = 'Grape',
        weight = 10,
    },

    ['grapejuice'] = {
        label = 'Grape Juice',
        weight = 200,
    },

    ['coffee'] = {
        label = 'Coffee',
        weight = 200,
    },

    ['vodka'] = {
        label = 'Vodka',
        weight = 500,
    },

    ['whiskey'] = {
        label = 'Whiskey',
        weight = 200,
    },

    ['beer'] = {
        label = 'beer',
        weight = 200,
    },

    ['sandwich'] = {
        label = 'beer',
        weight = 200,
    },

    ['walking_stick'] = {
        label = 'Walking Stick',
        weight = 1000,
    },

    ['lighter'] = {
        label = 'Lighter',
        weight = 200,
    },

    ['binoculars'] = {
        label = 'Binoculars',
        weight = 800,
    },

    ['stickynote'] = {
        label = 'Sticky Note',
        weight = 0,
    },

    ['empty_evidence_bag'] = {
        label = 'Empty Evidence Bag',
        weight = 200,
    },

    ['filled_evidence_bag'] = {
        label = 'Filled Evidence Bag',
        weight = 200,
    },

    ['harness'] = {
        label = 'Harness',
        weight = 200,
    },

    ['handcuffs'] = {
        label = 'Handcuffs',
        weight = 200,
    },

    -- Wasabi Police
    ['handcuffs'] = {
        label = 'Handcuffs',
        weight = 200,
    },
    ['bobby_pin'] = {
        label = 'Pince à cheveux',
        weight = 100,
        client = {
            image = 'bobby_pin.png',
        },
        description = 'Peut être utilisé comme outil de fortune pour crocheter les serrures...'
    },
    ['tracking_bracelet']  = {
        label = 'Bracelet de suivi',
        weight = 300,
        client = {
            image = 'tracking_bracelet.png',
        },
        description = 'Peut être utilisé pour suivre un suspect'
    },

    -- Wasabi Ambulance
    ['medbag']        = { name = 'medbag',        label = 'Medical Bag',    weight = 2500, type = 'item', image = 'medbag.png',     unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'A bag of medic tools' },
    ['tweezers']      = { name = 'tweezers',      label = 'Tweezers',       weight = 50,   type = 'item', image = 'tweezers.png',   unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'For picking out bullets' },
    ['suturekit']     = { name = 'suturekit',     label = 'Suture Kit',     weight = 60,   type = 'item', image = 'suturekit.png',  unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'For stitching your patients' },
    ['icepack']       = { name = 'icepack',       label = 'Ice Pack',       weight = 110,  type = 'item', image = 'icepack.png',    unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'To help reduce swelling' },
    ['burncream']     = { name = 'burncream',     label = 'Burn Cream',     weight = 125,  type = 'item', image = 'burncream.png',  unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'To help with burns' },
    ['defib']         = { name = 'defib',         label = 'Defibrillator',  weight = 1120, type = 'item', image = 'defib.png',      unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'Used to revive patients' },
    ['sedative']      = { name = 'sedative',      label = 'Sedative',       weight = 20,   type = 'item', image = 'sedative.png',   unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'If needed, this will sedate patient' },
    ['morphine30']    = { name = 'morphine30',    label = 'Morphine 30MG',  weight = 2,    type = 'item', image = 'morphine30.png', unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['morphine15']    = { name = 'morphine15',    label = 'Morphine 15MG',  weight = 2,    type = 'item', image = 'morphine15.png', unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['perc30']        = { name = 'perc30',        label = 'Percocet 30MG',  weight = 2,    type = 'item', image = 'perc30.png',     unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['perc10']        = { name = 'perc10',        label = 'Percocet 10MG',  weight = 2,    type = 'item', image = 'perc10.png',     unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['perc5']         = { name = 'perc5',         label = 'Percocet 5MG',   weight = 2,    type = 'item', image = 'perc5.png',      unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['vic10']         = { name = 'vic10',         label = 'Vicodin 10MG',   weight = 2,    type = 'item', image = 'vic10.png',      unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['vic5']          = { name = 'vic5',          label = 'Vicodin 5MG',    weight = 2,    type = 'item', image = 'vic5.png',       unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    ['medikit']       = { name = 'medikit',       label = 'Medical Kit',    weight = 110,  type = 'item', image = 'medikit.png',    unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A first aid kit for healing injured people.' },


    -- Drugs Shared
    ['empty_baggy'] = {
        label = 'Petit sachet (vide)',
        weight = 3, -- 3 g
        description = 'Je pourrais y mettre quelque chose...',
    },
    ['empty_tray'] = {
        label = 'Plateau vide',
        weight = 50, -- 50g
    },
    ['scissors'] = {
        label = 'Ciseaux',
        weight = 300, -- 300g
    },
    ['shear'] = {
        label = 'Sécateur',
        weight = 300, -- 300g
    },
    ['scale'] = {
        label = 'Balance',
        weight = 500, -- 500g
    },

    -- Drug Weed
    ['grinder'] = {
        label = 'Broyeur',
        weight = 250, -- 250g
        description = 'Broyeur à cannabis'
    },
    ['weed'] = {
        label = 'Feuille de cannabis',
        weight = 10, -- 10g
    },
    ['weed_baggy'] = {
        label = 'Sachet de cannabis',
        weight = 100, -- 100g
    },

    -- Meth
    ['meth_mixture'] = {
        label = 'Mélange de méthamphétamine',
        weight = 100, -- 100g
    },
    ['meth_tray'] = {
        label = 'Plateau de méthamphétamine',
        weight = 200, -- 200g
    },
    ['hammer'] = {
        label = 'Marteau',
        weight = 100, -- 100g
    },
    ['meth_crystal'] = {
        label = 'Méthamphétamine',
        weight = 7.5, -- 7.5g
    },
    ['meth_baggy'] = {
        label = 'Sachet de méthamphétamine',
        weight = 100, -- 100g
    },

    -- Drug Coke
    ['coca_leaf'] = {
        label = 'Feuille de coca',
        weight = 10, -- 10g
    },
    ['bakingsoda'] = {
        label = 'Bicarbonate de soude',
        weight = 100, -- 100g
    },
    ['cocaine_tray'] = {
        label = 'Plateau de cocaïne',
        weight = 200, -- 200g
    },
    ['cocaine_baggy'] = {
        label = 'Sachet de cocaïne',
        weight = 100, -- 100g
    },

    -- Hunting Deer
    ['deer_antlers'] = {
        label = 'Panache de cerf',
        weight = 250,
        client = {
            image = 'deer_antlers.png'
        }
    },
    ['deer_meat'] = {
        label = 'Viande de cerf',
        weight = 200,
        client = {
            image = 'deer_meat.png'
        },
        degrade = 48
    },
    ['deer_pelt'] = {
        label = 'Peau de cerf',
        weight = 250,
        client = {
            image = 'deer_pelt.png'
        }
    },

    -- Hunting Boar
    ['boar_meat'] = {
        label = 'Viande de sanglier',
        weight = 1500,
        client = {
            image = 'boar_meat.png'
        },
        degrade = 48
    },
    ['fat'] = {
        label = "Graisse d'animal",
        weight = 1,
        client = {
            image = 'fat.png'
        }
    },

    -- Hunting coyote
    ['coyote_meat'] = {
        label = 'Viande de coyote',
        weight = 150,
        client = {
            image = 'coyote_meat.png'
        },
        degrade = 48
    },
    ['coyote_fur'] = {
        label = 'Fourrure de coyote',
        weight = 250,
        client = {
            image = 'coyote_fur.png'
        }
    },

    -- Hunting Cougar
    ['cougar_fur'] = {
        label = 'Fourrure de cougar',
        weight = 350,
        client = {
            image = 'cougar_fur.png'
        }
    },
    ['cougar_meat'] = {
        label = 'Viande de cougar',
        weight = 150,
        client = {
            image = 'cougar_meat.png'
        },
        degrade = 48
    },

    -- Hunting bird
    ['cormoran_meat'] = {
        label = "Viande de cormoran",
        weight = 50,
        client = {
            image = 'bird_meat.png'
        },
        degrade = 48
    },
    ['hawk_meat'] = {
        label = "Viande d'aigle",
        weight = 50,
        client = {
            image = 'bird_meat.png'
        },
        degrade = 48
    },

    -- Hunting rabbit
    ['rabbit_meat'] = {
        label = "Viande de lapin",
        weight = 50,
        client = {
            image = 'rabbit_meat.png'
        },
        degrade = 48
    },
    ['rabbit_fur'] = {
        label = "Fourrure de lapin",
        weight = 50,
        client = {
            image = 'rabbit_fur.png'
        }
    },

    -- Hunting cow
    ['cow_meat'] = {
        label = "Viande de vache",
        weight = 150,
        client = {
            image = 'cow_meat.png'
        },
        degrade = 48
    },
    ['wagyu_meat'] = {
        label = "Viande de wagyu",
        weight = 150,
        client = {
            image = 'wagyu_meat.png'
        },
        degrade = 48
    },

    -- Hunting pig
    ['pig_meat'] = {
        label = "Viande de porc",
        weight = 75,
        client = {
            image = 'pig_meat.png'
        },
        degrade = 48
    },
}