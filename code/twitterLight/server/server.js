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
  var startId = queryObject['since'];
  var tag = queryObject['tag'];

  if(typeof startId === 'undefined') {
    startId = 0;
  }

  if(typeof tag !== 'undefined') {
    var searchOptions = {
      q: tag,
      since_id: startId,
      count: 100,
      result_type: 'recent',
      include_entities: 0
    };

    T.get('search/tweets', searchOptions, function(err, data, res) {
      var result = {
        length: data['statuses'].length,
         maxId: data['search_metadata']['max_id']
      }
      response.end(JSON.stringify(result));
      // console.log(data)
    });
  } else {
    var result = {
      length: 0,
       maxId: 0,
       error: 'no tag'
    }
    response.end(JSON.stringify(result));
  }
});

http.createServer(router).listen(1187);
