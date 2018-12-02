RSpec.describe SpecialDay, type: :entity do
  it 'can be initialized with attributes' do
    day = SpecialDay.new(title: 'Last major overhaul', date: DateTime.parse("2012-03-21"))
    expect(day.title).to eq('Last major overhaul')
  end
end
