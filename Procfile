web: bundle exec rails server -p $PORT
worker: rake resque:work QUEUE='*'  
redis: redis-server
resque: env TERM_CHILD=1 bundle exec rake resque:work