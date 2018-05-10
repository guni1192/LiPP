<template>
  <div id="app">
    <p>{{ message }}</p>
    <v-app>
      <v-content>
        <v-container>Hello world</v-container>
        <div>
          <v-btn color="success">Success</v-btn>
          <v-btn color="error">Error</v-btn>
          <v-btn color="warning">Warning</v-btn>
          <v-btn color="info">Info</v-btn>
        </div>
      </v-content>
    </v-app>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: 'Hello Vue!'
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
