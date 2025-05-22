SVConfig = {}

SVConfig.ShopItems = {
    weed_baggy_buyer  = {             
        {name = 'weed_baggy', amount = math.random(28, 33),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
    }, 
    blanchisseur  = {             
        {name = 'black_money', amount = 0.7,  payoutItem = 'money', payoutItemLabel = 'Argent'},
    },
    cocaine_buyer  = {             
        {name = 'cocaine_baggy', amount = math.random(47, 59),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
    },
    meth_buyer  = {             
        {name = 'meth_baggy', amount = math.random(112, 130),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
    },
    meat_buyer  = {             
        {name = 'deer_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'boar_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'cormoran_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'rabbit_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'cow_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'wagyu_meat', amount = math.random(250, 312),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'pig_meat', amount = math.random(56, 72),  payoutItem = 'money', payoutItemLabel = 'Argent'},
        {name = 'fat', amount = math.random(1, 2) * 0.5,  payoutItem = 'money', payoutItemLabel = 'Argent'}
    },
    illegal_meat_buyer  = {             
        {name = 'coyote_meat', amount = math.random(250, 312),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
        {name = 'coyote_fur', amount = math.random(250, 312),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
        {name = 'cougar_meat', amount = math.random(250, 312),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
        {name = 'cougar_fur', amount = math.random(250, 312),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
        {name = 'hawk_meat', amount = math.random(250, 312),  payoutItem = 'black_money', payoutItemLabel = 'Argent sale'},
    },
}