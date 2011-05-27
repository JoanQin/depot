#result = LineItem.update_all("product_id=1", "id=32")
#result = LineItem.update(46, :cart_id=>"3")
#LineItem.destroy_all(["id > ?", 46])
LineItem.all.each do |line_items|
  #puts "id = #{line_items.product_id}"
  products = Product.find(line_items.product_id)
  #puts "id = #{products.id}, price=#{products.price}"
  #result = LineItem.update_all("price=#{products.price}", "product_id=#{products.id}")
  #result = LineItem.update(line_items.id, :price=>"#{products.price}" )
  line_items.update_attributes(:price=>"#{products.price}")
end

    