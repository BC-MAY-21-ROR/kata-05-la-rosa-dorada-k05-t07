# frozen_string_literal: true

require_relative 'item'
require_relative 'functions'

# Clase GildedRose
class GildedRose
  def initialize(items)
    @items = items
    @functions = Functions.new
  end

  def update_quality
    @items.each do |item|
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        @functions.degrade(item)
      elsif item.quality < 50
        # backstage concert and aged brie
        @functions.quality_adjust(item, '+')
        @functions.backstage(item)
      end
      item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
      # producto vencido
      @functions.expired(item)
    end
  end
end
