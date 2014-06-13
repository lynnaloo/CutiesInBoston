require 'minitest/autorun'
require_relative '../lib/cuties/pet'

describe Pet, 'Pet' do
  
  before do
    @pet = Pet.new({
      id:    'id',
      breed: 'breed',
      desc:  'desc',
      link:  'link',
      name:  'name',
      pic:   'pic',
      sex:   'sex',
      type:  'type'
    })
  end

  describe "#breed_or_animal" do

    describe "when type is a Small & Furry" do
      let(:pet) { Pet.new(type: 'Small & Furry', breed: 'breed') }
      
      it "returns the breed" do
        pet.breed_or_animal.must_equal 'breed'
      end
    end

    describe "when type is a Pig" do
      let(:pet) { Pet.new(type: 'Pig', breed: 'breed') }
      
      it "returns the breed + 'pig'" do
        pet.breed_or_animal.must_equal 'breed pig'
      end
    end

    describe "when type is a Rabbit" do
      let(:pet) { Pet.new(type: 'Rabbit', breed: 'breed') }
      
      it "returns the breed + 'rabbit'" do
        pet.breed_or_animal.must_equal 'breed rabbit'
      end
    end
  end

end