class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :users_events
  has_many :comments

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
end
