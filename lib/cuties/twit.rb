require 'twitter'
require 'logger'
require 'pp'
require 'open-uri'

class Twit
  attr_reader :pet

  def initialize(pet)
    @pet = pet

    @errlog       = Logger.new(STDERR)
    @errlog.level = Logger::WARN #set to Logger:WARN to avoid seing status messages
  end

  def greeting
    Greeting.random
  end

  def message
    "#{greeting} #{pet.message}"
  end


  def client
    Twitter::REST::Client.new do |config|
      begin
        config.consumer_key        = ENV['consumer_key']
        config.consumer_secret     = ENV['consumer_secret']
        config.access_token        = ENV['access_token']
        config.access_token_secret = ENV['access_token_secret']

      rescue KeyError
        @errlog.error "What are your twitter keys? I see none in env. Did you read the README? Specifically,git  #{$!}"
      end

    end
  end


  def tweet
    puts message
    unless pet.pic.nil?
      uri   = URI.parse(pet.pic)
      open(uri) { |f|
        client.update_with_media(message, f)
      }
    else
      client.update(message)
    end
  end

end
