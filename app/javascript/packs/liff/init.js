import liff from '@line/liff'

document.addEventListener('DOMContentLoaded', () => {
  liff.init({
    liffId: process.env.LIFF_ID
  })
  .then(() => {
    alert('ok')
  })
  .catch((err) => {
    alert('ng')
  })
})