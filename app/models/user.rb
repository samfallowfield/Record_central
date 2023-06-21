class User < ApplicationRecord
  extend FriendlyId
  before_save {self.email = email.downcase}
  has_many :records, dependent: :destroy
  validates :username, presence:true,
            uniqueness: {case_sensitive: false},
            length: {minimum:3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  friendly_id :username, use: :slugged

  def to_param
    slug
  end

end
