class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :directions
  has_many :directors, through: :directions
  
  validates :title, presence: true, uniqueness: true
  validates :production_year, presence: true, length: { is: 4 }

end
