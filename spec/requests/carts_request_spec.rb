require 'rails_helper'

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
        get cart_url, headers: auth_headers_for(customer)
        expect(response).to have_http_status :success
      end

      it 'updates the cart correctly' do
        product = FactoryBot.create(:product)
        expect do
          put cart_url, headers: auth_headers_for(customer), params: { products: CartProduct.ids.concat([product.id]) }
          expect(response).to have_http_status :success
          parsed_body = JSON.parse response.body
          expect(parsed_body['data'].length).to eq(customer.cart.cart_products.count)
        end.to change { customer.cart.cart_products.count }.by(1)
      end

      it 'clears the cart correctly' do
        expect {
          delete cart_url, headers: auth_headers_for(customer)
        }.to change { customer.cart.cart_products.count }.to 0
      end
    end
  end
end
