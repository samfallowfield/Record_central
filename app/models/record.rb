class Record < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :record_genres
  has_many :genres, through: :record_genres
  validates :artist, presence: true, length:{minimum: 1, maximum: 35}
  validates :album, presence: true, length:{minimum: 1, maximum: 80}
  validates :variant, presence: true, length:{minimum: 1, maximum: 20}
  validates :description, presence: true, length:{minimum: 5, maximum: 200}
  has_one_attached :image, :dependent => :destroy
  friendly_id  :album, use: :slugged

  def to_param
    slug
  end

end
