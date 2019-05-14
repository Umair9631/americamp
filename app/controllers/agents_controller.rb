class AgentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @agents = User.with_role :agent
  end

  def new
    @agent = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        @user.add_role :agent
        # UserMailer.new_user_account(@user, user_params[:password]).deliver_now
        format.html { redirect_to agents_path, notice: 'Agent has been added successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def user_params
      if params[:user][:password].blank?
        params.fetch(:user, {}).permit(:name, :email)
      else
        params.fetch(:user, {}).permit(:name, :email, :password)
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

end
