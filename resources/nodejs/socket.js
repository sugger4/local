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

// サーバーの起動
server.listen(port, hostname, function () {
	console.log("Node server running...");
	console.log("at http://" + hostname + ":" + port);
});

// socket io
var io = require("socket.io").listen(server);

// socket io 接続
io.on('connection', function(socket){

  socket.on('send_message', function(text){
    console.log("receive message: " + text);

  	// 本人に送信
	socket.emit('receive_message',text);

	// 他の人にも送信
	socket.broadcast.emit('receive_message', text);
  });
});