require('rails_helper')

RSpec.describe('Registrations', type: :request) do
  let(:user_params) do
    user = FactoryBot.build(:user)
    user_params = user.attributes.dup.compact
    %i[email email_confirmation password password_confirmation name].each do |attribute|
      user_params[attribute] = user.send(attribute)
    end

    user_params.to_options
  end

  context('customer') do

    it 'can register new shop' do
      user_params[:avatar] = fixture_file_upload(File.join('spec', 'fixtures', 'images', 'test.jpg'), 'image/jpg')
      expect {
        post customer_registration_path, params: { customer: user_params }
      }.to change { ActiveStorage::Attachment.count }.by(1)
      expect(response.content_type).to include('json')
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data']).not_to be_nil
      expect(parsed_response['data']['email']).to equal(user_params['email'])
    end

  end
end 