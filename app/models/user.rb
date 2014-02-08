class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates_uniqueness_of :username, :email
  validates :email, format: { with: /@/, message: "is not a valid address"}
  validates :password, length: { minimum: 6, message: "must be at least 6 characters" }
  has_many :lists
end