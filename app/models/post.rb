class Post < ApplicationRecord
  belongs_to :gear

  validates :review, :score, presence: true
end
