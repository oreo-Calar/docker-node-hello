// 引入 express 框架（Node.js 最流行的 Web 框架，处理 HTTP 请求更方便）
var express = require('express');

// 默认配置：端口 8080，问候对象 World
var DEFAULT_PORT = 8080;
var DEFAULT_WHO = "World";
// 优先读环境变量 PORT，没设就用默认 8080
var PORT = process.env.PORT || DEFAULT_PORT;
// 优先读环境变量 WHO，没设就用默认 World
var WHO = process.env.WHO || DEFAULT_WHO;

// 创建 Express 应用实例
var app = express();
// 定义路由：用户访问网站根路径 "/" 时，返回一句问候
// req = 请求对象（用户发来的数据）
// res = 响应对象（用来给用户返回内容）
app.get('/', function (req, res) {
  res.send('Hello ' + WHO + '. Wish you were here.\n');
});

// 启动服务器，开始监听端口
app.listen(PORT);

// 控制台打印启动信息
console.log('Running on http://localhost:' + PORT);