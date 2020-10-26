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
docker run -e ROBOT_JAVA_ARGS='-Xmx4G' -e JAVA_OPTS='-Xmx4G' \
  -v $PWD/dashboard:/tools/OBO-Dashboard/dashboard \
  -v $PWD/ontologies.txt:/tools/OBO-Dashboard/ontologies.txt \
  -v $PWD/profile.txt:/tools/OBO-Dashboard/profile.txt \
  -v $PWD/sparql:/tools/OBO-Dashboard/sparql \
  -w /work --rm -ti obolibrary/odkfull "$@"