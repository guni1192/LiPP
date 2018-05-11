<template>
  <v-app
    id="inspire"
    dark
  >
    <v-navigation-drawer
      v-model="drawer"
      fixed
      clipped
      app
    >
      <v-list dense>
        <v-list-tile
          avatar
          @click="() => { goPath('/user/info') }">
          <v-list-tile-avatar>
            <img
              id="user-icon"
              :src="user.avatar_url">
          </v-list-tile-avatar>
          <v-list-tile-title v-text="user.login"/>
        </v-list-tile>
        <v-list-tile
          v-for="item in items"
          :key="item.text"
          @click="() => { goPath(item.path) }">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              {{ item.text }}
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="() => { redirect('/logout') }">
          <v-list-tile-action>
            <v-icon>exit_to_app</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              Logout
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>

      </v-list>
    </v-navigation-drawer>
    <v-toolbar
      color="red"
      dense
      fixed
      clipped-left
      app
    >
      <v-toolbar-side-icon @click.stop="drawer = !drawer"/>
      <v-icon class="mx-3">fab fa-youtube</v-icon>
      <v-toolbar-title class="mr-5 align-center">
        <span class="title">Hujiwara</span>
      </v-toolbar-title>
      <v-spacer/>
    </v-toolbar>
    <slot/>
  </v-app>
</template>

<script>
import router from '../router'

export default {
  props: {
    user: {
      type: Object,
      default: () => {},
      required: false
    }
  },
  data: function () {
    return {
      drawer: true,
      items: [
        { path: '/dashboard', icon: 'dashboard', text: 'Dashboard' },
        { path: '/repos', icon: 'apps', text: 'Repositories' }
      ]
    }
  },
  methods: {
    goPath: function (path) {
      router.push({ path: path })
    },
    redirect: function (href) {
      location.href = '/logout'
    }

  }

}
</script>

<style scoped lang="scss">
a {
  text-decoration: none;
  color: white;
}
</style>
