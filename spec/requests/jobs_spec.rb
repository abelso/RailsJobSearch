require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  describe 'GET /jobs' do
    it 'returns all jobs' do
      FactoryBot.create(:job)
      get '/jobs'

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Rails Developer')
    end
  end

  describe 'GET /jobs/:id' do
    job = FactoryBot.create(:job) do |job|
      FactoryBot.create_list(:application, 1, job: job)
    end

    it 'returns job and associated applications' do
      user = FactoryBot.create(:user)
      sign_in user
      get "/jobs/#{job.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Rails Developer')
      expect(response.body).to include('Connery')
      puts response.body
    end

    it 'returns a job' do
      get "/jobs/#{job.id}"

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Rails Developer')
    end
  end

  describe 'GET /jobs/new' do
    it 'generates a new job' do
      get '/jobs/new'

      expect_any_instance_of(Job)
    end
  end

  describe 'POST /jobs' do
    it 'creates a new job' do
      expect {
        post '/jobs', params: { job: { title: 'Rails Developer', description: 'Some description', name: 'Ingemark', email: 'ingemark@asd.asd', category: 'IT', deadline: '2020-11-15' } }
      }.to change { Job.count }.from(Job.count).to(Job.count + 1)
    end

    it 'fails to create a new job with missing parameter (title)' do
      expect {
        post '/jobs', params: { job: { description: 'Some description', name: 'Ingemark', email: 'ingemark@asd.asd', category: 'IT', deadline: '2020-11-15' } }
      }.not_to change { Job.count }
    end
  end

  describe 'PATCH /jobs/:id' do
    let!(:job) { FactoryBot.create(:job) }

    it 'updates a job' do
      patch "/jobs/#{job.id}", params: { job: { title: 'Ruby on Rails Developer' } }

      expect(response).to redirect_to(@job)
      follow_redirect!

      expect(response.body).to include('Ruby on Rails Developer')  
    end

    it 'fails to update a job with empty title parameter' do
      patch "/jobs/#{job.id}", params: { job: { title: nil } }

      expect(response.body).to include('Ažuriranje posla')
    end
  end

  describe 'DELETE /jobs/:id' do
    let!(:job) { FactoryBot.create(:job) }

    it 'deletes a job' do
      expect {
        delete "/jobs/#{job.id}"
      }.to change { Job.count }.from(Job.count).to(Job.count - 1)
    end
  end
end
