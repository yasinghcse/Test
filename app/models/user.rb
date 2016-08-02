class User < ActiveRecord::Base
  has_many :articles
  # create user unique and mandatory
  # create email unique and mandatory
  # validate email using regex

  before_save{ self.email = email.downcase } 

  #uniqueness: true -- this option will not work for case senstive data
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: {minimum:3, maximum: 25}

  #test regular experssion at rebular.com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i          
  validates :email, presence: true,
            uniqueness: { case_sensitive: false},
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX }
end