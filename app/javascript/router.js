import Vue from 'vue'
import VueRouter from 'vue-router'

import UserInfo from './components/user-home.vue'
import Repositories from './components/repositories.vue'
import Repository from './components/repository.vue'
import Top from './components/top.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Top },
  { path: '/user/info', component: UserInfo },
  { path: '/repos/:id', name: 'repo', component: Repository },
  { path: '/repos', component: Repositories }
]

export default new VueRouter({ routes })
