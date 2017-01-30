#!/usr/bin/env node
var fs = require('fs');
var fileLocation = '';
var configLocation = __dirname+'/config.json';
if (process.env['ENVFILE']) {
  fileLocation = process.cwd()+'/'+process.env['ENVFILE'];
} else {
  fileLocation = process.cwd()+'/.env.staging';
}
console.log('Reading from '+fileLocation);
console.log('Piping too '+configLocation);

fs.createReadStream(fileLocation).pipe(fs.createWriteStream(configLocation));
console.log("Done")
