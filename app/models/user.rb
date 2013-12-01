class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token #create a new remember token before creating a new user in the database
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password, length: { minimum: 6 }
	

  def User.new_remember_token #doenst need an instance method to work so can be called on User
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token) #doenst need an instance method to work so can be called on User
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token) #using self ensures the variable is not just a local variable and can be accessed thruoghout the site
    end


end

