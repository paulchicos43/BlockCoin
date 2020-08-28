const axios = require('axios')

axios.post('https://sandbox.plaid.com/link/token/create', {
    client_id: '5f08b5935cbe90001101a460',
    secret: 'c76b140e9f4a71498744c839704cb3',
    client_name: 'BlockCoin',
    language: 'en',
    country_codes: ['US'],
    products: ['auth'],
    user: {
        client_user_id: 'pchicos@wisc.edu'
    },

})
.then((result) => {
    console.log(result)
})
.catch((error) => {
    console.log(error)
})