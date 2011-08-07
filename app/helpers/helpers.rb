ToBuy.helpers do
  def title title
      'ToBuy - '+title
  end

  def priceFormat_options list
    "{ prefix: '#{list.currency.symbol} ', centsSeparator: ',', thousandsSeparator: '.' }"
  end
end