module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token #create a new random token
    cookies.permanent[:remember_token] = remember_token #place new unencrypted token in the browser cookies
    user.update_attribute(:remember_token, User.encrypt(remember_token)) #save encrypted token for that user (update_attribute get around the validation when creating a new user in the user model)
    self.current_user = user #set current user equal to given user. Note: self.current_user = ... is automatically converted to current_user=(...)
  end

  def signed_in?
    !current_user.nil?
  end

   #setter method
   def current_user=(user)
    @current_user = user
  end

  #getter method
  def current_user
    remember_token = User.encrypt(cookies[:remember_token]) #set remember_token to encrypted version of the cookie
    @current_user ||= User.find_by(remember_token: remember_token) #calls the find_by method the first time current_user is called (i.e. current_user does not exist), but on subsequent invocations returns @current_user without hitting the database.
  end


  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end

