# bash-utils

## Auto loading

Recommended to load on sh startup, e.g. .zshrc, .e.g.:

```
ALIASES_DIR="$HOME/projects/bash-utils/sh"

if [ -d "$ALIASES_DIR" ]; then
  for file in "$ALIASES_DIR"/*.sh; do
    [ -e "$file" ] && source "$file"
  done
fi
```
