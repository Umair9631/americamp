class AgentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index
    @agents = User.with_role(:agent).page(params[:page])
  end

  def new
    @agent = User.new
    @path = "/agents"
  end

  def edit
    @path = "/agents/#{@agent.id}"
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        ## Assign role to agent
        @user.add_role :agent

        ## Send email to agent
        AgentMailer.new_account(@user, user_params[:password]).deliver_now
        format.html { redirect_to agents_path, notice: 'Agent has been added successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @agent.update(user_params)
        format.html { redirect_to agents_path, notice: 'Agent was successfully updated.' }
      else
        format.html { render :edit }
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
      @agent = User.find(params[:id])
    end

end
