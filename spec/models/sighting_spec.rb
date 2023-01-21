require 'rails_helper'

RSpec.describe Sighting, type: :model do
  # it 'is vaild with valid attributes' do
  #   tester = Sighting.create(latitude: '54.5260° N', longitude: '105.2551° W', date: '2022-12-27')
  #   expect(tester).to be_valid
  # end
  it 'is not valid without a latitude' do
    tester = Sighting.create(longitude:'105.2551° W', date:'2022-12-27')
    expect(tester.errors[:latitude]).to_not be_empty #to throw an error
  end
  it 'is not valid without a longitude' do
    tester = Sighting.create(latitude:'54.5260° N', date:'2022-12-27')
    expect(tester.errors[:longitude]).to_not be_empty #to throw an error
  end
  it 'is not valid without a date' do
    tester = Sighting.create(latitude:'54.5260° N', longitude:'105.2551° W')
    expect(tester.errors[:date]).to_not be_empty #to throw an error
  end
  
end
