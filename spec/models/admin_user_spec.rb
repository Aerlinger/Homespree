# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'spec_helper'

describe AdminUser do

  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }

  # Devise params:
  it { should respond_to :remember_me }
  it { should respond_to :sign_in_count }
  it { should respond_to :remember_me }
  it { should respond_to :reset_password_token }
  it { should respond_to :reset_password_sent_at }
  it { should respond_to :remember_created_at }
  it { should respond_to :current_sign_in_at }
  it { should respond_to :current_sign_in_ip }
  it { should respond_to :last_sign_in_ip }
  it { should respond_to :encrypted_password }


end
