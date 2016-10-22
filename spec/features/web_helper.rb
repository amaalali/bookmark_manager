def sign_up
  visit '/'
  click_button 'Register'
  fill_in 'first_name', with: 'Alan'
  fill_in 'last_name', with: 'Shearer'
  fill_in 'email', with: 'alan@nufc.com'
  fill_in 'password', with: '1234'
  fill_in 'password_confirmation', with: '1234'
end

def sign_up_non_matching_passwords
  sign_up
  fill_in 'password_confirmation', with: 'abcd'
end

def sign_in
  visit '/sign-in'
  fill_in 'email', with: 'alan@nufc.com'
  fill_in 'password', with: '1234'
  click_button 'Sign in'
end
