<template>
  <div>
    {{ projects }}
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
