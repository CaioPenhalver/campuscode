require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    user = User.create()
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("não pode ficar em branco")
    expect(user.errors[:email]).to include("não pode ficar em branco")
  end
end
