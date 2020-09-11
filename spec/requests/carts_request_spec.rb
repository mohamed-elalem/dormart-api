require 'rails_helper'

def test_update_cart(expected_count:)
  product = FactoryBot.create(:product)
  expect do
    yield(product) if block_given?
    expect(response).to have_http_status :success
    parsed_body = JSON.parse response.body
    expect(parsed_body['data'].length).to eq(customer.cart.cart_products.count)
  end.to change { customer.cart.cart_products.count }.by(expected_count)
end

RSpec.describe "Carts", type: :request do
  context '#index' do
    context 'unauthenticated' do
      it 'does not show cart unless authenticated' do
        get cart_path, headers: Helpers::Constants::HEADERS
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'authenticated' do
      let(:shop) { FactoryBot.create :shop }
      let(:customer) { FactoryBot.create :customer }

      before(:each) do
        customer.cart.cart_products = FactoryBot.create_list(:cart_product, 5, cart: customer.cart)
        customer.save
      end

      it 'renders cart correctly' do
        get cart_path, headers: auth_headers_for(customer)
        expect(response).to have_http_status :success
      end

      it 'clears the cart correctly' do
        expect {
          delete cart_path, headers: auth_headers_for(customer)
        }.to change { customer.cart.cart_products.count }.to 0
      end

      it 'add a product to the cart correctly' do
        test_update_cart(expected_count: 1) do |product|
          patch product_cart_path, headers: auth_headers_for(customer), params: { product_id: product.id, quantity: 1 }
        end
      end

      it 'increment the quantity if the same product is added' do
        expect do
          test_update_cart(expected_count: 1) do |product|
            patch product_cart_path, headers: auth_headers_for(customer), params: { product_id: product.id, quantity: 1 }
            patch product_cart_path, headers: auth_headers_for(customer), params: { product_id: product.id, quantity: 2 }
            expect(customer.cart.cart_products.find_by(product_id: product.id).quantity).to eq 3
          end
        end.to change { customer.cart.cart_products.count }.by 1
      end
    end
  end
end
