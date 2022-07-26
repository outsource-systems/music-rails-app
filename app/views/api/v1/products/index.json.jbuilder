json.array! @products do |product|
  json.partial! "api/v1/products/product", product: product
end
