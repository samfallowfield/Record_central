class Genre < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true, length: {minimum: 2, maximum: 15}
  validates_uniqueness_of :name
  has_many :record_genres
  has_many :records, through: :record_genres
  friendly_id :name, use: :slugged

  def to_param
    slug
  end
end