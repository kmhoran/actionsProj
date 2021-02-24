#! /bin/bash

echo "PUBLISHING RELEASE"

git branch

if [[ -z $(git ls-remote --heads origin release) ]]; then
  # release branch exists. let's archive

  else echo "No Existing Release Found"
fi

#git branch -m release archive/20210218
#git push origin --delete release
#git branch -m sync-20210218 release
#git push origin :sync-20210218 release