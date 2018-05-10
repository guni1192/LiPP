const { environment } = require('@rails/webpacker')

// environment.loaders.get('vue').options.extractCSS = false
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.loaders.append('babel', {
  test: /\.js$/,
  loader: 'babel-loader'
})
module.exports = environment
