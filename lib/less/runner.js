(function(program, execJS) { execJS(program) })(function(callback) { #{source}
}, function(program) {
  var output, print = function(string) {
    process.stdout.write('' + string);
  };

  program(function(err, result){
    if (err) {
      print(JSON.stringify(['err', err.message]));
    } else {
      if (typeof result == 'undefined' && result !== null) {
        print('["ok"]');
      } else {
        print(JSON.stringify(['ok', result]));
      }
    }
  });
});