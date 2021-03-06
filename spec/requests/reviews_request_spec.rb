require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  context '#index' do
    let(:product) { FactoryBot.create :product }
    
    before(:each) do
      6.times { FactoryBot.create(:review, product: product, rate: FactoryBot.build(:rate, review: nil)) }
    end

    it 'retrieves first reviews page' do
      get product_reviews_path(product), headers: Helpers::Constants::HEADERS
      expect(response).to have_http_status :success
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']['reviews'].length).to eq(5)
      expect(parsed_body['data']['current_page']).to eq(1)
      expect(parsed_body['data']['total_pages']).to eq(2)
    end

    it 'retrieves second reviews page' do
      get product_reviews_path(product, page: 2), headers: Helpers::Constants::HEADERS
      expect(response).to have_http_status :success
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']['reviews'].length).to eq(1)
      expect(parsed_body['data']['current_page']).to eq(2)
      expect(parsed_body['data']['total_pages']).to eq(2)
    end
  end
end
