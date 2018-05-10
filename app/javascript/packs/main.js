import Vue from 'vue'
import Vuetify from 'vuetify'
import App from '../app.vue'

import('vuetify/dist/vuetify.min.css')
import('material-design-icons-iconfont/dist/material-design-icons.css')

Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  new Vue({
    el,
    render: h => h(App)
  })
})
