# git-prod
# Shows merge commits between origin/env/production and origin/main
# Usage: git-prod

git-prod() {
  git fetch 
  git log origin/env/production..origin/main --oneline | grep Merge
}

# git-prod-current
# Shows merge commits between origin/env/production and the current branch
# Usage: git-prod-current

git-prod-current() {
  git fetch
  local CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git log origin/env/production.."$CURRENT_BRANCH" --oneline
}