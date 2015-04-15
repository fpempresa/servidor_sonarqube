#!/bin/bash
GIT_URL=$1
GIT_BRANCH=$2
DIR_PROYECTO=sonar_analize_project
DIR_TMP_SONAR=sonar

cd $OPENSHIFT_TMP_DIR
rm -rf $DIR_PROYECTO
rm -rf $DIR_TMP_SONAR
git clone $GIT_URL $DIR_PROYECTO
cd $DIR_PROYECTO
if [ "$GIT_BRANCH" != "" ]; then
  git checkout $GIT_BRANCH
fi

export SONAR_USER_HOME=$OPENSHIFT_TMP_DIR/$DIR_TMP_SONAR
export SONAR_RUNNER_HOME=$OPENSHIFT_HOMEDIR/diy/sonar-runner
$OPENSHIFT_HOMEDIR/diy/sonar-runner/bin/sonar-runner