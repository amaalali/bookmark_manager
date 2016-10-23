feature 'sign in' do
  before do
    sign_up
    click_button 'Sign up'
  end

  scenario 'allows a user to sign in' do
    sign_in
    click_button 'Sign in'
    expect(page).to have_content 'WELCOME, Alan'
  end

  scenario 'displays sign-in error for wrong credentials' do
    sign_in
    fill_in 'password', with: 'sunderland'
    click_button 'Sign in'
    expect(page).not_to have_content 'WELCOME, Alan'
    expect(page).to have_content 'User email or password is incorrect'
  end
end
