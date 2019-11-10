set :rails_env, 'development'
set :branch, 'development'
 
server '34.237.242.6',
user: 'deploy',
roles: %w{app db web}