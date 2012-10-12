class HomeController < ApplicationController
  
  def index
    redirect_to locations_path if current_user
  end
  
end
