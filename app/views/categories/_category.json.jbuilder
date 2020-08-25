json.(category, :id, :name, :description)
json.links do
  json.self category_path(category)
end
