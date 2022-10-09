
fetch("https://tiny-hello.fly.dev/").then(resp => resp.json()).then(data => console.log("😀", data)).catch(err=> console.log("😡", err))

// https://oxylabs.io/blog/nodejs-fetch-api
// nvm install 17.5
// node --experimental-fetch index.js