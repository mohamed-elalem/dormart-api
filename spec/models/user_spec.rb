require 'rails_helper'

RSpec.describe User, type: :model do
  context 'password strength' do

    def test_password_strength(password, expected)
      subject.password = password
      subject.password_confirmation = password
      subject.save
      expect(subject.persisted?).to eq(expected)
    end

    context 'Level 1' do
      
      subject { FactoryBot.build :user }
      
      before(:each) do
        expect_any_instance_of(User).to receive(:password_strength).and_return(1)
      end

      it 'does not allows a password with score less than 1' do
        test_password_strength('aaa', false)
      end

      it 'does not allows a password with score less than 1' do
        test_password_strength('AaAaBC', true)
      end
    end

    context 'Level 3' do
      
      subject { FactoryBot.build :user }
      
      before(:each) do
        expect_any_instance_of(User).to receive(:password_strength).and_return(3)
      end

      it 'does not allows a password with score less than 3' do
        test_password_strength('AVSsd', false)
      end

      it 'allows a password with score greater than or euqal to 3' do
        test_password_strength('@fkfkBvk%^%$%%^', true)
      end
    end

  end
end