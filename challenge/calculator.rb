
require './models/item'
require './models/list'

class TaxCalculator
  def input1
    items = [
      Item.new('Book', 12.49, 2, false, false),
      Item.new('Music CD', 14.99, 1, true, false),
      Item.new('Chocolate', 0.85, 1, false, false),
    ]

    print_inputs(items)
    print_footer(items)
  end

  def input2
    items = [
      Item.new('Chocolate', 10.00, 1, false, true),
        Item.new('Imported Perfume', 47.50, 1, true, true)
    ]

    print_inputs(items)
    print_footer(items)
  end

  def input3
    items = [
      Item.new('Imported Perfume2', 27.99, 1, true, true),
      Item.new('Perfume', 18.99, 1, true, false),
      Item.new('Headache pills', 9.75, 1, false, false),
      Item.new('Imported boxes of Chocolate2', 11.25, 3, false, true)
    ]

    print_inputs(items)
    print_footer(items)
  end

  def print_inputs(items)
    items.each do |i|
      puts "#{i.quantity} #{i.name} at #{i.price}"
    end
  end

  def print_footer(items)
    list = List.new(items)

    puts "Sales Taxes: #{list.sales_taxes}"
    puts "Total: #{list.total}"
  end
end

calculator = TaxCalculator.new
puts "Input 1"
calculator.input1
puts 
puts "Input 2"
calculator.input2
puts
puts "Input 3"
calculator.input3
