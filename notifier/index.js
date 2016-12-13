const AWS = require('aws-sdk');
const jobEventProcesssor = require('./job-event-processor').process;
const secretSanta = require('./secret-santa');
const randomSeed = parseInt(process.env['SECRET_SANTA_RANDOM_SEED']) || 42;

exports.handler = function (event, context) {
	console.log('Received webhook event:', JSON.stringify(event));

  const answers = jobEventProcesssor(event);

  if (answers) {
    const secretSantaList = secretSanta.calculate(randomSeed, answers);

    secretSantaList.forEach(function(listItem) {
      sendEmail(listItem, function(err) {
        context.done(err, 'OK');
      });
    });
  } else {
    context.done(null, 'OK');
  }
}

function sendEmail(listItem, done) {
  const ses = new AWS.SES();
  const message = secretSanta.message(listItem);
  const subject = 'Your Buildkite Secret Santa';
  const adminEmail = '"Tim" <tim@' + 'buildkite.com' + '>';

  var params = {
    Source: adminEmail,
    Destination: {
      ToAddresses: [`"${listItem.name}" <${listItem.email}>`],
    },
    Message: {
      Body: {
        Text: {
          Data: message,
          Charset: 'UTF-8'
        }
      },
      Subject: {
        Data: '🎄 Hello Buildkite Secret Santa',
        Charset: 'UTF-8'
      }
    }
  }

  ses.sendEmail(params, done);
}
