class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :body, presence: true
  
end
