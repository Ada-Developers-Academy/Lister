class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates :password, length: { minimum: 6, message: "must be at least 6 characters" }
  validates :email, format: { with: /@/, message: "is not a valid address" }
  has_many :lists
end
