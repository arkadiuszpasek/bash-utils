alias betest="echo 'Executing: source .env.test.local && npm run test' && source .env.test.local && npm run test"
alias betestdb="echo 'Executing: source .env.test.local && npm run test:db -- --runInBand' && source .env.test.local && npm run test:db -- --runInBand"
alias gen-mig="generate-migration"