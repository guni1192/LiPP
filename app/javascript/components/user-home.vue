<template>
  <div id="user-home">
    <img
      id="user_icon"
      :src="user.avatar_url"
      alt=""><br>
    <h1><a :href="user.html_url">{{ user.login }}</a></h1>
  </div>
</template>

<script>
import axios from 'axios'

export default {
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
img {
  height: 80px;
}

</style>

