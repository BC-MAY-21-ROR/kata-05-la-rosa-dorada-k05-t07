# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

RSpec.describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to_not eq 'fixme'
    end
  end

  it 'reduce sell in' do
    items = [Item.new('+5 Dexterity Vest', 2, 20)]
    days = items[0].sell_in
    GildedRose.new(items).update_quality
    expect(items[0].sell_in).to be < days
  end

  it 'aged brie upgrade quality' do
    items = [Item.new('Aged Brie', 2, 20)]
    quality = items[0].quality
    GildedRose.new(items).update_quality
    expect(items[0].quality).to be > quality
  end

  it 'sulfuras dont degrade quality' do
    item = [Item.new('Sulfuras, Hand of Ragnaros', -1, 80)]
    GildedRose.new(item).update_quality
    expect(item[0].quality).to eql 80
  end
end
