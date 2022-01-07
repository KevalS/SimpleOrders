json.total_price @cart.total_price
json.products  @items do |item|
  json.product_id item.product_id
  json.quantity item.quantity
  json.unit_price item.product.price
end

if @cart.completed?
  json.email @cart.email
  json.address @cart.address
end