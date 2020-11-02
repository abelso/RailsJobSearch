require 'rails_helper'

RSpec.feature "Applications", type: :feature do
  feature 'creates a new application' do
    let!(:job) { FactoryBot.create(:job) }

    scenario 'with successful parameters' do
      visit "/jobs/#{job.id}"
      expect(page).to have_content(job.title)
      within('form') do
        fill_in('Ime', with: 'Sean')
        fill_in('Prezime', with: 'Connery')
        fill_in('Datum rođenja', with: '1930-01-01')
        fill_in('Email', with: 'sean.connery@gmail.com')
        fill_in('Broj telefona', with: '385911234567')
        fill_in('Adresa', with: 'Ilica 1')
        select('VSS', from: 'Stručna sprema')
        click_on 'Prijava'
      end
      expect(page).to have_content('Prijava uspješno kreirana.')
    end

    scenario 'with no parameters' do
      visit "/jobs/#{job.id}"
      expect(page).to have_content(job.title)
      within('form') do
        click_on 'Prijava'
      end
      expect(page).to have_content('Vaša prijava ima 7 grešaka')
    end
  end
end
