class PopPriceInLineItems < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |line_item|
      products = Product.find(:all)
      
      products.each do |id, price|
        line_item.update(:price=>price).where(:product_id=>id)
      end
    end
  end

  def self.down
  end
end
