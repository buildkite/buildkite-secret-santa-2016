<h1><img alt="Buildkite Secret Santa 2016" src="logo.gif" width="550" height="550"></h1>

[Buildkite](https://buildkite.com/)’s Secret Santa 2016 build pipeline, to find out xmas pressie hints from everyone, and notify each of us with who we’re buying for and what their hint was.

## How does it work?

The build pipeline:

* [pipeline/pipeline.bash](pipeline/pipeline.bash) - generates the Buildkite pipeline that requests Secret Santa hints from everyone.
* [pipeline/readme.bash](pipeline/readme.bash) - the first step in the pipeline that welcomes everyone to this year’s Secret Santa.
* [pipeline/magical-unicorns.bash](pipeline/magical-unicorns.bash) - the last step in the pipeline: a brilliantly red magical unicorn.

The webhook receiver:

* [notifier/index.js](notifier/index.js) - the AWS Lambda function that accepts the `job.finished` webhook from Buildkite, randomly assigns secret santas, and emails everyone with the hint and delivery address.
* [notifier/job-event-processor.js](notifier/index.js) - extracts the information submitted by everyone from the webhook’s build meta-data.
* [notifier/secret-santa.js](notifier/index.js) - randomly assigns each secret santa based on a determistic seed value for safe re-execution. The seed is read from an environment variable so it can be changed at the last minute, to keep the "secret" in "Secret Santa".

## Give it a try

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

## Thanks

Massive props to the brilliant [Carla Hackett](http://carlahackett.com/) for the beaut lettering 👌

## Screenshots

<p align="center"><img alt="Buildkite Secret Santa 2016" src="screenshot.png"></p>

<p align="center"><img alt="Buildkite Secret Santa 2016 Unblock Prompt Animation" src="screenshot-unblock.gif" width="724" height="506"></p>

<p align="center"><img alt="Buildkite Secret Santa 2016 Email" src="screenshot-email.png" width="649" height="1320"></p>

## License

See [Licence.md](Licence.md) (MIT)
