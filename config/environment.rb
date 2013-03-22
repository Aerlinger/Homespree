# Load the rails application
require File.expand_path('../application', __FILE__)

module RegexDefinitions

  def self.email_regex
    /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

    #/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/i
  end

# Only matches User profiles
  def self.facebook_regex
    /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?/i
  end

  def self.zipcode_regex
    /(^\d{5}$)|(^\d{5}-\d{4}$)/
  end

  def self.username
    /^[a-z0-9_-]{3,16}$/
  end

  def self.password
    /^[a-z0-9_-]{6,18}$/
  end
end

# Initialize the rails application
Homespree::Application.initialize!
