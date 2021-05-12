class Pack
    attr_reader :quantity, :total_price
  
    def initialize(params)
      @quantity = params[:quantity]
      @total_price = params[:total_price]
    end
  end