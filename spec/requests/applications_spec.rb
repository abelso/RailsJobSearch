require 'rails_helper'

RSpec.describe "Applications", type: :request do
  describe 'GET /applications' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:job) { FactoryBot.create(:job) }
    let!(:application) { FactoryBot.create(:application, job: job) }

    it 'returns all applications for a job when logged in' do
      sign_in user
      get "/jobs/#{job.id}/applications"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(application.first_name)
    end

    it 'returns application form' do
      get "/jobs/#{job.id}/applications"

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Prijava za posao')
    end
  end

  describe 'POST /applications' do
    let!(:job) { FactoryBot.create(:job) }    
    
    it 'creates a new application' do
      expect {
        post "/jobs/#{job.id}/applications", params: { application: { first_name: 'Aron', last_name: 'Belso', dob: '1985-08-13', email: 'aron.belso@gmail.com', telephone: '38591123456', address: 'Ilica 1', qualification: 'VSS', job_id: job.id } }
      }.to change { Application.count }.from(Application.count).to(Application.count + 1)
    end

    it 'fails to create a new application with missing parameter (first name)' do
      expect {
        post "/jobs/#{job.id}/applications", params: { application: { last_name: 'Belso', dob: '1985-08-13', email: 'aron.belso@gmail.com', telephone: '38591123456', address: 'Ilica 1', qualification: 'VSS', job_id: job.id } }
      }.not_to change { Application.count }
    end
  end
end
