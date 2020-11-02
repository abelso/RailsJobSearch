require 'rails_helper'

RSpec.feature "Jobs", type: :feature do
  feature 'shows all jobs' do
    let!(:job) { FactoryBot.create(:job) }

    scenario 'on main page' do
      visit '/'
      expect(page).to have_content(job.title)
    end
  end

  feature 'creates a job' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'with valid parameters' do
      sign_in user
      visit '/jobs/new'
      within('form') do
        fill_in('job_title', with: 'Ruby on Rails Developer')
        fill_in('job_description', with: 'Opis posla')
        fill_in('job_name', with: 'Ingemark')
        fill_in('job_email', with: 'posao@ingemark.com')
        fill_in('job_category', with: 'IT')
        fill_in('job_deadline', with: '2020-12-12')
        click_on 'Spremi posao'
      end
      expect(page).to have_content('Posao uspješno kreiran.')
    end

    scenario 'with empty parameters' do
      sign_in user
      visit '/jobs/new'
      within('form') do
        click_on 'Spremi posao'
      end
      expect(page).to have_content('Kreiranje posla ima 7 grešaka')
    end
  end

  feature 'updates a job' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:job) { FactoryBot.create(:job) }

    scenario 'successfully' do
      sign_in user
      visit "/jobs/#{job.id}/edit"
      within('form') do
        fill_in('job_title', with: 'Lorem Ipsum')
        click_on 'Spremi posao'
      end
      expect(page).to have_content('Posao uspješno ažuriran.')
    end
  end

  feature 'deletes a job' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:job) { FactoryBot.create(:job) }

    scenario 'successfully' do
      sign_in user
      visit "/jobs/#{job.id}"
      accept_confirm do
        click_on 'Brisanje'
      end
      expect(page).to have_content('Posao uspješno izbrisan.')
    end
  end
end
