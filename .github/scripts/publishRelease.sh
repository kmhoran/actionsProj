#! /bin/bash
RELEASE='archive/20210224'
echo "PUBLISHING RELEASE"
TODAY=$(date '+%Y%m%d')
if [[ -z $(git ls-remote --heads origin ${RELEASE}) ]]; then
  echo "- No Existing Release Found"
else 
  # release branch exists. let's archive
  BRANCH_COUNT=$(git ls-remote --quiet | grep ${TODAY} | wc -l)
  if [[ ${BRANCH_COUNT} -gt 0 ]]; then
    ARCHIVE_BRANCH="archive/${TODAY}-${BRANCH_COUNT}"
  else
    ARCHIVE_BRANCH="archive/${TODAY}"
  fi
  echo "- Found Existing Release. Creating archive branch: ${ARCHIVE_BRANCH}"
  git fetch origin ${RELEASE} --quiet
  git checkout ${RELEASE}
  git branch -m ${RELEASE} ${ARCHIVE_BRANCH}
  git push origin ${ARCHIVE_BRANCH}

  git push origin --delete ${RELEASE}

fi

#git branch -m release archive/20210218
#git push origin --delete release
#git branch -m sync-20210218 release
#git push origin :sync-20210218 release