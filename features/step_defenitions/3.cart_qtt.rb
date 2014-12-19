params = {
	product_name_1: "Ku Ku KU5341",
	product_order_1: 1,
	product_qtt_1: 1,
	product_1_price: 167000,

	product_name_2: "Fatz Baby FB3002SL",
	product_order_2: 2,
	product_qtt_2: 3,
	product_2_price: 272000
}
product_list= ["Ku Ku KU5341","Fatz Baby FB3002SL"]

Given(/^searching for a product then adding that item into cart$/) do
 step "searching for an existing product"
 step "open the product details page"
 @pd_price = $act.get_and_convert_price
 step "add the product into cart"
end

Given(/^once the cart pop\-up is enable change the number of the quantity$/) do
  $act.cart_set_qtt(params[:product_order_1],params[:product_qtt_2])
end

Then(/^the subtotal is update accordingly$/) do
  expect(@pd_price*params[:product_qtt_2]).to eq($act.cart_get_subtotal)
end

Given(/^adding some items into cart$/) do
  $act.search_add_multiple_product_to_cart(product_list)
  find('.icon-cart-white').click
end

And(/^changing the quantity for an item$/) do
  $act.cart_set_qtt(params[:product_order_2],params[:product_qtt_2])
end

Then(/^the subtotal of all product is update accordingly$/) do
  expect(params[:product_1_price]*params[:product_qtt_1] + params[:product_2_price]*params[:product_qtt_2]).to eq($act.cart_get_subtotal)
end
