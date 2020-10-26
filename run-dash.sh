#!/usr/bin/env bash

set -e

OBODASH="sh odk.sh obodash"

rm -rf dashboard
#$OBODASH refresh -B
$OBODASH all ROBOT=robot ROBOT_JAR=/tools/robot.jar -B
$OBODASH truncate_reports_for_github REPORT_LENGTH_LIMIT=200 -B