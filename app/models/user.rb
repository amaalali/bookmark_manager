require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of       :email, as: :email_address

  property :id,              Serial
  property :first_name,      String
  property :last_name,       String
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     # give_token
  #   else
  #     # redirect_to home_url
  #   end
  # end
  # def login(password)
  #   if @user.password == password
  #     true
  #   else
  #     false
  #   end
  # end
end
