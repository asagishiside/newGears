class Gear < ApplicationRecord
  belongs_to :brand
  has_many :posts
  has_one_attached :image

  enum gear_type: { board: 0, binding: 1, boots: 2}
end
