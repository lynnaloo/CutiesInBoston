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

  subject { @pet }

  it "#breed_or_animal" do
    @pet.breed_or_animal.must_equal 'breed'
  end

end