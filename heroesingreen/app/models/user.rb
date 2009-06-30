class User < ActiveRecord::Base
  validates_presence_of :email, :password
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      password == user.password
      return user
    end
    nil
  end
end
