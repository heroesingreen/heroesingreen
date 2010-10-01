class SignupEmail < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def validate
    unless email.blank?
      unless email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/
          errors.add(:email, "not valid")
      end
    end
  end

end
