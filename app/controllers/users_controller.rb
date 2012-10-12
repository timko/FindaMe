class UsersController < ApplicationController

  before_filter :create_app_query
  def create_app_query
    @aq = AppQuery.new
  end

  def new
    @user = User.new
  end

  def create
    user_hash = params[:user]
    if user_hash[:password] != user_hash[:password_confirmation]
      flash[:notice]= "Password confirmation and password did not match"
      redirect_to signup_path and return
    end
    @user = User.new(:name => user_hash[:name], :email => user_hash[:email], :password => user_hash[:password])
    @user.save
    if @user.id != nil
      # auto login
      session[:user_id] = @user.id
      redirect_to root_path and return
    else
      render :new
    end
  end

  def check_in
    redirect_guests
    loc_id = params[:location_id]
    already_checked = current_user.checkin

    if already_checked == nil
      Checkin.create(:user_id => current_user.id, :location_id => loc_id)
    else
      already_checked.update_attributes(:location_id => loc_id)
    end

    redirect_to find_nearby_people_path(:id=>loc_id)
  end

  def check_out
    checked = current_user.checkin
    if checked
      Checkin.destroy_all(:id => checked.id)
      flash[:notice] = "You are now in limbo..."
    else
      flash[:notice] = "You\'re already in limbo!"
    end
    redirect_to locations_path
  end

  def locate_self
    self_loc = current_user.location
    if self_loc
      redirect_to find_nearby_people_path(:id => self_loc.id) and return
    else
      flash[:notice] = "You\'re in limbo; checkin somewhere!"
      redirect_to locations_path
    end
  end
    

end
