class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    rejections = []
    rejections << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    rejections << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    return rejections.unshift("Sorry.").join(" ") if !rejections.empty?
    user.update( tickets: user.tickets - attraction.tickets,
                 nausea: user.nausea + attraction.nausea_rating,
                 happiness: user.happiness + attraction.happiness_rating )
    "Thanks for riding the #{attraction.name}!"
  end
end
