const { environment } = require('@rails/webpacker')

const vue =  require('./loaders/vue')
const scss =  require('./loaders/scss')
require('babel-polyfill')

environment.loaders.append('vue', vue)
environment.loaders.append('scss', scss)
environment.loaders.append('babel', {
  test: /\.js$/,
  loader: 'babel-loader'
})
module.exports = environment
