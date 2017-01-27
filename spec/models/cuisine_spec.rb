require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  it 'should be valid' do
    cuisine = Cuisine.create()
    expect(cuisine).not_to be_valid
    expect(cuisine.errors[:name]).to include("não pode ficar em branco")
  end

end
