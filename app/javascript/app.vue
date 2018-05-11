<template>
  <div id="app">
    <v-app>
      <navbar-component :user="user">
        <v-content>
          <v-container>
            <router-view />
          </v-container>
        </v-content>
      </navbar-component>
    </v-app>
  </div>
</template>

<script>
import axios from 'axios'
import NavbarComponent from './components/navbar.vue'

export default {
  components: {
    'navbar-component': NavbarComponent
  },
  data: function () {
    return {
      user: {}
    }
  },
  mounted: function () {
    this.userInfo()
  },
  methods: {
    userInfo: function () {
      axios.get('/api/v1/user/detail')
        .then((response) => {
          this.user = response.data
        })
    }
  }
}
</script>

<style scoped lang="scss">
</style>
