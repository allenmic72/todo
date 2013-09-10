class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest
  field :remember_token, type: String

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_length_of :password, minimum: 8, maximum: 16
  validates_confirmation_of :password
  #validates :email, presence: true, uniqueness: true,
   #                 format: { with: VALID_EMAIL_REGEX}
  #validates :password, length: { minimum: 8, maximum: 16 },
   #                    confirmation: true


  before_save { self.email = email.downcase }
  before_create :generate_remember_token
  has_secure_password


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def generate_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
