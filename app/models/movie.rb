class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :directions
  has_many :directors, through: :directions
  has_many :appearances
  has_many :casts, through: :appearances
  
  validates :title, presence: true, uniqueness: true
  validates :production_year, presence: true, length: { is: 4 }

end
