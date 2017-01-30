require 'rails_helper'

feature 'User sees other user profile' do
  scenario 'successfully' do
    user_is_loggedin

    user = create(:user, type:'Ordinary')

    visit ordinary_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.email
  end

  scenario 'successfully' do
    #user_is_loggedin

    user = create(:user, type:'Ordinary')

    visit ordinary_path(user)

    expect(page).not_to have_content user.name
    expect(page).not_to have_content user.email
    expect(current_path).to eq login_path
  end
end
