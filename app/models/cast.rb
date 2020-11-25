class Cast < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
