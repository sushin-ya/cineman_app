class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :production_year, presence: true, length: { is: 4 }

end
