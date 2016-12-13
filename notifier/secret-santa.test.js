const fs = require('fs');
const assert = require('assert');
const secretSanta = require('./secret-santa');
const jobEventProcesssor = require('./job-event-processor').process;

describe('secretSanta.calculate', function() {
  context('with a valid payload body', function() {
    const payload = JSON.parse(fs.readFileSync('test-fixtures/job-finished-payload.json'));

    it('returns the list', function() {
      const secretSantaList = secretSanta.calculate(42, jobEventProcesssor(payload));

      assert.deepEqual([
        {
          "name": "Tim",
          "email": "tim@buildkite.com",
          "received": {
            "address": "Harriet's address",
            "hint": "Harriet's hint",
            "name": "Harriet"
          }
        },
        {
          "name": "Harriet",
          "email": "harriet@buildkite.com",
          "received": {
            "address": "Sam's address",
            "hint": "Sam's hint",
            "name": "Sam"
          }
        },
        {
          "name": "Sam",
          "email": "sam@buildkite.com",
          "received": {
            "address": "Keith's address",
            "hint": "Keith's hint",
            "name": "Keith"
          }
        },
        {
          "name": "Keith",
          "email": "keith@buildkite.com",
          "received": {
            "address": "Jess's address",
            "hint": "Jess's hint",
            "name": "Jess"
          }
        },
        {
          "name": "Jess",
          "email": "jess@buildkite.com",
          "received": {
            "address": "Tim's address",
            "hint": "Tim's hint",
            "name": "Tim"
          }
        }
      ], secretSantaList);

      assert.equal("Hi!\n\nYou received:\nHarriet\n\nTheir xmas pressie hint:\nHarriet's hint\n\nTheir delivery address:\nHarriet's address\n\nLots of love,\nSanta’s Magical Unicorns", secretSanta.message(secretSantaList[0]));
    });
  })

  context('with a payload body for a non-unicorn event', function() {
    const payload = JSON.parse(fs.readFileSync('test-fixtures/job-finished-incorrect-payload.json'));

    it('returns null', function() {
      const secretSantaList = secretSanta.calculate(42, jobEventProcesssor(payload));

      assert.equal(null, secretSantaList);
    })
  });

  context('with a payload body for a build.finished event', function() {
    const payload = JSON.parse(fs.readFileSync('test-fixtures/build-finished-payload.json'));

    it('returns null', function() {
      const secretSantaList = secretSanta.calculate(42, jobEventProcesssor(payload));

      assert.equal(null, secretSantaList);
    })
  });
});
