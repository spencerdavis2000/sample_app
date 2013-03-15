class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password
  before_save { |user| user.email = user.email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VADLID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VADLID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
 
 #about the regular expression
 #Michael Hartl will say foo@f.b.com is valid, but if you go to 
 #Godaddy.com and try to register with a (.) in the middle, it will 
 #not work.  The only valid things are hyphened and all letters and numbers.
 #So, I am surprised that somebody did not pick this up.
 #the (.) is the thing that separates the top level domain from the 
 #mail server for example:  mail.yahoo.com  
 #mail is the server
 #yahoo.com is the top level domain.
 #you cannot send an email to spencerdavis2000@mail.yahoo.com
 #so I believe having multiple dots is incorrect.
 