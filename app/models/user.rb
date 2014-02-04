class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates             :username, :email, uniqueness: true
  validates_format_of   :email, :with => /\w+@\w+\.\w+/i
  validates             :email, length: { minimum: 6}

  has_secure_password



end