require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe "Products", type: :request do
  context '#index' do
    before(:each) do
      @category = FactoryBot.create :category
      @products = FactoryBot.create_list :product, 26, category: @category
    end
  
    it 'can returns products as json' do
      get category_products_path(@category), headers: Helpers::Constants::HEADERS
      expect(response).to have_http_status :success
      parsed_response = JSON.parse(response.body).with_indifferent_access
  
      expect(parsed_response[:data][:products].size).to eq 25
    end
  end

  context '#create' do
    let(:shop) { FactoryBot.create :shop, password: '12345678' }
    let(:category) { FactoryBot.create :category }

    it 'can create a product for a valid shop' do
      expect do
        product_data = {
          name: 'name1',
          description: 'description1',
          price: 1,
          quantity: 1,
          shop_id: shop.id,
          category_id: category.id,
          pictures: 10.times.map { fixture_file_upload(File.join('spec', 'fixtures', 'images', 'test.jpg'), 'image/jpg') }
        }

        post category_products_path(category),
          params: { product: product_data },
          headers: auth_headers_for(shop)
      end.to change { Product.count }.by(1)
        .and change { ActiveStorage::Attachment.where(record_type: 'Product').count }.by(10)
    end
  end

  context '#show' do
    let(:product) { FactoryBot.create :product }

    it 'retrieves a product information' do
      get category_product_url(product.category, product), headers: Helpers::Constants::HEADERS

      expect(response.content_type).to include('json')
      expect(response).to have_http_status :success
      parsed_body = JSON.parse(response.body).with_indifferent_access
      expect(parsed_body[:data]).to have_key(:product)
    end
  end
end
