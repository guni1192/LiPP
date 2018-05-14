import Vue from 'vue'
import Vuetify from 'vuetify'
import router from '../router'
import App from '../app.vue'

// import('font-awesome/css/font-awesome.min.css')
// import('font-awesome/fonts/fontawesome-webfont.ttf')
import('vuetify/dist/vuetify.min.css')

Vue.use(Vuetify)

window.addEventListener('load', () => {
  const el = document.body.appendChild(document.createElement('app'))
  new Vue({
    el,
    router,
    render: h => h(App)
  })
})
