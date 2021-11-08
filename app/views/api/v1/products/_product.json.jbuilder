json.id product.id
json.name product.name
json.recordType product.record_type
json.releaseDate product.release_date.strftime("%Y/%m/%d")
json.posterUrl product.poster_url.url
json.category product.categories&.first&.name
if params[:is_fetch_items]
  json.partial! "api/v1/items/items", items: product.items
end
json.partial! "api/v1/artists/artists", artists: product.artists

