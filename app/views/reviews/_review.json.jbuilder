json.(review, :id, :title, :content, :updated_at)
json.customer do
  json.partial! 'users/user', user: review.customer
end
json.rate do
  json.value review.rate.value
end