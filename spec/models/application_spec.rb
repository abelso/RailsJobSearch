require 'rails_helper'

RSpec.describe Application, type: :model do
  let!(:application) { FactoryBot.create(:application) }

  describe 'validations' do
    it 'first name must be present' do
      expect(application).to be_valid
      application.first_name = nil
      expect(application).to_not be_valid
    end

    it 'last name must be present' do
      expect(application).to be_valid
      application.last_name = nil
      expect(application).to_not be_valid
    end

    it 'date of birth must be present' do
      expect(application).to be_valid
      application.dob = nil
      expect(application).to_not be_valid
    end

    it 'email must be present' do
      expect(application).to be_valid
      application.email = nil
      expect(application).to_not be_valid
    end

    it 'email must be valid' do
      expect(application).to be_valid
      application.email = 'abc'
      expect(application).to_not be_valid
    end

    it 'telephone must be present' do
      expect(application).to be_valid
      application.telephone = nil
      expect(application).to_not be_valid
    end

    it 'telephone must be valid' do
      expect(application).to be_valid
      application.telephone = 'abc'
      expect(application).to_not be_valid
    end

    it 'address must be present' do
      expect(application).to be_valid
      application.address = nil
      expect(application).to_not be_valid
    end

    it 'qualification must be present' do
      expect(application).to be_valid
      application.qualification = nil
      expect(application).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to job' do
      t = Application.reflect_on_association(:job)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
