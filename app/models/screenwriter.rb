class Screenwriter < ApplicationRecord
  has_many :screenwrites
  has_many :movies, through: :screenwrites

  validates :name, presence: true, uniqueness: true
end
