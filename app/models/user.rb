class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save {self.email = email.downcase}
    has_many :articles
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {min: 3, maximum: 25}
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
    has_secure_password     
end