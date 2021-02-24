#! /bin/bash
MAIN_BRANCH='main'
GITS_MAIN_BRANCH=$(git remote show origin | grep "HEAD branch" | cut -d ":" -f 2 | xargs)

# we'll compare our expected main branch with what the current API has on file
if [[ "${MAIN_BRANCH}" != "${GITS_MAIN_BRANCH}" ]]; then
  echo "ERROR: Expected default branch: '${MAIN_BRANCH}' did not match git's default: '${GITS_MAIN_BRANCH}'"
  exit 1
fi

RELEASE='release'
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

git checkout ${MAIN_BRANCH}
git checkout -b ${RELEASE}

git push origin ${RELEASE}


#git branch -m release archive/20210218
#git push origin --delete release
#git branch -m sync-20210218 release
#git push origin :sync-20210218 release