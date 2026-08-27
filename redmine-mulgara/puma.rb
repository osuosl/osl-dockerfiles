# Pool size in database.yml matches RAILS_MAX_THREADS so workers can never starve for DB connections
workers ENV.fetch('WEB_CONCURRENCY', 2).to_i
max_threads = ENV.fetch('RAILS_MAX_THREADS', 5).to_i
threads max_threads, max_threads
