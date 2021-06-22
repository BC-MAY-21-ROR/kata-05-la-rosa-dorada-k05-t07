# frozen_string_literal: true

# Clase General
class General
  def backstage(item)
    return unless item.name == 'Backstage passes to a TAFKAL80ETC concert'

    quality_adjust(item, '+') if item.sell_in < 11 && (item.quality < 50)
    quality_adjust(item, '+') if item.sell_in < 6 && (item.quality < 50)
  end

  def degrade(item)
    return unless item.quality.positive?

    quality_adjust(item, '-') if (item.name != 'Sulfuras, Hand of Ragnaros') && (item.name != 'Conjured Mana Cake')
    item.quality = item.quality - 2 if item.name == 'Conjured Mana Cake'
    # "Conjured Mana Cake"
  end

  # productos vencidos
  def expired(item)
    return unless item.sell_in.negative? # sell_in < 0

    if item.name != 'Aged Brie'
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        expired_no_legendary(item)
      else
        # backstage concert
        item.quality = 0
      end
    elsif item.quality < 50
      # queso brie
      # item.quality = item.quality + 1
      quality_adjust(item, '+')
    end
  end

  # degradar calidad a objetos no legendarios
  def expired_no_legendary(item)
    return unless item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')

    quality_adjust(item, '-')
  end

  def quality_adjust(item, operator)
    if operator == '-'
      item.quality -= 1
    else
      item.quality += 1
    end
  end
end
