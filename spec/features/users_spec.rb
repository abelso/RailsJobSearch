require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature 'registration' do
    scenario 'with successful parameters' do
      visit 'users/sign_up'
      within('form') do
        fill_in('Ime', with: 'Sean')
        fill_in('Prezime', with: 'Connery')
        fill_in('Email', with: 'sean.connery@gmail.com')
        fill_in('Password', with: '123456')
        fill_in('Password confirmation', with: '123456')
        click_on 'Registracija'
      end
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'with no parameters' do
      visit 'users/sign_up'
      within('form') do
        click_on 'Registracija'
      end
      expect(page).to have_content('5 errors prohibited this user from being saved:')
    end
  end

  feature 'login' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'with successful parameters' do
      visit 'users/sign_in'
      within('form') do
        fill_in('user_email', with: user.email)
        fill_in('user_password', with: user.password)
        click_on 'Prijava'
      end
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'with no parameters' do
      visit 'users/sign_in'
      within('form') do
        click_on 'Prijava'
      end
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  feature 'logout' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'succesfully' do
      sign_in user
      visit '/'
      click_on 'Odjava'
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
