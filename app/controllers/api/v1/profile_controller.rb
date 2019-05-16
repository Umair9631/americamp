class Api::V1::ProfileController < Api::V1::ApiController
  def create
    p_info = PersonalInfo.where(user_id: @user.id).first_or_initialize
    p_info.update_attributes!(personal_info_params)
    
    ## Update Personal Info addresses
    p_info.update_addresses(params[:personal_info][:addresses])

    ## Update Educational Background
    edu_background = EducationalBackground.where(user_id: @user.id).first_or_initialize
    edu_background.update_attributes!(education_params)

    ## Update Job Reference
    job_ref = JobReference.where(user_id: @user.id).first_or_initialize
    job_ref.update_attributes!(job_reference_params)
    

    
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

    def job_reference_params
      params.fetch(:job_reference, {}).permit(
        :why_work_at_camp, :positive_impact_at_camp, :why_camp_hire_you, :at_day_camp,
        :at_residential_camp, :with_female_campers, :with_male_campers, :with_family_groups,
        :with_children, :with_no_running_water, :with_no_electricity, :camp_with_platform_tent,
        :campers_with_special_needs, :interested_with_active_faith_based_program,
        :type_of_faith_based_camp, :affiliated_to_ymca_org
      )
    end
end
