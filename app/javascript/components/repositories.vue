<template>
  <div id="repos">
    <v-container
      v-if="isGetting"
      grid-list-xl
      text-xs-center>
      <v-layout
        row
        wrap>
        <v-flex
          xs10
          offset-xs1>
          <v-progress-circular
            :size="200"
            class=""
            indeterminate
            color="red"/>
        </v-flex>
      </v-layout>
    </v-container>

    <v-list v-else>
      <v-subheader>Your Repositories</v-subheader>
      <v-list-tile
        v-for="repo in repos"
        :key="repo.id"
        @click="goRepoPath">
        <v-list-tile-title>
          <router-link
            :to="{ name: 'repo', params: { id: repo.id } }"
            class="repo-link">
            {{ repo.name }}
          </router-link>
        </v-list-tile-title>
        <a :href="repo.html_url">
          <v-btn
            icon
            ripple>
            <v-icon>fab fa-github</v-icon>
          </v-btn>
        </a>
      </v-list-tile>
    </v-list>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      repos: [],
      isGetting: false
    }
  },
  mounted: function () {
    this.getRepositories()
  },
  methods: {
    getRepositories: function () {
      this.isGetting = true
      axios.get('/api/v1/repos')
        .then((response) => {
          this.repos = response.data
          this.isGetting = false
        })
    },
    goRepoPath: function () {}
  }
}
</script>

<style scoped lang="scss">
a {
  text-decoration: none;
}

.repo-link {
  text-decoration: none;
  color: white;
}
</style>
