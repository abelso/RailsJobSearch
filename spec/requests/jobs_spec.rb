require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  describe 'GET /jobs' do
    it 'returns all jobs' do
      FactoryBot.create(:job, title: 'Rails Developer', description: 'Some description', name: 'Ingemark', email: 'ingemark@asd.asd', category: 'IT', deadline: '2020-11-15')
      get '/jobs'

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Rails Developer')
    end
  end

  describe 'POST /jobs' do
    it 'creates a new job' do
      puts Job.count
      expect {
        post '/jobs', params: { job: { title: 'Rails Developer', description: 'Some description', name: 'Ingemark', email: 'ingemark@asd.asd', category: 'IT', deadline: '2020-11-15' } }
      }.to change { Job.count }.from(Job.count).to(Job.count + 1)
    end
  end

  describe 'DELETE /jobs/:id' do
    let!(:job) { FactoryBot.create(:job, title: 'Rails Developer', description: 'Some description', name: 'Ingemark', email: 'ingemark@asd.asd', category: 'IT', deadline: '2020-11-15') }

    it 'deletes a job' do
      expect {
        delete "/jobs/#{job.id}"
      }.to change { Job.count }.from(Job.count).to(Job.count - 1)
      
    end
  end
end
