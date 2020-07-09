require 'pry'
require 'tty-prompt'

class Member < ActiveRecord::Base
  $prompt = TTY::Prompt.new
  has_many :gym_sessions
  has_many :workouts, through: :gym_sessions

  def self.create_new
    name = self.ask_for_name
    goal = self.ask_for_goal
    new_member = Member.create(:name=>name, :goal=>goal)
    puts "Nice to meet you #{name}! GitFit is here to help you #{goal.remove("I want to ")}!"
    puts "Please note your member ID: #{new_member.id}. You will need it to view your profile and log workouts later!"
  end

  def self.ask_for_name
    puts "What is your name?"
    name = gets.chomp
    name
  end

  def self.ask_for_goal
    goal = $prompt.select("What is your goal?") do |menu|
      menu.choice 'I want to lose weight.'
      menu.choice 'I want to gain strength.'
    end
    goal
  end

  def self.see_member_profile
    if member = self.sign_in
      puts "Name: #{member[:name]}"
      puts "Goal: #{member[:goal]}"
      puts "Workouts completed: #{self.get_member_workouts member}"
    else
      puts "This member ID does not exist."
      self.see_member_profile
    end
  end

  def self.sign_in
    puts "Please enter your member ID."
    member_id = gets.chomp
    found_member = self.find_by id: member_id
    found_member
  end

  def self.get_member_workouts member
    hash = {}
    workout_array = member.workouts.map(&:body_part)
    workout_array.each { |value| hash[value] ? hash[value] += 1 : hash[value] = 1 }
    hash
  end
end
