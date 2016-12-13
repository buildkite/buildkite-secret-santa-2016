var AWS = require('aws-sdk');
var ses = new AWS.SES();
var secretSanta = require('./secret-santa');

exports.handler = function (event, context) {
	console.log('Received event:', JSON.stringify(event));
	context.done(null, 'OK');
}
