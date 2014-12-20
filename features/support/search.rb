class Search
  extend Capybara::DSL
  def Search.open_product_detail(product_name)
    all('span',:text=> product_name, exact:true)[0].click
  end
end