class Review < ApplicationRecord
  belongs_to :user
  validates :rating, inclusion:(1..5)
end
