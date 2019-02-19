class User < ApplicationRecord
  # using a callback to downcase the email attribute before saving
  # needed for the data base uniqueness of email addresses
  before_save { self.email = email.downcase }


  #validates will ensure that the username is not blank
  validates :name, presence: true, length: { maximum: 50 }

  # \A = match start of a string
  # [\w+\-.]+ = at least one worc character, plus, hypen, or dot
  # @ = literal "at sign"
  # [a-z\d\-] = at least one letter, digit, or hypen
  # [a-z\d\-] = at least one letter, digit, or hyphen
  # \z = match end of string
  # / = end of regex
  # i = case-insensitive
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

has_secure_password
validates :password, presence: true, length: { minimum: 8 }





end
