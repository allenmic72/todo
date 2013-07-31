class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest
  field :remember_token, type: String

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX}
  validates :password_digest, presence: true
  validates :password, length: { minimum: 8, maximum: 16 },
                       confirmation: true


  before_save { self.email = email.downcase }
  before_create :generate_remember_token
  has_secure_password

  private

  def generate_remember_token

  end
end
