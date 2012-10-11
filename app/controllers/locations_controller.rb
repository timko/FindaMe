class LocationsController < ApplicationController

#in config/routes.rb. The methods can be found by typing "rake routes"
#within the findMe directory

  def index
    @locations = Location.all
    render 'locations/index'
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  #should set the appropriate instance variables for finding all the users
  #who are currently checked in to a certain location
  #The params{} hash will have:
  #  :id => the id of the location, who's users we want to find
  #Should assign:
  #  @people: should be an array of hashes, with each hash containing the
  #           appropriate attributes of the users, those attributes being:
  #    :name => a string that represents their name
  def find_users
    loc = Location.find(params[:id])
    @location = loc
    @users = loc.users
  end

end
