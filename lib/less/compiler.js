var less = require('less');

function render(source, options) {
  var output = '';
  less.render(source, options, function (err, css) {
    callback(err, css);
  });
}