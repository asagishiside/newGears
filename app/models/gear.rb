class Gear < ApplicationRecord
  belongs_to :brand
  has_many :posts
  has_many_attached :images

  enum gear_type: { board: 0, binding: 1, boots: 2}
end
