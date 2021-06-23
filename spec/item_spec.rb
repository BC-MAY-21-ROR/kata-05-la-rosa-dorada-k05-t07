require_relative '../lib/item'

RSpec.describe Item do
  let(:item) { Item.new(name="", sell_in=0, quality=0) }
  it 'quality to be less or equal than 50' do
    item.quality = 20
    expect(item.quality).to be <= 50
  end
  
  it 
end