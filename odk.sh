#!/bin/sh
# Wrapper script for docker.
#
# This is used primarily for wrapping the GNU Make workflow.
# Instead of typing "make TARGET", type "./run.sh make TARGET".
# This will run the make workflow within a docker container.
#
# The assumption is that you are working in the src/ontology folder;
# we therefore map the whole repo (../..) to a docker volume.
#
# See README-editors.md for more details.
docker run -e ROBOT_JAVA_ARGS='-Xmx58G' -e JAVA_OPTS='-Xmx58G' \
  -v $PWD/dashboard:/tools/dashboard \
  -v $PWD/dashboard-config.yml:/tools/dashboard-config.yml \
  -v $PWD/ontologies:/tools/ontologies \
  -v $PWD/sparql:/tools/sparql \
  -w /work --rm -ti anitacaron/obo-dashboard:v0.1 "$@"
