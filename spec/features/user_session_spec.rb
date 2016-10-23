feature 'User Sign-in' do
  before(:each) do
    sign_up
    sign_out
  end

  scenario 'allows a user to sign in' do
    sign_in(email: 'alan@nufc.com', password: '1234', click: true)
    expect(page).to have_content 'WELCOME, Alan'
  end

  scenario 'displays sign-in error for wrong credentials' do
    sign_in(email: 'alan@nufc.com', password: 'sunderland', click: true)
    expect(page).not_to have_content 'WELCOME, Alan'
    expect(page).to have_content 'User email or password is incorrect'
  end
end


feature 'User Sign-out' do

  before(:each) do
    sign_up
    sign_in
  end

  scenario 'while being signed in' do
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Alan')
  end

end
