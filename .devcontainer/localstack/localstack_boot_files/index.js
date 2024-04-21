const http = require('http');

exports.handler = async (event) => {
  console.log('Received event:', JSON.stringify(event));

  // HTTPS POST リクエストの設定
  const options = {
    hostname: 'rails',  // Docker Compose で定義されたサービス名
    port: 3001,         // Lambdakiq サーバのポート
    path: '/lambdakiq', // Lambdakiq サーバのパス
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    }
  };

  // リクエストを送信
  await new Promise((resolve, reject) => {
    const req = http.request(options, (res) => {
      console.log(`Status Code: ${res.statusCode}`);
      res.on('data', (d) => {
        process.stdout.write(d);
      });
      res.on('end', resolve);
    });

    req.on('error', (e) => {
      console.error(e);
      reject(e);
    });

    // JSON 形式でメッセージを送信
    req.write(JSON.stringify({ event }));
    req.end();
  });

  return `Event sent successfully: ${event}`;
};
