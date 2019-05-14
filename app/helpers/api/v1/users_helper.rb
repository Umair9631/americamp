module Api::V1::UsersHelper
  def get_token user
    payload = { data: {user: {id: user.id, email: user.email, name: user.name}} }
    payload[:exp] = (Time.now + 10.days).to_i
    JWT.encode payload, Settings.hmac_secret, 'HS256'
  end
end
