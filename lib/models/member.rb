require 'tty-prompt'

class Member < ActiveRecord::Base
  $prompt = TTY::Prompt.new
  has_many :gym_sessions
  has_many :workouts, through: :gym_sessions

  def self.create_new
    puts "What is your name"
    name = gets.chomp
    goal = $prompt.select("What is your goal") do |menu|
      menu.choice 'Losing weight'
      menu.choice 'Gaining strength'
    end
    new_user = Member.create(:name=>name, :goal=>goal)
    new_user
    puts "Nice to meet you #{name}! Let's start working towards #{goal}!"
    puts "Please note your member ID: #{new_user.id}. You will need it to view your profile later!"
  end

  def self.see_user_profile
    puts "Please enter your member ID"
    member_id = gets.chomp
    found_user = self.find_by id: member_id
    puts "Name: #{found_user[:name]}"
    puts "Goal: #{found_user[:goal]}"
  end
end
