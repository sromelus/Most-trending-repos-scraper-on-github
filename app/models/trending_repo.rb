class Trending_repo < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
