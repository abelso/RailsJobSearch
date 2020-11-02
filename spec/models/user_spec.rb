require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'first name must be present' do
      expect(user).to be_valid
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'last name must be present' do
      expect(user).to be_valid
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'email must be present' do
      expect(user).to be_valid
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'email must be valid' do
      expect(user).to be_valid
      user.email = 'abc'
      expect(user).to_not be_valid
    end
  end
end
