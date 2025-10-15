# generate-migration
# Generates a TypeORM migration locally.
# Usage: generate-migration <migration-name>

generate-migration() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: generate-migration <migration-name>"
    return 1
  fi

  local migrationName="$1"
  echo "Generating migration $migrationName"
  npm run typeorm:migrate:generate:local src/migrations/${migrationName}
}