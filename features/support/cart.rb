class Cart
  extend Capybara::DSL
  def Cart.get_subtotal
    return find('.width_30:nth-child(3) div:nth-child(1)').text.gsub(".","").gsub(" VND","").to_f
  end

  def Cart.get_pid(c_order)
    return find("table.producttable:nth-child(#{c_order}) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(4) select")['id']
  end

  def Cart.set_qtt(order, num)
      id = self.get_pid(order)
      select num, :from => id
      find('.pas', :text => "Đã cập nhật giỏ hàng")
  end

  def Cart.get_cartprice
    return find('td.price:nth-child(3)').text
  end
end