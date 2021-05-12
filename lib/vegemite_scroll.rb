class VegemiteScroll
    attr_accessor :quantity, :pack_of_five, :pack_of_three
  
    def initialize(quantity, pack_of_three = 0, pack_of_five = 0)
      @quantity = quantity
      @pack_of_three = pack_of_three
      @pack_of_five = pack_of_five
      puts
      return compute_packages
    end
  
    private
  
    def compute_packages
      order_quantity = @quantity
  
      if (quantity % 5).zero?
        @pack_of_five = @quantity / 5
        @pack_of_three = 0
        puts compute_total_cost
      elsif @quantity == 7 || @quantity == 2 || @quantity == 1 || @quantity.zero?
        puts 'We only sell this product in packs of 3 or 5!'
      else
        until (order_quantity % 5).zero?
          order_quantity -= 3
          @pack_of_three += 1
          @pack_of_five = order_quantity / 5
        end
        puts compute_total_cost
      end
    end
  
    def compute_total_cost
      pack_of_five_total = 8.99
      pack_of_three_total = 6.99
      puts "#{@quantity} VS5 $#{(@pack_of_five * pack_of_five_total + @pack_of_three * pack_of_three_total).round(2)}"
      puts "      #{@pack_of_three} x 3 $6.99" if @pack_of_three.positive?
      puts "      #{@pack_of_five} x 5 $8.99" if @pack_of_five.positive?
    end
  end
