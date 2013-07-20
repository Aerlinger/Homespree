module AuthHelper
  def self.http_login
    user = 'admin'
    pw = 'Meetmike'

    env ||= {}
    env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)

    return env
  end

  def self.login(user)
    post "/contractors", email: user.email, title: user.company_title, password: user.email
  end
end

### -----------------------------------------------------------------------------------------------------------------
# Sign Up:
### -----------------------------------------------------------------------------------------------------------------

def guest_homeowner
  # Cache the value:
  Homeowner.find(session[:guest_homeowner_id])
rescue ActiveRecord::RecordNotFound # If session[:guest_homeowner_id] invalid
                                    # Returns nil if not found
  session[:guest_homeowner_id] = nil
end

def current_user
  if session["warden.user.user.key"]
    User.find(session["warden.user.user.key"][0][0])
  elsif session["warden.user.contractor.key"]
    User.find(session["warden.user.contractor.key"][0][0])
  elsif session["warden.user.homeowner.key"]
    User.find(session["warden.user.homeowner.key"][0][0])
  else
    guest_homeowner
  end
end

def user_signed_in?
  current_user.present?
end

# Goes through the steps of signing in a new contractor
def sign_up_contractor
  contractor = FactoryGirl.build :contractor
  visit new_contractor_registration_path

  fill_in "Company title", with: contractor.company_title

  fill_in "Email", with: contractor.email
  fill_in "Password", with: contractor.password

  click_button "Create profile"
  return contractor
end

def sign_up_homeowner
  contractor = FactoryGirl.build :homeowner
  visit new_homeowner_registration_path

  fill_in "Email", with: homeowner.email
  fill_in "Password", with: homeowner.password

  click_button "Create profile"
  return homeowner
end

### -----------------------------------------------------------------------------------------------------------------
# Sign In:
### -----------------------------------------------------------------------------------------------------------------

# Goes through the steps of signing in a new contractor
def user_sign_in(user)
  visit new_user_session_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Sign In"
  return user
end

### -----------------------------------------------------------------------------------------------------------------
# Sign Out:
### -----------------------------------------------------------------------------------------------------------------

def sign_out_contractor
  get "contractors/sessions/destroy"
end

def sign_out
  get "users/sessions/destroy"
end