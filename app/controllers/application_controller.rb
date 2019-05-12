class ApplicationController < ActionController::Base
  # Default layout
  layout 'main/layout-2'

  private
    def authorize_admin
      if user_signed_in? && !current_user.has_role?(:admin)
        redirect_to root_path, notice: 'You are not authorized to access this page.'
      end
    end
    
end
