class User < ActiveRecord::Base
  
  validates :username, presence: true, uniqueness: { case_sensitive:     false }, length: { minimum: 2, maximum: 50 }
  
  VALID_EMAIL_REGEX = /@/i
  validates :email, presence: true, uniqueness: { case_sensitive:       false }, format: { with: VALID_EMAIL_REGEX }, length:             {maximum: 100}
  
  
  
end