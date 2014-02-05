class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates             :username, :email, uniqueness: true
  validates_format_of   :email, :with => /\w+@\w+\.\w+/i
  validates             :password, length: { minimum: 6, message: 'must be at least 6 characters'}

  has_secure_password



end