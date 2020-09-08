class Customer < User
  has_one :cart
  has_one :products, through: :cart

  after_create :create_cart

  private

  def create_cart
    Cart.create!(customer: self)
  end
end