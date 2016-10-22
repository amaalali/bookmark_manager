require 'spec_helper'

describe User do
  let!(:user) { User.create(first_name:            'Alan',
                            last_name:             'Shearer',
                            email:                 'alan@nufc.com',
                            password:              'nufc4eva',
                            password_confirmation: 'nufc4eva'
                            )
              }


  describe '#login' do
    it 'Authenticates a user' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
  end
end
