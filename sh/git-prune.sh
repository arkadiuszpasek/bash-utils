# git-prune
# Deletes local Git branches that no longer exist on the remote.
# Usage: git prune [--dry]

DRY_RUN=false

# Parse arguments
for arg in "$@"; do
    case "$arg" in
        --dry)
            DRY_RUN=true
            shift # Remove --dry from arguments
            ;;
        *)
            echo "Usage: git prune [--dry]"
            exit 1
            ;;
    esac
done

# Fetch and prune remote-tracking branches silently
git fetch --prune origin > /dev/null 2>&1

# Get a list of local branches whose remote tracking branch is marked as 'gone'
BRANCHES_TO_DELETE=$(git branch -vv | \
                     grep -E 'origin/[^ ]+: gone]' | \
                     awk '{print $1}')

if [ -z "$BRANCHES_TO_DELETE" ]; then
    echo "No local branches found that are not on the remote"
    exit 0
fi

if $DRY_RUN; then
    echo "The following local branches would be deleted:"
    echo "$BRANCHES_TO_DELETE"
else
    echo "$BRANCHES_TO_DELETE" | xargs -r git branch -D
fi