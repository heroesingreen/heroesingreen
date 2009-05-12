# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_heroesingreen_session',
  :secret      => '5e6db92fe25f37cd0847890ffa79a60673275f59d8c9cbdc0910cdfffd530e7c764cf5de17df03e75fe780a0245da214febdfb8e49ae60d9b72cf1fa98710696'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
