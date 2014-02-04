class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /@/, message: "is not a valid address" }
  validates :password, presence: { on: :create }, length: { minimum: 6, message: "must be at least 6 characters" }

  has_secure_password
end
