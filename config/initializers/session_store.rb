# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fresher_party_session',
  :secret      => '347cc6f3524af0064279778eb6e8daa74161be64076004143e4b0a6aef09b7ccc0ff394535566c00b03af34f5f1c9b2f15794b7b01afdb8eeefb323b1a13b381'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
