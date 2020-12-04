class Appearance < ApplicationRecord
  belongs_to :cast
  belongs_to :movie
end
