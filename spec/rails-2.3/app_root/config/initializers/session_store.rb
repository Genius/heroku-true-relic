# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_app_root_session',
  :secret      => '3db975eda7aba291ccd74c21dc99d30cb0792b29466f36140cb684581099e007fa17beb1ffa62eda31c8b6d7e142139e1b963056f2ccc67bc3528722a84cc8f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
