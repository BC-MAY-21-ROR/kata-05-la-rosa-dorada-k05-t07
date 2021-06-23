# frozen_string_literal: true

require_relative '../lib/item'

RSpec.describe Item do
  let(:item) { Item.new(name = 'Aged Brie', sell_in = 2, quality = 0) }
  it 'quality to be less or equal than 50' do
    item.quality = 20
    expect(item.quality).to be <= 50
  end

  it 'item name is not null' do
    expect(item.name).to_not be nil
  end

  it 'legendary item get quality more than 50' do
    legendary_item = Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80)
    expect(legendary_item.quality).to be > 50
  end

  it 'sell in expires' do
    item.sell_in = -1
    expect(item.sell_in).to be.negative?
  end
end
