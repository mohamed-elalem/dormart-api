require 'rails_helper'

RSpec.describe Product, type: :model do
  context '#rate' do
    let(:product) { FactoryBot.create :product }
    
    before(:each) do
      FactoryBot.create(:rate, value: 1, review: FactoryBot.build(:review, product: product))
      FactoryBot.create(:rate, value: 2, review: FactoryBot.build(:review, product: product))
      FactoryBot.create(:rate, value: 3, review: FactoryBot.build(:review, product: product))
      FactoryBot.create(:rate, value: 4, review: FactoryBot.build(:review, product: product))
      FactoryBot.create(:rate, value: 5, review: FactoryBot.build(:review, product: product))
    end

    it 'computes the rate correctly' do
      expect(product.rate).to eq 3.0
    end
  end
end
