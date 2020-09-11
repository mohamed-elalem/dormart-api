class CartProduct < ApplicationRecord

  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { minimum: 1 }

  after_initialize :init


  private

  def init
    quantity ||= 0
  end
end
