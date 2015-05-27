var http = require('http');
var router = require('node-simple-router')({list_dir: false});

router.get("/hello", function(request, response) {response.end("Hello, World!");});
router.get("/hello", function(request, response) {response.end("Hello, World!");});

http.createServer(router).listen(1187);
