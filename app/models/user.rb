class User < ActiveRecord::Base
  has_secure_password
  validates_confirmation_of :password
  validates :email, format: { with: /\w+@\w+\.\w+/, message: "is not a valid address"}
  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :email, message: "has already been taken"
  validates_uniqueness_of :username, message: "has already been taken"
  validates_presence_of :password, message: "can't be blank"
  validates_presence_of :password_confirmation, message: "can't be blank"
  validates :password, length: { minimum: 6, message: "must be at least 6 characters"}

  def self.find_or_create(params)
    user = User.find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      user = User.create(params)
    end
  end
end