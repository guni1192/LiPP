<template>
  <div id="app">
    <v-app>
      <v-content>
        <v-container>
          <navbar-component :user="user"></navbar-component>
          <router-link to="/user/info">
            <v-btn large depressed color="primary">
              <img id="user_icon" :src="user.avatar_url" alt="">
              {{ user.login }}
            </v-btn>
          </router-link>
          <router-view />
        </v-container>
        </navbar-component>

      </v-content>
    </v-app>
  </div>
</template>

<script>
import axios from 'axios'
import NavbarComponent from './components/navbar.vue'

export default {
  components: {
    'navbar-component': NavbarComponent,
  },
  data: function () {
    return {
      user: {}
    }
  },
  mounted: function() {
    this.userInfo()
  },
  methods: {
    userInfo: function() {
      axios.get('/api/v1/user/detail')
        .then((response) => {
          this.user = response.data
        })
    }
  }
}
</script>

<style scoped lang="scss">
#user_icon {
  height: 40px;
  border-radius: 20px;
  margin: 10px
}
</style>
