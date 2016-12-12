const fs = require('fs');
const assert = require('assert');
const secretSanta = require('./secret-santa').secretSanta;
const jobEventProcesssor = require('./job-event-processor').process;

describe('secretSanta', function() {
  context('with a valid payload body', function() {
    const payload = JSON.parse(fs.readFileSync('tests/job-finished-payload.json'));

    it('returns hints', function() {
      const secretSantaList = secretSanta(42, jobEventProcesssor(payload));

      assert.deepEqual({
        "Harriet": {
          "email": "harriet@buildkite.com",
          "received": {
            "address": "Sam's address",
            "email": "sam@buildkite.com",
            "hint": "Sam's hint",
            "name": "Sam"
          }
        },
        "Jess": {
          "email": "jess@buildkite.com",
          "received": {
            "address": "Tim's address",
            "email": "tim@buildkite.com",
            "hint": "Tim's hint",
            "name": "Tim"
          }
        },
        "Keith": {
          "email": "keith@buildkite.com",
          "received": {
            "address": "Jess's address",
            "email": "jess@buildkite.com",
            "hint": "Jess's hint",
            "name": "Jess"
          }
        },
        "Sam": {
          "email": "sam@buildkite.com",
          "received": {
            "address": "Keith's address",
            "email": "keith@buildkite.com",
            "hint": "Keith's hint",
            "name": "Keith"
          }
        },
        "Tim": {
          "email": "tim@buildkite.com",
          "received": {
            "address": "Harriet's address",
            "email": "harriet@buildkite.com",
            "hint": "Harriet's hint",
            "name": "Harriet"
          }
        }
      }, secretSantaList);
    });
  })

  context('with a payload body for a non-unicorn event', function() {
    const payload = JSON.parse(fs.readFileSync('tests/job-finished-incorrect-payload.json'));

    it('returns null', function() {
      const secretSantaList = secretSanta(42, jobEventProcesssor(payload));

      assert.equal(null, secretSantaList);
    })
  });

  context('with a payload body for a build.finished event', function() {
    const payload = JSON.parse(fs.readFileSync('tests/build-finished-payload.json'));

    it('returns null', function() {
      const secretSantaList = secretSanta(42, jobEventProcesssor(payload));

      assert.equal(null, secretSantaList);
    })
  });
});
