return {
    idCardSettings = {
        closeKey = 'Backspace',
        autoClose = {
            status = false, -- or true
            time = 3000
        }
    },

    licenses = {
        ['id_card'] = {
            header = 'Carte identité',
            background = '#ebf7fd',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl'
        },
        ['driver_license'] = {
            header = 'Permis de conduire',
            background = '#febbbb',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl',
        },
        ['weapon_license'] = {
            header = "Permis d'arme",
            background = '#c7ffe5',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl',
        },
        ['lawyerpass'] = {
            header = "Carte d'avocat",
            background = '#f9c491',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_cs_r_business_card'
        }
    }
}
