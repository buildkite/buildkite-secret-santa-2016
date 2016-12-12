// For sample payload see: tests/job-finished-payload.json

const eventName = 'job.finished';
const commandPattern = /magical\-unicorns/;

// Processes a job.finished event and returns a list of secret santa hints.
//
// Returns nil if the event doesn't match.
//
// Example:
//   {
//     Tim:  { hint: "Tim's hint",  address: "Tim's address" },
//     Jess: { hint: "Jess's hint", address: "Jess's address" },
//   }
exports.process = function(payload) {
  if (payload.event != eventName) return;
  if (!payload.job.command.match(commandPattern)) return;

  const names = payload.build.meta_data.names.split("\n");

  return names.reduce((acc, name) => {
    const hint = payload.build.meta_data[`hint-${name}`];
    if (!hint) throw new Error(`No hint found for ${name}`);

    const address = payload.build.meta_data[`address-${name}`];
    if (!address) throw new Error(`No address found for ${name}`);

    acc[name] = { hint: hint, address: address }

    return acc;
  }, {});
}