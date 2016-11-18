class User < ActiveRecord::Base

  has_many :articles
  has_secure_password
  
        
  before_save { self.email = email.downcase }
  
  validates :username, 
    presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 3, maximum: 105}
        
  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEXP}
        

end
