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

  def self.get_shelter
    shelter = ENV['shelter_id'].split(",")
    shelter.sample
  end

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  SEXES = { m: 'male', f: 'female' }

  private

  def self.get_breeds(pet)
    unless pet.breeds.nil?
      pet.breeds[0]
    end
  end

  def self.get_photo(pet)
    # Assume that if there isn't a 3rd photo, there is a first one
    # There's some more refactoring to be done here.
    unless pet.photos.nil?
      pet.photos[0].medium
    end
  end

  def self.get_sex(pet)
    sex = pet.sex.downcase.to_sym
    SEXES[sex] || 'gender-unspecified' # Fetch a sex, or list as gender-unspecified
  end

  def self.fetch_pet
    petfinder = Petfinder::Client.new

    options = { shelterid: get_shelter }
    pet = petfinder.random_pet(options)

    # Prints the Pet xml in the Terminal
    xml = pet.instance_variable_get(:@xml)
    puts xml

    # Refactor - the petfinder gem doesn't expose pet.contact
    city =  xml.xpath("//pet/contact/city").map(&:text)[0]

    Pet.new({
      breed: get_breeds(pet),
      pic:   get_photo(pet),
      link:  "https://www.petfinder.com/petdetail/" + pet.id,
      name:  pet.name.my_titleize,
      id:    pet.id,
      sex:   get_sex(pet),
      type:  pet.animal,
      city:  city
    })
  end
end
