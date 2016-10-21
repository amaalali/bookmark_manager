
feature 'sign up' do

  it 'allows a new user to sign up' do
    sign_up
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(1)
    expect(page).to have_content 'WELCOME, Alan'
    expect(User.first.email).to eq('alan@nufc.com')
  end

  it 'informs the user if they have not enetered two identical passwords' do
    sign_up_non_matching_passwords
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
    expect(current_path).to eq '/register'
    expect(page).to have_content('Password does not match the confirmation')
  end
end

feature 'incorrect sign up' do

  before do
    sign_up
  end

  it 'user cannot sign up if they have not entered an email' do
    fill_in 'email', with: ''
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
  end

  it 'user cannot sign up with an invalid email' do
    fill_in 'email', with: '1234@email'
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
  end
end

feature 'Email address already exists' do
  it 'user can not sign up with an already registered email address' do
    sign_up
    click_button 'Sign up'
    sign_up
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
    expect(page).to have_content('Email is already taken')
  end
end
