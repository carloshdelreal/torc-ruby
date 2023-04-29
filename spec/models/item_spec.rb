# frozen_string_literal: true

require './models/item'

RSpec.describe Item do

  describe 'Tax free' do
    it 'Book' do
      item = Item.new('Book', 12.49, 1, false, false)

      expect(item.final_price).to eq(12.49)
    end

    it 'Chocolate' do
      item = Item.new('Chocolate', 0.85, 1, false, false)

      expect(item.final_price).to eq(0.85)
    end

    it 'Headache pills' do
      item = Item.new('Headache pills', 9.75, 1, false, false)

      expect(item.final_price).to eq(9.75)
    end
  end
  
  describe 'Basic Sales Tax' do
    it 'Music CD price' do
      item = Item.new('Music CD', 14.99, 1, true, false)

      expect(item.final_price).to eq(16.49)
    end

    it 'Perfume' do
      item = Item.new('Perfume', 18.99, 1, true, false)

      expect(item.final_price).to eq(20.89)
    end
  end

  describe 'Imported only Tax' do
    it 'Imported Chocolate' do
      item = Item.new('Chocolate', 10.00, 1, false, true)

      expect(item.final_price).to eq(10.50)
    end

    it 'Imported boxes of Chocolate2' do
      item = Item.new('Imported boxes of Chocolate2', 11.25, 3, false, true)

      expect(item.final_price).to eq(35.43) ## 35.55
    end
  end
  
  describe 'Basic Sales Tax + Imported' do
    it 'Imported Perfume' do
      item = Item.new('Imported Perfume', 47.50, 1, true, true)
      
      expect(item.final_price).to eq(54.63) ## 54.65
    end
    
    it 'Imported Perfume2' do
      item = Item.new('Imported Perfume2', 27.99, 1, true, true)
  
      expect(item.final_price).to eq(32.19)
    end
  end
end