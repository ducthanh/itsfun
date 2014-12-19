params = {
	product_name: "Ku Ku KU5341"
}

Given(/^searching for an existing product$/) do
  $act.home_search_product(params[:product_name])
end

And(/^open the product details page$/) do
	$act.open_product_detail_from_search(params[:product_name])
	#get Product Price
end

When(/^add the product into cart$/) do
	@price = $act.product_details_get_price
	$act.add_to_card
	@cart_price = find('td.price:nth-child(3)').text
end

Then(/^the product name and price in cart are display properly$/) do
  expect(find($CART_PRODUCT_DESC).text).to match(params[:product_name])
  expect(@cart_price).to match(@price)
end