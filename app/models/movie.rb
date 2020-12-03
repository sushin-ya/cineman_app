class Movie < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, uniqueness: true
  validates :production_year, presence: true, length: { is: 4 }

end
