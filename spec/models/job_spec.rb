require 'rails_helper'

RSpec.describe Job, type: :model do
  let!(:job) { FactoryBot.create(:job) }

  describe 'validations' do
    it 'title must be present' do
      expect(job).to be_valid
      job.title = nil
      expect(job).to_not be_valid
    end

    it 'description must be present' do
      expect(job).to be_valid
      job.description = nil
      expect(job).to_not be_valid
    end

    it 'name must be present' do
      expect(job).to be_valid
      job.name = nil
      expect(job).to_not be_valid
    end

    it 'email must be present' do
      expect(job).to be_valid
      job.email = nil
      expect(job).to_not be_valid
    end

    it 'email must be valid' do
      expect(job).to be_valid
      job.email = 'abc'
      expect(job).to_not be_valid
    end

    it 'category must be present' do
      expect(job).to be_valid
      job.category = nil
      expect(job).to_not be_valid
    end

    it 'deadline must be present' do
      expect(job).to be_valid
      job.deadline = nil
      expect(job).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many applications' do
      should respond_to(:applications)
    end
  end
end
