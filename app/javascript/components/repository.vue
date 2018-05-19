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
        @click="deleteProject">Delete</v-btn>
      <v-btn
        v-else
        color="green"
        @click="addProjects">Add</v-btn>
      <br>
      <div v-show="logs">
        <pre><code>{{ logs }}</code></pre>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      repo: {},
      isGetting: true,
      isRegisted: false,
      logs: ''
    }
  },
  mounted: function () {
    this.getRepositoryInfo()
    this.getProjectLogs()
  },
  methods: {
    getRepositoryInfo: function () {
      this.isGetting = true
      axios.get('/api/v1/repos/' + this.$route.params.id)
        .then((response) => {
          this.repo = response.data
          this.getProjectInfo()
        })
    },
    addProjects: function () {
      this.isGetting = true
      axios.post('/api/v1/projects', { repo_id: this.repo.id })
        .then(() => { this.getProjectInfo() })
    },
    getProjectInfo: function () {
      this.isGetting = true
      axios.get('/api/v1/projects/' + this.$route.params.id)
        .then(() => {
          this.isRegisted = true
          this.isGetting = false
        })
        .catch(() => {
          this.isRegisted = false
          this.isGetting = false
        })
    },
    getProjectLogs: function () {
      axios.get('/api/v1/projects/' + this.$route.params.id + '/logs')
        .then((response) => {
          this.isGetting = false
          this.logs = response.data
        })
        .catch(() => {
          this.isGetting = false
        })
    },
    deleteProject: function () {
      axios.delete('/api/v1/projects/' + this.$route.params.id)
        .then(() => { this.getProjectInfo() })
    }
  }
}
</script>

<style scoped lang="scss">
a {
  text-decoration: none;
}

code {
  color: white;
  background-color: black;
  margin: 20px;
  padding: 20px;
}
</style>
