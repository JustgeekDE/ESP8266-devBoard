var http = require('http');
var router = require('node-simple-router')({list_dir: false});

var Twit = require('twit')
var config = require('./config.js')

var T = new Twit(config.twitter)
T.get('search/tweets', { q: 'banana since:2011-11-11', count: 100 }, function(err, data, response) {
  console.log(data)
})


router.get("/hello", function(request, response) {response.end("Hello, World!");});
router.get("/sinceId", function(request, response) {
  response.end("Hello, World!");
});

http.createServer(router).listen(1187);
