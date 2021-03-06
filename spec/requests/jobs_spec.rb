require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  describe 'GET /jobs' do
    let!(:job) { FactoryBot.create(:job) }
    
    it 'returns all jobs' do
      get '/jobs'

      expect(response).to have_http_status(:success)
      expect(response.body).to include(job.title)
    end
  end

  describe 'GET /jobs/:id' do
    let!(:job) { FactoryBot.create(:job) }
    let!(:application) { FactoryBot.create(:application, job: job) }
    let!(:user) { FactoryBot.create(:user) }

    it 'returns a job and associated applications' do
      sign_in user
      get "/jobs/#{job.id}/applications"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(job.title)
      expect(response.body).to include(application.first_name)
    end

    it 'returns a job and the application form' do
      sign_out user
      get "/jobs/#{job.id}/applications"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(job.title)
      expect(response.body).to include('Prijava za posao')
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
    let!(:user) { FactoryBot.create(:user) }
    let!(:job) { FactoryBot.create(:job) }

    it 'updates a job' do
      sign_in user
      patch "/jobs/#{job.id}", params: { job: { title: 'Ruby on Rails Developer' } }

      expect(response).to redirect_to(job)
      follow_redirect!
      expect(response).to redirect_to(job_applications_path(job))
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
