require 'net/http'
require 'json'
require 'open-uri'
require 'pp'
require 'petfinder'
require 'dotenv'

Dotenv.load

Petfinder.configure do |config|
  config.api_key    = ENV['petfinder_key']
  config.api_secret = ENV['petfinder_secret']
end

module AdoptAPet

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  private

  def self.get_breeds(pet)
    unless pet.breeds.nil?
      pet.breeds[0]
    end
  end

  def self.get_photo(pet)
    unless pet.photos.nil?
      pet.photos[0].medium
    end
  end

  def self.get_sex(pet)
    sexes = { m: 'male', f: 'female' }
    sex = pet.sex.downcase.to_sym
    # Fetch a sex, or list as gender-unspecified
    sexes[sex] || 'gender-unspecified'
  end

  def self.get_shelter
    shelter = ENV['shelter_id'].split(",")
    shelter.sample
  end

  def self.fetch_pet
    petfinder = Petfinder::Client.new

    options = { shelterid: get_shelter }
    pet = petfinder.random_pet(options)

    # Prints the Pet xml in the Terminal
    xml = pet.instance_variable_get(:@xml)
    puts xml

    Pet.new({
      breed: get_breeds(pet),
      pic:   get_photo(pet),
      link:  "https://www.petfinder.com/petdetail/" + pet.id,
      name:  pet.name.my_titleize,
      id:    pet.id,
      sex:   get_sex(pet),
      type:  pet.animal,
      city:  pet.city[0]
    })
  end
end
