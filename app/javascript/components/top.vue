<template>
  <div>
    <v-jumbotron
      :gradient="gradient"
      dark>
      <v-container fill-height>
        <v-layout align-center>
          <v-flex text-xs-center>
            <h3 class="display-3">LiPP is OSS PaaS</h3>
            <v-btn
              color="success"
              @click="() => redirect('/auth/github')">
              Start Deploy Your App !!
            </v-btn>
          </v-flex>
        </v-layout>
      </v-container>
    </v-jumbotron>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      gradient: 'to top, #F00FFF, #FF0000'
    }
  },
  mounted: function () {
  },
  methods: {
    redirect: function (href) {
      location.href = href
    }
  }
}
</script>

<style scoped lang="scss">
</style>
