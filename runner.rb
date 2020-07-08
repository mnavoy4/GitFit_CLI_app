require_relative 'config/environment'
require 'pry'
require 'tty-prompt'

prompt = TTY::Prompt.new
app = Cli.new
app.welcome
# app.main_menu
if app.main_menu == 'Build new profile'
  app.new_user
end
app.select_type_of_workout



# binding.pry
# 0
