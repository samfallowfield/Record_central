class Record < ApplicationRecord
  belongs_to :user
  validates :artist, presence: true, length:{minimum: 1, maximum: 35}
  validates :album, presence: true, length:{minimum: 1, maximum: 80}
  validates :genre, presence: true, length:{minimum: 2, maximum: 15}
  validates :variant, presence: true, length:{minimum: 1, maximum: 15}
  validates :description, presence: true, length:{minimum: 5, maximum: 200}
  has_one_attached :image, :dependent => :destroy

end
