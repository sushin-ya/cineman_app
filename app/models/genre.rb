class Genre < ApplicationRecord
  has_many :genre_classifications
  has_many :movies, through: :genre_classifications
  validates :name, presence: true, uniqueness: true
end
