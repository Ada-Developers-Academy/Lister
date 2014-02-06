class User < ActiveRecord::Base
  has_many :lists
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\@/, message: "is not a valid address" }
  validates :password, length: {minimum: 6, message: "must be at least 6 characters"}, presence: {on: :create}
  has_secure_password
end
