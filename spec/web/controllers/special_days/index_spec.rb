RSpec.describe Web::Controllers::SpecialDays::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { SpecialDayRepository.new }

  before do
    repository.clear
    @day = repository.create(title: 'Last major overhaul', date: DateTime.parse("2012-03-21"))
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all special days' do
    action.call(params)
    expect(action.exposures[:special_days]).to eq([@day])
  end
end
