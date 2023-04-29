# frozen_string_literal: true

require './models/list'
require './models/item'

RSpec.describe List do

  describe 'Inputs' do
    it 'Input 1' do
      list = List.new([
        Item.new('Book', 12.49, 2, false, false),
        Item.new('Music CD', 14.99, 1, true, false),
        Item.new('Chocolate', 0.85, 1, false, false),
      ])

      expect(list.sales_taxes).to eq(1.50)
      expect(list.total).to eq(42.32)
    end

    it 'Input 2' do
      list = List.new([
        Item.new('Chocolate', 10.00, 1, false, true),
        Item.new('Imported Perfume', 47.50, 1, true, true)
      ])

      expect(list.sales_taxes).to eq(7.63) ## 7.65
      expect(list.total).to eq(65.13) ## 65.15
    end

    it 'Input 3' do
      list = List.new([
        Item.new('Imported Perfume2', 27.99, 1, true, true),
        Item.new('Perfume', 18.99, 1, true, false),
        Item.new('Headache pills', 9.75, 1, false, false),
        Item.new('Imported boxes of Chocolate2', 11.25, 3, false, true)
      ])

      expect(list.sales_taxes).to eq(6.66) ## 7.90
      expect(list.total).to eq(98.26) ## 98.38
    end
  end
end