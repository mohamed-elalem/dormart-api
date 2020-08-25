class SerializableCategory < JSONAPI::Serializable::Resource
  type :categories

  attributes :name, :description

  link :self do
    @url_helpers.category_path(@object)
  end
end
