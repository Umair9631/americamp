class Api::V1::ProfileController < Api::V1::ApiController
  def create
    p_info = PersonalInfo.where(user_id: @user.id).first_or_initialize
    p_info.update_attributes!(personal_info_params)
    
    ## Update Personal Info addresses
    p_info.update_addresses(params[:personal_info][:addresses])

    ## Update Educational Background
    edu_background = EducationalBackground.where(user_id: @user.id).first_or_initialize
    edu_background.update_attributes!(education_params)
    

    
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
      params.fetch(:educational_background, {}).permit(
                    :is_fulltime_student, :university_name,
                    :course_title, :mnth_yr_began_studies, :graduation_mnth_yr,
                    :summer_holiday_from, :summer_holiday_to, :background
                    )
    end
end
