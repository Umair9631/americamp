class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @title = 'Dashboard'
  end
end
