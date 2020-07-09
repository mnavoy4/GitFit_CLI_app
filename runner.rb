require_relative 'config/environment'
require 'pry'
require 'tty-prompt'

app = Cli.new
app.welcome
loop do
  case app.main_menu
  when 'Build new profile'
    app.new_member
  when 'Select your workout'
    app.select_type_of_workout
    app.workout
  when 'See member profile'
    app.see_member_profile
  when 'Edit member profile'
    app.edit_member_profile
  when 'Delete member profile'
    app.delete_member_profile
  when 'Exit GitFit'
    app.end_app
    break
  end
end

# binding.pry
# 0
