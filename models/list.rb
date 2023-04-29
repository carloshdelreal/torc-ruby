# frozen_string_literal: true

class List
  attr_accessor :items
  def initialize(items)
    @items = items
  end

  def sales_taxes
    taxes = 0
    items.each do |i|
      taxes += i.basic_tax_qty
      taxes += i.imported_tax_qty
    end
    taxes
  end

  def total
    qty = 0
    items.each do |i|
      qty += i.final_price
    end
    qty.round(2)
  end
end