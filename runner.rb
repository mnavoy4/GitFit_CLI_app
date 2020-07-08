require_relative 'config/environment'
require 'pry'
require 'tty-prompt'


# prompt = TTY::Prompt.new
app = Cli.new
app.welcome
loop do
  case app.main_menu
  when 'Build new profile'
    app.new_user
  when 'Select your workout'
    app.select_type_of_workout
    app.workout
    # bar = TTY::ProgressBar.new("Work out in progress [:bar]", total: 30)
    # 30.times do
    #   sleep(0.1)
    #   bar.advance(1)
    # end
    # app.completed_workout
  when 'See user profile'
    app.see_user_profile
  when 'Exit GitFit'
    app.end_app
    break
  end
end




# binding.pry
# 0
