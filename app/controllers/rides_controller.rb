class RidesController < ApplicationController

  def take_ride
    attraction = Attraction.find_by(id: params[:attraction][:id])
    ride = Ride.new(user_id: current_user.id, attraction_id: attraction.id)
    ride.save
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

end
