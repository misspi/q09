# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_q09_session',
  :secret      => '9c7fb1e7958cd5d7e1978f86d5a74fd4849ca7808cf4b73b49da1117ab6b2ce2197f62e1bbe4ce14d214c61bd2237e7ae640b53b34c98fabc64eb0f98d52ee8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
