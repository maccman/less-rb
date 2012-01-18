var less = require('less');

function render(source, options) {
  var output = '';
  try {
    less.render(source, options, function (err, css) {
      callback(err, css);
    });
  } catch(err){
    callback(err);
  }
}