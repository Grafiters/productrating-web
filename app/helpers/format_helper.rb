module FormatHelper
  
  def format_price(price)
    # TODO: Format the price. 
    # - Display a dollar sign
    # - Display two decimal places
    number_to_currency(price, unit: "$", separator: ",", delimiter: "")
  end

end
