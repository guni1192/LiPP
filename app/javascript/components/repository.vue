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
      <div v-show="status">
        <v-chip
          color="green"
          text-color="white">
          <v-avatar>
            <v-icon>done</v-icon>
          </v-avatar>
          {{ status }}
        </v-chip>
      </div>

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
      isRegisted: true,
      logs: '',
      status: ''
    }
  },
  mounted: function () {
    this.init()
  },
  methods: {
    init: async function () {
      this.isGetting = true
      this.repo = (await this.getRepositoryInfo()).data
      await this.getProjectInfo().catch(() => { this.isRegisted = false })
      if (this.isRegisted) {
        let res = await this.getProjectLogs().catch(() => 'error')
        if (res !== 'error') { this.logs = res.data }
        res = (await this.getContainerStatus().catch(() => 'error'))
        if (res !== 'error') { this.status = res.data.State.Status }
      }
      this.isGetting = false
    },
    getRepositoryInfo: function () {
      return axios.get('/api/v1/repos/' + this.$route.params.id)
    },
    addProjects: async function () {
      this.isGetting = true
      await axios.post('/api/v1/projects', { repo_id: this.repo.id })
      await this.getProjectInfo()
      this.isGetting = false
    },
    getProjectInfo: function () {
      return axios.get('/api/v1/projects/' + this.$route.params.id)
    },
    getProjectLogs: function () {
      return axios.get('/api/v1/projects/' + this.$route.params.id + '/logs')
    },
    getContainerStatus: function () {
      return axios.get('/api/v1/projects/' + this.$route.params.id + '/info')
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
