import liff from '@line/liff'

document.addEventListener('DOMContentLoaded', () => {
  liff.init({
    liffId: process.env.LIFF_ID
  })
  .then(() => {
    // if (!liff.isLoggedIn()) {
    //   console.log('not login')
    //   liff.login();
    // }
    console.log(liff.getIDToken())
  })
  .catch((err) => {
    console.log('error')
  })
})