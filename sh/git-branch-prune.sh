#!/bin/bash

# git-branch-prune.sh
# Deletes local branches not updated in the last N days.
# 
# Usage:
#   git-branch-prune <days> [--dry]
# 
# Example:
#   git-branch-prune 14        # delete branches older than 14 days
#   git-branch-prune 14 --dry  # just show what would be deleted

# Detect the operating system and set the date command accordingly
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  date_command() {
    date -j -v-${1}d +%s
  }
else
  # Linux (GNU date)
  date_command() {
    date -d "$1 days ago" +%s
  }
fi

git-branch-prune() {
  if [ -z "$1" ]; then
    echo "Usage: git-branch-prune <days> [--dry]"
    return 1
  fi

  DAYS=$1
  DRY_RUN=false

  if [ "$2" = "--dry" ]; then
    DRY_RUN=true
  fi

  echo "Scanning for branches not updated in the last $DAYS days..."
  $DRY_RUN && echo "(Dry run: no branches will be deleted)"

  CUTOFF=$(date_command "$DAYS")

  while IFS= read -r line; do
    branch=$(awk '{print $1}' <<< "$line")
    raw_date=$(cut -d' ' -f2- <<< "$line")
    branch_date=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "$raw_date" +%s 2>/dev/null || date -d "$raw_date" +%s 2>/dev/null)

    [ -z "$branch_date" ] && continue

    if [ "$branch_date" -lt "$CUTOFF" ]; then
      if [ "$branch" != "$(git symbolic-ref --short HEAD)" ]; then
        if $DRY_RUN; then
          echo "Would delete $branch (last commit: $raw_date)"
        else
          echo "Deleting $branch (last commit: $raw_date)"
          git branch -D "$branch"
        fi
      else
        echo "Skipping current branch: $branch"
      fi
    fi
  done < <(git for-each-ref --format='%(refname:short) %(committerdate:iso8601)' refs/heads)
}