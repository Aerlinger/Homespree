require 'spec_helper'

describe AdminUser do

  it { should respond_to :email }
  it { should respond_to :sign_in_count }

  # Other params:

  # "encrypted_password",
  # "reset_password_token"
  # "reset_password_sent_at"
  # "remember_created_at"
  # "sign_in_count",
  # "current_sign_in_at"
  # "last_sign_in_at"
  # "current_sign_in_ip"
  # "last_sign_in_ip"
  # "created_at",
  # "updated_at",


end
