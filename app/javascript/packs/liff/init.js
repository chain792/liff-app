import liff from '@line/liff'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  liff.init({
    liffId: process.env.LIFF_ID
  })
  .then(async () => {
    if (!liff.isLoggedIn()) {
      console.log('not login')
      liff.login();
    }
    const idToken = liff.getIDToken()
    try {
      const headers = {
        'X-CSRF-Token': token
      }
      const res = await axios.post(`/liff/users/sign_in`, {
        idToken
      }, {
        headers
      })
    } catch(e) {
      console.log(e)
    }

  })
  .catch((err) => {
    console.log('error')
  })
})