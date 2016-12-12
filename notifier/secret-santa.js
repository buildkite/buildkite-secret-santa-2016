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
//   {
//     Jess:    { email: '...', received: { name: 'Tim',     hint: 'Tim's hint',     address: 'Tim's address' } },
//     Tim:     { email: '...', received: { name: 'Keith',   hint: 'Keith's hint',   address: 'Keith's address' } },
//     Keith:   { email: '...', received: { name: 'Sam',     hint: 'Sam's hint',     address: 'Sam's address' } },
//     Sam:     { email: '...', received: { name: 'Harriet', hint: 'Harriet's hint', address: 'Harriet's address' } },
//     Harriet: { email: '...', received: { name: 'Jess',    hint: 'Jess's hint',    address: 'Jess's address' } },
//   }
exports.secretSanta = function(seed, answers) {
  if (!answers) return;

  const shuffledNames = shuffleSeed.shuffle(Object.keys(people), seed);

  return shuffledNames.reduce((acc, name, index, names) => {
    const receivedName = names[index + 1] || names[0]
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

    acc[name] = {
      email: people[name],
      received: {
        name: receivedName,
        email: people[receivedName],
        hint: answer.hint,
        address: answer.address
      }
    }

    return acc;
  }, {})
}