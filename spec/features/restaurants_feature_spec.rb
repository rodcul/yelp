require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'New Restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC', rating: 5)
    end

    scenario 'display restaurants' do
      visit '/'
      expect(page).to have_content('KFC')
      expect(page).to have_content('5')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end
