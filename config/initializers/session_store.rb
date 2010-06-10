# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasktracker3_session',
  :secret      => '9f6b3798b6c44cca952de884b07147e217c22dafeba48786617defd060612dd3ffd578c66a9e54ae45e6f8c6ef131b986a083af74cebc30dfc8b9e8c26518784'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
