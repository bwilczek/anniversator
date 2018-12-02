require 'features_helper'

RSpec.describe 'List special days' do
  let(:repository) { SpecialDayRepository.new }
  before do
    repository.clear

    repository.create(title: 'Last major overhaul', date: DateTime.parse("2012-03-21"))
    repository.create(title: 'Next major overhaul', date: DateTime.parse("2032-03-21"))
  end

  it 'displays each special day on the page' do
    visit '/special_days'

    within '#special_days' do
      expect(page).to have_css('.special_day', count: 2)
    end
  end
end
