# bash-utils


## Auto loading
Recommended to load on sh startup, e.g. .zshrc, .e.g.:

```
GIT_ALIASES_DIR="$HOME/projects/bash-utils/sh"

if [ -d "$GIT_ALIASES_DIR" ]; then
  for file in "$GIT_ALIASES_DIR"/*.sh; do
    [ -e "$file" ] && source "$file"
  done
fi
```