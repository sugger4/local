const port = 8888;
const hostname = '192.168.33.10';

// http のモジュールを用意
var http = require('http');
var fs   = require('fs');

// サーバの作成
var server = http.createServer();

server.on('request', function (req, res) {

	// 指定がなかった場合
	if(req.url == '/') {
		req.url = 'index.html';
	}

	// 指定されたファイルの読み込み
	fs.readFile('./' + req.url, 'utf-8', function(error, data) {
		if(error) {
			// 見つからなかった場合は404を返す
			console.log("[code 404]request url:" + req.url);
			res.writeHead(404, {'Content-type': 'text/plain'});
			res.write('404 Not Found!!');
			return res.end();
		}

		// ファイルが中身を読み込んで返す
		console.log("[code 200]request url:" + req.url);
		res.writeHead(200, {'content-type': 'text/html'});
		res.write(data);
		res.end();

	});

});

// socket io
var io = require("socket.io").listen(server);

// サーバーの起動
server.listen(port, hostname, function () {
	console.log("Node server running...");
	console.log("at http://" + hostname + ":" + port);
});

io.sockets.on('connection', function(socket) {
	socket.emit('greeting', {message: 'hello'}, function(data) {
		console.log('result: ' + data);
	});
});