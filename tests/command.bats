#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "Imports the Hello, world! step" {
  export BUILDKITE_PLUGIN_STEP_IMPORTER_REPOSITORY="$PWD"
  export BUILDKITE_PLUGIN_STEP_IMPORTER_REF="test-steps"
  export BUILDKITE_PLUGIN_STEP_IMPORTER_STEPS="buildkite/hello-world.yml"

  stub buildkite-agent pipeline upload

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Hello, world!"
}
