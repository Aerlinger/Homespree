module AuthHelper
  def http_login
    user = 'admin'
    pw = 'Meetmike'

    env = {}
    env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)

    return env
  end
end