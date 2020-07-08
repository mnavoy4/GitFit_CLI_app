require 'tty-prompt'
class Cli

  $prompt = TTY::Prompt.new

  def welcome
    puts "Welcome to GitFit, your personal workout generator!"
  end

  def new_user
    Member.create_new
  end

  def main_menu
    main_menu = $prompt.select("Main Menu") do |menu|
      menu.choice 'Build new profile'
      menu.choice 'See user profile'
      menu.choice 'Select your workout'
    end
    main_menu
    # welcome if main_menu == 'Build new profile'
  end

  # welcome if main_menu == 'Build new profile'


  def select_type_of_workout
    # prompt = TTY::Prompt.new
    answer = $prompt.select("Choose your workout") do |menu|
      menu.choice 'Full Body'
      menu.choice 'Chest'
      menu.choice 'Back'
      menu.choice 'Legs'
      menu.choice 'Arms'
    end
    puts "You have selected a #{answer} workout."
    # puts "Please select 1 for an upper-body workout or 2 for a lower-body workout."
    # user_input = gets.chomp
  end
end