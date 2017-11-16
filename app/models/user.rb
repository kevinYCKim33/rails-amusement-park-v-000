class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    happiness.to_i >= nausea.to_i ? "happy" : "sad"
  end
end
