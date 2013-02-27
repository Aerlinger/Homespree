# Load the rails application
require File.expand_path('../application', __FILE__)

def email_regex
  /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
end

# Only matches User profiles
def facebook_regex
  /^(https?:\/\/)?((w{3}\.)?)facebook\.com\/(?:[^\s()\\\[\]{};:'",\<>?']){5,}$/i
end

def zipcode_regex
  /(^\d{5}$)|(^\d{5}-\d{4}$)/
end

# Initialize the rails application
Homespree::Application.initialize!
