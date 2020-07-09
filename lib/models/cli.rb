require 'tty-prompt'
class Cli

  $prompt = TTY::Prompt.new

  def welcome
    puts "Welcome to GitFit, your personal workout generator!"
  end

  def new_member
    Member.create_new
  end

  def see_member_profile
    Member.see_member_profile
  end

  def sign_in
    Member.sign_in
  end

  def end_app
    puts "See you next time!"
  end

  def edit_member_profile
    member = sign_in
    menu = $prompt.select("What would you like to update?") do |menu|
      menu.choice 'Name'
      menu.choice 'Goal'
    end
    case menu
    when 'Name'
      new_name = Member.ask_for_name
      member.update(:name=>new_name)
    when 'Goal'
      new_goal = Member.ask_for_goal
      member.update(:goal=>new_goal)
    end
  end

  def delete_member_profile
    member = sign_in
    member.destroy
  end

  def workout
    bar = TTY::ProgressBar.new("Work out in progress [:bar]", total: 30)
    30.times do
      sleep(0.1)
      bar.advance(1)
    end
    puts "Great job! You finished your workout."
  end

  def main_menu
    main_menu = $prompt.select("Main Menu") do |menu|
      menu.choice 'Build new profile'
      menu.choice 'See member profile'
      menu.choice 'Edit member profile'
      menu.choice 'Select your workout'
      menu.choice 'Delete member profile'
      menu.choice 'Exit GitFit'
    end
    main_menu
  end




  def select_type_of_workout
    member = sign_in
    answer = $prompt.select("Choose your workout") do |menu|
      menu.choice 'Full Body'
      menu.choice 'Chest'
      menu.choice 'Back'
      menu.choice 'Legs'
      menu.choice 'Arms'
    end
    puts "You have selected a #{answer} workout."
    new_session = GymSession.create()
    new_workout = Workout.find_or_create_by(:body_part=>answer)
    new_workout.gym_sessions << new_session
    member.gym_sessions << new_session
  end
end