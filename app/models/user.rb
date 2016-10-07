class User < ActiveRecord::Base

  attr_reader :password

  validates :name, :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  before_validation :ensure_session_token_uniqueness

  has_many :stories,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "Story"

  has_attached_file :image, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.password?(password) ? user : nil
  end

  def password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    ensure_session_token_uniqueness
    self.save
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom.base64
  end

  def ensure_session_token_uniqueness
    while User.find_by(session_token: self.session_token)
      self.session_token = generate_session_token
    end
  end

end
