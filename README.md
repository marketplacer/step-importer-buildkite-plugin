Step Import Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for importing steps from repositories into pipelines.

## Example

This pipeline will use the Step Importer plugin to load the steps defined at [`.buildkite/shared-steps/hello-world.yml`](https://github.com/marketplacer/step-importer-buildkite-plugin/blob/v1.0.0/.buildkite/shared-steps/hello-world.yml) into the running pipeline. In this case, the repo being used happens to be the exact same repo which houses the plugin code itself, but it could be any Git repo, and any ref (so long as the agent has access to it).

```yml
steps:
  - name: 'Say hi!'
    plugins:
      - marketplacer/step-importer#v1.0.0:
          repository: 'git@github.com:marketplacer/step-importer-buildkite-plugin.git'
          ref: 'v1.0.0'
          steps: '.buildkite/shared-steps/hello-world.yml'
```
