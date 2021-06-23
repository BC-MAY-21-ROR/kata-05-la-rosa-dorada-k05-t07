# frozen_string_literal: true

require_relative '../lib/functions'
require_relative '../lib/item'

RSpec.describe Functions do
  let(:function) { Functions.new }

  it 'degrade quality correctly' do
    item = Item.new(name = '+5 Dexterity Vest', sell_in = -1, quality = 20)
    temporal_quality = item.quality
    function.expired(item)
    expect(item.quality).to be < temporal_quality
  end

  context 'backstage update quality when' do
    item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 30)

    it 'sell in is lower than 11 days' do
      temporal_quality = item.quality
      function.backstage(item)
      expect(item.quality).to be > temporal_quality
    end

    it 'sell in expires become quality equal zero' do
      item.sell_in = -1
      function.expired(item)
      expect(item.quality).to eq 0
    end
  end

  it 'conjured mana cake degrade twice as fast' do
    item = Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)
    temporal_quality = item.quality
    function.degrade(item)
    expect(item.quality).to be(temporal_quality - 2)
  end
end
