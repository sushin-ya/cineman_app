class Director < ApplicationRecord
  has_many :directions
  has_many :movies, through: :directions
  validates :name, presence: true, uniqueness: true
end
