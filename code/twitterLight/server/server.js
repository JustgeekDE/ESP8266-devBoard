var http = require('http');
var router = require('node-simple-router')({list_dir: false});
var url = require('url') ;

var Twit = require('twit')
var config = require('./config.js')

var T = new Twit(config.twitter)

router.get("/hello", function(request, response) {response.end("Hello, World!");});
router.get("/sinceId", function(request, response) {
  var queryObject = url.parse(request.url,true).query;

  var result = 0;
  var startId = queryObject['id'];
  var tag = queryObject['tag'];

  if(typeof startId === 'undefined') {
    startId = 0;
  }

  if(typeof tag !== 'undefined') {
    T.get('search/tweets', { q: tag, since_id:startId, count: 2 }, function(err, data, res) {
      console.log(data['statuses'].length);
      response.end('len: ' + data['statuses'].length);
    });
  } else {
    response.end("0");
  }
});

http.createServer(router).listen(1187);
