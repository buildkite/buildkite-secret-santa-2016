const shuffleSeed = require('shuffle-seed');

const domain = 'buildkite.com';

const people = {
  Tim: `tim@${domain}`,
  Keith: `keith@${domain}`,
  Sam: `sam@${domain}`,
  Jess: `jess@${domain}`,
  Harriet: `harriet@${domain}`,
}

// Takes a seed and list of hints, and returns the secret santa list
//
// Example:
//
//   secretSanta(42, {
//     Jess:    { hint: 'Jess's hint',    address: 'Jess's address' },
//     Tim:     { hint: 'Tim's hint',     address: 'Tim's address' },
//     Keith:   { hint: 'Keith's hint',   address: 'Keith's address' },
//     Sam:     { hint: 'Sam's hint',     address: 'Sam's address' },
//     Harriet: { hint: 'Harriet's hint', address: 'Harriet's address' },
//   })
//
//   returns:
//
//   [
//     { name: 'Jess',    email: '...', received: { name: 'Tim',     hint: 'Tim's hint',     address: 'Tim's address' } },
//     { name: 'Tim',     email: '...', received: { name: 'Keith',   hint: 'Keith's hint',   address: 'Keith's address' } },
//     { name: 'Keith',   email: '...', received: { name: 'Sam',     hint: 'Sam's hint',     address: 'Sam's address' } },
//     { name: 'Sam',     email: '...', received: { name: 'Harriet', hint: 'Harriet's hint', address: 'Harriet's address' } },
//     { name: 'Harriet', email: '...', received: { name: 'Jess',    hint: 'Jess's hint',    address: 'Jess's address' } },
//   ]
exports.calculate = function(seed, answers) {
  if (!answers) return;

  const shuffledNames = shuffleSeed.shuffle(Object.keys(people), seed);

  return shuffledNames.map((name, index) => {
    const receivedName = shuffledNames[index + 1] || shuffledNames[0]
    const answer = answers[receivedName];

    if (!answer) {
      throw new Error(`Missing answer for ${receivedName}`);
    }

    if (!answer.hint) {
      throw new Error(`Missing hint for ${receivedName}`);
    }

    if (!answer.address) {
      throw new Error(`Missing address for ${receivedName}`);
    }

    return {
      name: name,
      email: people[name],
      received: {
        name: receivedName,
        hint: answer.hint,
        address: answer.address
      }
    };
  }, {})
}

exports.message = function(listItem) {
  return `Hi!\n\n` +
    `You received:\n${listItem.received.name}\n\n` +
    `Their xmas pressie hint:\n${listItem.received.hint}\n\n` +
    `Their delivery address:\n${listItem.received.address}\n\n` +
    `Lots of love,\nSanta’s Magical Unicorns`;
}