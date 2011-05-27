class PopPriceInLineItems < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |line_item|
      products = Product.find(line_item.product_id)
           
        line_item.update_attributes(:price=>"#{products.price}")     
    end
    
  end

  def self.down
  end
end
