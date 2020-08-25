require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  context '#index' do
    let(:product) { FactoryBot.create :product }
    
    before(:each) do
      FactoryBot.create_list(:review, 6, product: product, rate: FactoryBot.build(:rate, review: nil))  
    end

    it 'retrieves first reviews page' do
      get product_reviews_path(product), headers: Helpers::Constants::HEADERS
      expect(response).to have_http_status :success
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data'].length).to eq(5)  
    end

    it 'retrieves second reviews page' do
      get product_reviews_path(product, page: 2), headers: Helpers::Constants::HEADERS
      expect(response).to have_http_status :success
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data'].length).to eq(1)
    end
  end
end
