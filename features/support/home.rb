class Home
  extend Capybara::DSL
  def Home.open
    visit '/'
    Home.set_window_size(1350, 1350)
  end

  def Home.sign_up(options={})
    default = {:name => false, :email => false, 
               :password => false, :cf_password => false, 
               :dob=>false, :sex => false, :term=> false, :get_ad_ckb => false, 
               :send => true}
    options = default.merge(options)

    find(SIGNUP_BTN).click

    if(options[:name])
      find(NAME_TF).set options[:name]
    end

    if(options[:email])
      find(EMAIL_TF).set options[:email]
    end

    if(options[:password])
      find(PW_TF).set options[:password]
    end

    if(options[:cf_password])
      find(PWCONFIRM_TF).set options[:cf_password]
    end

    if(options[:send])
      find(SIGNUP_SEND_BTN).click
    end
  end

  def Home.set_window_size(width, height)
    window = Capybara.current_session.driver.browser.manage.window
    window.resize_to(width, height)
  end

  def Home.search_product(product_name)
    find(SEARCH_TF).set product_name
    find(SEARCH_BTN).click
  end
end