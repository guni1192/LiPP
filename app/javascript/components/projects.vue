<template>
  <div>
    <h1>Dashboard</h1>
    <hr>
    <v-container>
      <v-layout
        row
        wrap>
        <v-flex
          v-for="project in projects"
          :key="project.full_name"
          offset-sm1>
          <v-card>
            <v-card-title primary-title>
              <h3>{{ project.full_name }}</h3>
            </v-card-title>
            <v-card-text>{{ project.gh_user }}</v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      projects: []
    }
  },
  mounted: function () {
    this.getProjects()
  },
  methods: {
    getProjects: function () {
      axios.get('/api/v1/projects')
        .then((response) => {
          this.projects = response.data
        })
    }
  }
}
</script>

<style scoped lang="scss">

</style>
