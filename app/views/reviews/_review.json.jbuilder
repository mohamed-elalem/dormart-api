json.(review, :id, :title, :content, :updated_at)
json.customer do
  json.partial! 'users/user', user: review.customer
end