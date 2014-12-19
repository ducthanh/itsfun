class Action
include Capybara::DSL
  def home_sign_up(options={})
    default = {:name => false, :email => false, 
               :password => false, :cf_password => false, 
               :dob=>false, :sex => false, :term=> false, :get_ad_ckb => false, 
               :send => true}
    options = default.merge(options)

    find($SIGNUP_BTN).click

    if(options[:name])
      find($NAME_TF).set options[:name]
    end

    if(options[:email])
      find($EMAIL_TF).set options[:email]
    end

    if(options[:password])
      find($PW_TF).set options[:password]
    end

    if(options[:cf_password])
      find($PWCONFIRM_TF).set options[:cf_password]
    end

    if(options[:send])
      find($SIGNUP_SEND_BTN).click
    end
    #for another factors, I won't implement because the scope of the test
  end


  def home_search_product(product_name)
    find($SEARCH_TF).set product_name
    find($SEARCH_BTN).click
  end

  def open_product_detail_from_search(product_name)
    all('span',:text=> product_name, exact:true)[0].click
  end

  def add_to_card
    if(page.has_no_css?($CART_CLOSE))
      find($ADD_TO_CARD_BTN).click
    end
  end

  def search_add_multiple_product_to_cart(product_list)
    product_list.each do |name|
      self.home_search_product(name)
      self.open_product_detail_from_search(name)
      self.add_to_card
      find($CART_CLOSE).click if name != product_list.last
    end
  end

  def product_details_get_price
    return find($PRICE_LABEL).text
  end

  def cart_get_subtotal
    return find('.width_30:nth-child(3) div:nth-child(1)').text.gsub(".","").gsub(" VND","").to_f
  end

  def cart_get_pid(c_order)
    sleep 1
    return find("table.producttable:nth-child(#{c_order}) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(4) select")['id']
  end

  def cart_set_qtt(order, num)
      id = self.cart_get_pid(order)
      select num, :from => id
      #ensure the Cart is updated after changing qtt
      sleep 1
      find('.pas', :text => "Đã cập nhật giỏ hàng")
  end

  def get_and_convert_price
    return self.product_details_get_price.gsub(".","").gsub(" VND","").to_f
  end
end