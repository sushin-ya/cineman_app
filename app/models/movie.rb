class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  has_many :directions
  has_many :directors, through: :directions
  has_many :appearances
  has_many :casts, through: :appearances
  has_many :screenwrites
  has_many :screenwriters, through: :screenrites
  has_many :genre_classifications
  has_many :genres, through: :genre_classifications

  validates :title, presence: true, uniqueness: true
  validates :production_year, presence: true, length: { is: 4 }
end
