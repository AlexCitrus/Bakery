require "json"
require_relative "./product"
require_relative "./pack"

class Bakery
  attr_accessor :products

  def initialize
    @@products = Array.new

    raw_product_strings = File.read(File.expand_path("lib/products.json"))
    parsed_products = ::JSON.parse(raw_product_strings)["products"]

    parsed_products.each do |product|
      created_product = Product.new(name: product["name"], code: product["code"])

      product["packs"].each do |pack|
        created_pack = Pack.new(quantity: pack["quantity"].to_i, total_price: pack["total_price"].to_f)
        created_product.packs << created_pack
      end

      @@products << created_product
    end
  end


  
  def self.get_product(code)
    @@products.find { |product| product.code == code }
  end

  def self.order(order_string)
    quantity, code = order_string.split
    packages = package(quantity.to_i, code.upcase)

    packages_string = packages[:packs].inject("") do |str, pack|
      str + "        #{pack[:quantity]} x #{pack[:pack]} $#{pack[:price]} \n"
    end

    puts "#{order_string.upcase} $#{packages[:total]}"
    puts "#{packages_string}"
  end


  def self.package(quantity, code)
    ordered_product = get_product(code)
    remainder = quantity
    results = Hash.new
    packs = Array.new
    attempts = 0

    until remainder.zero?
      ordered_product.pack_contents.each_with_index do |pack_content, index|
        next if remainder.zero?
        next if (index + 1) <= attempts
        next if pack_content == ordered_product.pack_contents[-2] && (remainder % pack_content) == 1
        remainder %= pack_content
        total_packs = packs.inject(0) { |sum, pack| sum + (pack[:pack] * pack[:quantity]) }
        remaining = quantity - total_packs
        pack_quantity = (remaining / pack_content)

        packs << { pack: pack_content, quantity: pack_quantity, price: ordered_product.pack_price(pack_content) }
      end

      unless remainder.zero?
        remainder = quantity.to_i
        attempts += 1
        packs.clear
      end
    end

    results[:packs] = packs
    results[:total] = packs.inject(0) { |sum, pack| sum + (pack[:price] * pack[:quantity]) }.round(2)
    results
  end
end

