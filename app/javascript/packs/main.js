import Vue from 'vue'
import Vuetify from 'vuetify'
import router from '../router'
import App from '../app.vue'

import('vuetify/dist/vuetify.min.css')
import('material-design-icons-iconfont/dist/material-design-icons.css')

Vue.use(Vuetify)

window.addEventListener('load', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  new Vue({
    el,
    router,
    render: h => h(App)
  })
})
