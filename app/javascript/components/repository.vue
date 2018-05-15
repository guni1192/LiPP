<template>
  <div id="repo">
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
            indeterminate
            color="red"/>
        </v-flex>
      </v-layout>
    </v-container>

    <div v-else>
      <h1 v-text="repo.full_name"/>
      <a :href="repo.html_url">
        <v-icon dark>fab fa-github</v-icon>
      </a>

      <v-btn
        v-if="isRegisted"
        color="red"
        @click="getProjectInfo">Delete</v-btn>
      <v-btn
        v-else
        color="green"
        @click="addProjects">Add</v-btn>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      repo: {},
      isGetting: false,
      isRegisted: false
    }
  },
  mounted: function () {
    this.getRepositoryInfo()
    this.getProjectInfo()
  },
  methods: {
    getRepositoryInfo: function () {
      this.isGetting = true
      axios.get('/api/v1/repos/' + this.$route.params.id)
        .then((response) => {
          this.repo = response.data
          this.isGetting = false
        })
    },
    addProjects: function () {
      this.isGetting = true
      const projectCreate = axios.post('/api/v1/projects', { repo_id: this.repo.id })
      Promise.all([projectCreate, this.getProjectInfo])
        .then(() => {
          this.isRegisted = true
          this.isGetting = false
        })
        .catch(() => {
          this.isRegisted = false
          this.isGetting = false
        })
    },
    getProjectInfo: function () {
      return axios.get('/api/v1/projects/' + this.$route.params.id)
    }
  }
}
</script>

<style scoped lang="scss">
a {
  text-decoration: none;
}
</style>
