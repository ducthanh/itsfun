params = {
	product_name_1: "Ku Ku KU5341",
	product_order_1: 1,
	product_qtt_1: 1,
	product_1_price: 159000,

	product_name_2: "Fatz Baby FB3002SL",
	product_order_2: 2,
	product_qtt_2: 3,
	product_2_price: 339000
}
product_list= ["Ku Ku KU5341","Fatz Baby FB3002SL"]

Given(/^I search for a product then adding that item into cart$/) do
 step "I search for an existing product"
 step "I open the product details page"
 @pd_price = Product.get_and_convert_price
 step "I add the product into cart"
end

Given(/^once the cart pop\-up is enable change the number of the quantity$/) do
  Cart.set_qtt(params[:product_order_1],params[:product_qtt_2])
end

Then(/^the subtotal is update accordingly$/) do
  expect(@pd_price*params[:product_qtt_2]).to eq(Cart.get_subtotal)
end

Given(/^I add some items into cart$/) do
  Product.add_multiple_product_to_cart(product_list)
  find('.icon-cart-white').click
end

And(/^I change the quantity for an item$/) do
  Cart.set_qtt(params[:product_order_2],params[:product_qtt_2])
end

Given(/^I search for an existing product$/) do
  Home.search_product(params[:product_name_1])
end

And(/^I open the product details page$/) do
	Search.open_product_detail(params[:product_name_1])
	@price = Product.get_price
end

When(/^I add the product into cart$/) do
	Product.add_to_card
end

Then(/^the subtotal of all product is update accordingly$/) do
  expect(params[:product_1_price]*params[:product_qtt_1] + params[:product_2_price]*params[:product_qtt_2]).to eq(Cart.get_subtotal)
end

Then(/^the product name and product price in cart are display properly$/) do
  expect(find(CART_PRODUCT_DESC).text).to match(params[:product_name_1])
  expect(Cart.get_cartprice).to match(@price)
end
