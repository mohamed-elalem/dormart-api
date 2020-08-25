class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  has_one :rate

  validates_uniqueness_of :product, scope: %i[customer]

end
