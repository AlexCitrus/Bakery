class Product
    attr_reader :name, :code
    attr_accessor :packs
  
    def initialize(params)
      @name = params[:name]
      @code = params[:code]
      @packs = Array.new
    end
  
    def pack_contents
      @packs.map { |pack| pack.quantity.to_i }.reverse
    end
  
    def pack_price(pack_num)
      @packs.find { |pack| pack.quantity.to_i == pack_num }.total_price
    end
  end