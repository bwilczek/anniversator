require 'features_helper'

RSpec.describe 'List special days' do
  it 'displays each special day on the page' do
    visit '/special_days'

    within '#special_days' do
      expect(page).to have_css('.special_day', count: 2)
    end
  end
end
