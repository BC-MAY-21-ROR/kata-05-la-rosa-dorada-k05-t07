# frozen_string_literal: true

require_relative 'item'
require_relative 'functions'

# Clase GildedRose
class GildedRose
  def initialize(items)
    @items = items
    @general = General.new
  end

  def update_quality
    @items.each do |item|
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        @general.degrade(item)
      elsif item.quality < 50
        # backstage concert and aged brie
        @general.quality_adjust(item, '+')
        @general.backstage(item)
      end
      item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
      # producto vencido
      @general.expired(item)
    end
  end
end
