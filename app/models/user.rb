class User < ActiveRecord::Base
  has_many :lists

  SALT = '$2a$10$D1OPM3oiaDlfkW0vU1sfbvlq.'

  before_save { self.email = self.email.downcase }
  before_create :create_remember_token
  before_create :encrypt_password
  after_save    :clear_password

  validates :username, presence: true,
            uniqueness: true

  validates :email,    presence: true,
            uniqueness: true

  validates_format_of :email, :with => /.+\@.+\..+/, message: 'is not a valid address'

  validates :password, presence: true,
            confirmation: true,
            length: { minimum: 6, message: 'must be at least 6 characters' }

# TODO: Add a validation that tells the user that their password sucks.

  validates :password_confirmation,   presence: true
  #validates_length_of :password, :in => 8..20, :on => :create

  # Create a new token for user
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Authenticates password
  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, SALT)
      user
    else
      nil
    end
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
   def encrypt_password
    self.password = BCrypt::Engine.hash_secret(password, SALT)
  end
   def clear_password
    self.password = nil
   end
end
