require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is vaild with valid attributes' do
    froggy = Animal.create(common_name:'Red-Eyed Tree Frog', scientific_binomial:'Agalychnis callidryas')
    expect(froggy).to be_valid
  end
  it 'is not valid without a name' do
    froggy = Animal.create(scientific_binomial:'Agalychnis callidryas')
    expect(froggy.errors[:common_name]).to_not be_empty #to throw an error
  end
  it 'is not vaild without a scientific_binomial' do
    froggy = Animal.create(common_name: 'Red-Eyed Tree Frog')
    expect(froggy.errors[:scientific_binomial]).to_not be_empty
  end
  it 'common_name and scientific_binomial can not be the same' do
    froggy = Animal.create(common_name: 'Red-Eyed Tree Frog', scientific_binomial: 'Red-Eyed Tree Frog').to_not be_empty
  end
end
 