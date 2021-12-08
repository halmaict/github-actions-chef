#!/usr/bin/env bash

mkdir ._actionshub_problem-matchers
cp /cookstyle.json ._actionshub_problem-matchers/cookstyle.json
cp /rspec.json ._actionshub_problem-matchers/rspec.json
echo "##[add-matcher]._actionshub_problem-matchers/cookstyle.json"
echo "##[add-matcher]._actionshub_problem-matchers/rspec.json"
if [ -n "${INPUT_GEMS}" ] ; then
  echo "Installing gem(s): ${INPUT_GEMS}"
  chef gem install -N "${INPUT_GEMS}"
fi

EXITVALUE=0
echo "Checking if any work needs to be done..."
while read cookbook; do
  echo "::group::${cookbook}"
  chef exec cookstyle --display-cop-names --extra-details ${cookbook}
  [ $? -eq 1 ] && EXITVALUE=1
  echo "::endgroup::"
done < <(git diff --name-only ${GITHUB_EVENT_BEFORE} ${GITHUB_SHA} cookbooks/| cut -d"/" -f1,2 | sort -u)

exit $EXITVALUE
