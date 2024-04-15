web: bin/rails s -b 0.0.0.0 -p 3000 -P tmp/pids/server.pid
vite: bin/vite dev
job: LAMBY_PROXY_PORT=3001 bin/rails lamby:proxy_server
# job: bin/rails s -b 0.0.0.0 -p 3001 -P tmp/pids/lambdakiq.pid