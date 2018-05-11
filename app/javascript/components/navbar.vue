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
        <v-list-tile avatar @click="goUserInfo">
          <v-list-tile-avatar>
            <img :src="user.avatar_url" id="user-icon">
          </v-list-tile-avatar>
          <v-list-tile-title v-text="user.login"></v-list-tile-title>
        </v-list-tile>
        <v-list-tile v-for="item in items" :key="item.text" @click="">
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>
              {{ item.text }}
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
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-icon class="mx-3">fab fa-youtube</v-icon>
      <v-toolbar-title class="mr-5 align-center">
        <span class="title">Hujiwara</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
    </v-toolbar>
    <slot></slot>
  </v-app>
</template>


<script>
import router from '../router'

export default {
  data: function() {
    return {

      drawer: true,
      items: [
        { icon: 'trending_up', text: 'Most Popular' },
        { icon: 'subscriptions', text: 'Subscriptions' },
        { icon: 'history', text: 'History' },
        { icon: 'featured_play_list', text: 'Playlists' },
        { icon: 'watch_later', text: 'Watch Later' }
      ],
      items2: [
        { picture: 28, text: 'Joseph' },
        { picture: 38, text: 'Apple' },
        { picture: 48, text: 'Xbox Ahoy' },
        { picture: 58, text: 'Nokia' },
        { picture: 78, text: 'MKBHD' }
      ]
    }
  },
  props: ['user'],
  methods: {
    goUserInfo: function() {
      router.push({ path: '/user/info' })
    }
  }

}
</script>

<style scoped lang="scss">
</style>
