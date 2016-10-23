feature 'sign in' do
  before do
    sign_up
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
