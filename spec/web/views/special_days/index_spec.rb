RSpec.describe Web::Views::SpecialDays::Index, type: :view do
  let(:exposures) { Hash[special_days: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/special_days/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #special_days' do
    expect(view.special_days).to eq exposures.fetch(:special_days)
  end

  context 'when there are no special days' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no special days yet.</p>')
    end
  end

  context 'when there are special days' do
    let(:day1)      { SpecialDay.new(title: 'Last major overhaul', date: DateTime.parse("2012-03-21")) }
    let(:day2)      { SpecialDay.new(title: 'Next major overhaul', date: DateTime.parse("2032-03-21")) }
    let(:exposures) { Hash[special_days: [day1, day2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="special_day"/).length).to eq(2)
      expect(rendered).to include('Last major')
      expect(rendered).to include('Next major')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no special days yet.</p>')
    end
  end
end
