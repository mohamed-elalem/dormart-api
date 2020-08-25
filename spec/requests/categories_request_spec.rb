require('rails_helper')

RSpec.describe('Categories', type: :request) do
  # context '#create' do
    
  #   it 'posts data and returns created category' do
  #     post categories_path, params: { category: { name: 'testn', description: 'testd' } }
  #     expect(response.content_type).to(include('json'))
  #     expect(response).to(have_http_status(:created))
  #     category = assigns(:category)
  #     expect(category.name).to(eq('testn'))
  #     expect(category.description).to(eq('testd'))
  #   end

  #   it 'receives error for invalid category' do
  #     post categories_path, params: { category: { name: '', description: '' } }
  #     expect(response.content_type).to(include('json'))
  #     expect(response).to(have_http_status(:bad_request))
  #     parsed_body = JSON.parse(response.body).with_indifferent_access
  #     expect(parsed_body).to have_key(:name)
  #   end
  # end

  context '#index' do
    before(:all) do
      FactoryBot.create_list(:category, 5)
    end

    it 'retrieves all categories' do
      get categories_path, headers: Helpers::Constants::HEADERS
      expect(response.content_type).to include('json')
      expect(response).to have_http_status :success
      parsed_json = JSON.parse(response.body).with_indifferent_access
      expect(parsed_json[:data].length).to be(Category.count)
    end
  end

  context '#show' do
    let(:category) { FactoryBot.create :category }

    it 'retrieve a single category' do
      get category_path(category.id), headers: Helpers::Constants::HEADERS

      expect(response.content_type).to include('json')
      expect(response).to have_http_status :success
      parsed_json = JSON.parse(response.body).with_indifferent_access
      expect(parsed_json[:data]).to have_key :category
    end
  end
end
