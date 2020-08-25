class SerializableProduct < JSONAPI::Serializable::Resource
  type :products

  attributes :name, :description, :price, :quantity, :created_at, :updated_at

  belongs_to :category
  belongs_to :shop
  
  link :self do
    @url_helpers.category_product_path(@object.category, @object)
  end

  link :related do
    @url_helpers.category_path(@object.category)
  end
end