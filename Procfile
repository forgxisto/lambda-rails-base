web: bin/rails s -b 0.0.0.0 -p 3000
js: npm run build -- --watch
css: npm run build:css -- --watch
job: AWS_EXECUTION_ENV=1 LAMBY_PROXY_PORT=3001 bin/rails lamby:proxy_server
