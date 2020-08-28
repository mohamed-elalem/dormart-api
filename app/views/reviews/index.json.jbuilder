json.reviews do
  json.array! @reviews, partial: 'review', as: :review
end
json.(@reviews, :current_page, :total_pages)
