class Member < ActiveRecord::Base
  has_many :gym_sessions
  has_many :workouts, through: :gym_sessions

  def self.create_new
    puts "You have created your profile"
  end
end