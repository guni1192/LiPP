import Vue from 'vue'
import VueRouter from 'vue-router'

// import UserSettings from './components/user-settings'
import UserInfo from './components/user-home.vue'

Vue.use(VueRouter)

const routes = [
  // { path: '/settings', component: UserSettings },
  // { path: '/projects/new', component: AddProject },
  // { path: '/projects/edit/:id', component: EditProject },
  // { path: '/projects/:id', component: ProjectInfo, name: 'project' },
  { path: '/user/info', component: UserInfo },
]

export default new VueRouter({ routes })
