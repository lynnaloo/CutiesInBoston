require 'dotenv'
Dotenv.load

require_relative '../cuties'

desc "This task is called by the Heroku scheduler add-on"
task :tweet do
  Twit.new(AdoptAPet.random).tweet
end
