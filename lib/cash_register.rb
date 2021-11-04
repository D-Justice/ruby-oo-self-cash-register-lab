require 'pry'
class CashRegister

    attr_accessor :discount, :total, :item_array

    attr_writer :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_array = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do |item|
           self.item_array = item_array << {title => [price, quantity]}
        end
        self.total += price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total = total * (1 - (self.discount * 0.01))
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        self.item_array.collect do |elem|
            elem.keys
        end.flatten
    end
    
    def void_last_transaction
        self.total -= self.item_array[-1].values[0][0] * self.item_array[-1].values[0][1]
    end
end