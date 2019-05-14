class Api::V1::ApiController < ApplicationController
  before_action :authenticate_via_token

  private
    def authenticate_via_token
      if request.headers[:Authorization].blank?
        return render json: { success: false, msg: 'Authentication token not found.' }, status: 401
      end
      
      @token = request.headers[:Authorization]

      begin
        @user = User.find_by(jwt_token: @token)
        @decoded_token = JWT.decode @token, Settings.hmac_secret, true, { algorithm: 'HS256' }

        if !@user && !@user.try(:id).try(:eql?, @decoded_token.first["data"]["user"]["id"])
          return render json: {success: false, msg: 'Invalid token.'}, status: 401  
        end
                
      rescue JWT::ExpiredSignature
        return render json: {success: false, msg: 'Token has expired.'}, status: 401
      end
    end
end
