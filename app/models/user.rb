# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  provider        :string(255)
#  uid             :string(255)
#

class User < ActiveRecord::Base

  # validates_presence_and_uniqueness_of :email
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :uploaded_works, class_name: 'Artwork', foreign_key: :uploader_id
  has_many :uploaded_artists, through: :uploaded_works, source: :artist
  has_many :stacks
  has_many :stacked_works, through: :stacks, source: :artwork
  has_many :stacked_artists, through: :stacked_works, source: :artist
  has_one :user_profile

  attr_reader :password

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    @user && @user.is_password?(password) ? @user : nil
  end

  def self.find_or_create_by(options)
    user = User.find_by(options)

    unless user
      options[:password] = SecureRandom.urlsafe_base64
      user = User.create(options)
    end

    user
  end

  def self.moniker(user)
    profile = user.user_profile

    if profile && profile.first_name != ""
      return profile.first_name
    elsif profile && profile.username != ""
      return profile.username
    else
      return "Anonymous"
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
