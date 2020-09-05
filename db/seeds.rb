# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

def attach_image_for(resource, key, url)
  image = URI.open(url)
  resource.send(key.to_sym).attach(io: image, filename: "#{SecureRandom.hex}.jpg")
end



unless Category.any?

  100.times do
    FactoryBot.create :shop
    FactoryBot.create :customer
    attach_image_for(Shop.last, :avatar, 'https://i.pravatar.cc/600')
    attach_image_for(Customer.last, :avatar, 'https://i.pravatar.cc/600')
  end

  puts "Created users..."

  10.times do
    FactoryBot.create(:category)
  end

  puts "Created categories..."

  100.times do
    FactoryBot.create(:product, category: Category.find(Category.ids.sample), shop: Shop.find(Shop.ids.sample))
    attach_image_for(Product.last, :pictures, 'https://picsum.photos/600')
  end

  puts "Created products..."

  1000.times do
    begin
      FactoryBot.create(:review, product: Product.find(Product.ids.sample), customer: Customer.find(Customer.ids.sample))
    rescue Exception => ex
      puts ex.message
    end
  end

  puts "Created rates & reviews..."

end