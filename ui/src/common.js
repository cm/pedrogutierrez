module.exports = function(config) {
  require('./elm/Main.elm')
    .Main
    .embed( document.getElementById("main"), config);
  if (module.hot) {
      module.hot.accept()
  }
}
