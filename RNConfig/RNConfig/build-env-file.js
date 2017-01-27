#!/usr/bin/env node
var jsonfile = require('jsonfile');
console.log('Hello, world!');
for(env in process.env) {
  console.log(env," = ", process.env[env])
}
console.log("GOOD BY WORLD")
