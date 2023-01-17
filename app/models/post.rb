class Post < ApplicationRecord
  belongs_to :gear

  validates :review, :point, presence: true
end
