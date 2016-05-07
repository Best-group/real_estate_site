HashIds.config do |config|
  config.salt = 'I love Snoopy'
  config.min_hash_length = 12 # id length
  config.alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' # random char pool require at least 16 unique characters
end