<h1><img alt="Buildkite Secret Santa 2016" src="logo.gif" width="550" height="550"></h1>

[Buildkite](https://buildkite.com/)’s Secret Santa 2016 build pipeline, to find out xmas pressie hints from everyone, and notify each of us with who we’re buying for and what their hint was.

## How does it work?

The build pipeline:

* [pipeline/pipeline.bash](pipeline/pipeline.bash) - generates the Buildkite pipeline that requests Secret Santa hints from everyone
* [pipeline/readme.bash](pipeline/readme.bash) - the first step in the pipeline that welcomes everyone to this year’s Secret Santa
* [pipeline/magical-unicorns.bash](pipeline/magical-unicorns.bash) - the last step in the pipeline: a brilliantly red magical unicorn

The webhook receiver:

* TODO

## Screenshot

TODO

## Give it a try

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

## License

See [Licence.md](Licence.md) (MIT)
