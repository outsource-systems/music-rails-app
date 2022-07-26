json.array! @items do |item|
  json.partial! "api/v1/items/item", item: item
end
