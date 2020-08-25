require 'rails_helper'

RSpec.describe Rate, type: :model do
  context 'valid data' do
    subject { FactoryBot.create :rate }

    it { is_expected.to be_persisted }
  end

  context 'invalid data' do
    subject { FactoryBot.build :rate }

    it 'is not persisted' do
      subject.value = 5.1
      subject.save

      expect(subject.errors).not_to be_nil
    end
  end
end
