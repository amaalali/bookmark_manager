feature 'sign in' do
  before do
    sign_up
    click_button 'Sign up'
  end

  scenario 'allows a user to sign in' do
    sign_in
    expect(page).to have content 'WELCOME, Alan'
  end
end
