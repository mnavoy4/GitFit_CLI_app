require_relative 'config/environment'
require 'pry'
require 'tty-prompt'

app = Cli.new
app.welcome
loop do
  case app.main_menu
  when 'Build new profile'
    app.new_user
  when 'Select your workout'
    app.select_type_of_workout app.sign_in
    app.workout
  when 'See user profile'
    app.see_user_profile
  when 'Exit GitFit'
    app.end_app
    binding.pry
    break
  end
end

# binding.pry
# 0
