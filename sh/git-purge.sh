# ~/.git-aliases.sh

# git-purge - Delete local branches matching a pattern
# Usage: git-purge <pattern1> [pattern2] [...]
# Example: git-purge feature/users feature/auth

git-purge() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: git-purge <pattern1> [pattern2] [...]"
    return 1
  fi

  PATTERN=$(printf "%s|" "$@")
  PATTERN=${PATTERN%|}

  echo "Deleting branches matching: $PATTERN"
  git branch | grep -E "$PATTERN" | xargs -r git branch -D
}