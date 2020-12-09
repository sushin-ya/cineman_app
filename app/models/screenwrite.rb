class Screenwrite < ApplicationRecord
  belongs_to :screenwriter
  belongs_to :movie
end
