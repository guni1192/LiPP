<template>
  <div id="repos">
    <v-list>
      <v-subheader>Your Repositories</v-subheader>
      <v-list-tile v-for="repo in repos" @click="">
        <v-list-tile-title>{{ repo.name }}</v-list-tile-title>
      </v-list-tile>
    </v-list>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      repos: []
    }
  },
  mounted: function() {
    this.getRepositories()
  },
  methods: {
    getRepositories: function() {
      axios.get('/api/v1/repos')
        .then((response) => {
          this.repos = response.data
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped lang="scss">
</style>

