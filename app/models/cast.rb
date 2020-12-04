class Cast < ApplicationRecord
  has_many :appearances
  has_many :movies, through: :appearances
  validates :name, presence: true, uniqueness: true
end
