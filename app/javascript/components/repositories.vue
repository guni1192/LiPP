<template>
  <div id="repos">
    <v-list>
      <v-subheader>Your Repositories</v-subheader>
      <v-list-tile
        v-for="repo in repos"
        :key="repo.id"
        @click="goRepoPath">
        <v-list-tile-title>{{ repo.name }}</v-list-tile-title>
        <a :href="repo.html_url"><v-icon
          dark
          left>code</v-icon></a>
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
  mounted: function () {
    this.getRepositories()
  },
  methods: {
    getRepositories: function () {
      axios.get('/api/v1/repos')
        .then((response) => {
          this.repos = response.data
        })
    },
    goRepoPath: function () {}
  }
}
</script>

<style scoped lang="scss">
</style>
