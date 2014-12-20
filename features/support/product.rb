class Product
	extend Capybara::DSL
	def Product.add_to_card
    if(page.has_no_css?(CART_CLOSE))
      find(ADD_TO_CARD_BTN).click
    end
  end

  def Product.get_price
    return find(PRICE_LABEL).text
  end

  def Product.get_and_convert_price
    return Product.get_price.gsub(".","").gsub(" VND","").to_f
  end

  def Product.add_multiple_product_to_cart(product_list)
    product_list.each do |name|
      Home.search_product(name)
      Search.open_product_detail(name)
      Product.add_to_card
      find(CART_CLOSE).click if name != product_list.last
    end
  end 
end