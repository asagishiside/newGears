class Gear < ApplicationRecord
  belongs_to :brand

  enum gear_type: { board: 0, binding: 1, boots: 2}
end
