# frozen_string_literal: true

class Item
  attr_accessor :name, :price, :quantity, :basic_tax, :imported

  def initialize(name, price, quantity=1, basic_tax=true, imported=false)
    @name = name
    @price = price
    @quantity = quantity
    @basic_tax = basic_tax
    @imported = imported
  end

  def basic_tax_qty
    return (price*0.10).round(2) if basic_tax

    0
  end

  def imported_tax_qty
    return (price*0.05).round(2) if imported

    0
  end

  def final_price
    final = price
    final += basic_tax_qty
    
    final += imported_tax_qty

    (final*quantity).round(2)
  end
end