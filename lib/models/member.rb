require 'pry'
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
    puts "Nice to meet you #{name}! Let's start working towards #{goal}!"
    puts "Please note your member ID: #{new_user.id}. You will need it to view your profile later!"
  end

  def self.see_user_profile
    user = self.sign_in
    puts "Name: #{user[:name]}"
    puts "Goal: #{user[:goal]}"
    # workout_array = user.workouts.map do |workout|
    #   workout.body_part
    # end
    # hash = {}
    # workout_array.each do |value|
    #   hash[value] ? hash[value] += 1 : hash[value] = 1
    # end
    puts "Workouts completed: #{self.get_user_workouts user}"
  end

  def self.sign_in
    puts "Please enter your member ID"
    member_id = gets.chomp
    found_user = self.find_by id: member_id
    found_user
  end

  def self.get_user_workouts user
    workout_array = user.workouts.map do |workout|
      workout.body_part
    end
    hash = {}
    workout_array.each do |value|
      hash[value] ? hash[value] += 1 : hash[value] = 1
    end
    hash
  end
end
