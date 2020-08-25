class ProductPolicy
  attr_accessor :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def show?
    false
  end
end