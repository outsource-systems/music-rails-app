json.array! @products do |product|
  json.name product.name
  jsno.record_type product.record_type
  json.relase_date product.relase_date
  json.poster_url product.poster_url.url
end
