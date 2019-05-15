class Api::V1::ProfileController < Api::V1::ApiController
  def create
    p_info = PersonalInfo.where(user_id: @user.id).first_or_initialize
    p_info.update_attributes!(personal_info_params)

    render plain: 'Hello'
  end

  private
    def personal_info_params      
      params.fetch(:personal_info, {}).permit(
                    :first_name, :last_name, :middle_name, :nationality, :dob, :gender, :city_of_birth,
                    :country_of_birth, :earliest_date_available, :last_date_available, :driving_license,
                    :skype, :phone_no, :mobile_no
                    )
    end

    def education_params      
      params.fetch(:education, {}).permit(:full_time_student)
    end
end
