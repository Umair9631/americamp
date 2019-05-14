class Api::V1::UsersController < Api::V1::ApiController
  include Api::V1::UsersHelper
  skip_before_action :authenticate_via_token, only: [:signin]
  
  #####################################################################
  ## Function:    signin
  ## Endpoint:    [POST]/users/signin
  ## Params:      @email
  ##              @password  
  #####################################################################
  def signin
    email     = params[:email]
    password  = params[:password]

    #  Check required params
    ## Email & password is required
    if email.blank? || password.blank?
      return render json: { success: false, msg: 'Email and Password is required.' }, status: 400
    end

    # Fetch user by email
    @user = User.find_by(email: email)    
    return render json: { success: false, msg: 'Email not found.' }, status: 401 unless @user

    ## User found, check password and proceed
    if @user.valid_password?(password)
      token = get_token(@user)

      ## Update user with token
      @user.update_attribute(:jwt_token, token)

      return render json: {success: true, msg: 'User assigned authentication token.', data: { token: token, id: @user.id}}, status: 200
    else
      return render json: { success: false, msg: 'Invalid email / password.' }, status: 401
    end
  end

  def signout
    @user.update_logout_details()

    return render json: { success: true, msg: 'You have been logged out successfully.' }, status: 200
  end
end
