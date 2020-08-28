json.name user.name
json.email user.email
json.type user.type.downcase
json.avatar nil
json.avatar(polymorphic_url(user.avatar)) if user.avatar.attached?
json.created_at user.created_at
json.updated_at user.updated_at
