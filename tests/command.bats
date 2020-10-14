#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "Imports the Hello, world! step" {
  export BUILDKITE_PLUGIN_STEP_IMPORTER_REPOSITORY="https://github.com/marketplacer/step-importer-buildkite-plugin.git"
  export BUILDKITE_PLUGIN_STEP_IMPORTER_REF="main"
  export BUILDKITE_PLUGIN_STEP_IMPORTER_STEPS=".buildkite/shared-steps/hello-world.yml"

  stub buildkite-agent pipeline upload

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Hello, world!"
}
