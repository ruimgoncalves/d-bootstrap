module.exports = function(app, options) {
  app.component(require('./dropdown'));
  app.component(require('./modal'));
  app.component(require('./tabs'));
  app.component(require('./alert'));
  app.component(require('./contextMenu'));
  app.component(require('./paginator'));
  app.component(require('./navbar'));
  if(!options || (options && options.loadStyles)) app.loadStyles(__dirname + '/node_modules/bootstrap/dist/css/bootstrap.min');
};
