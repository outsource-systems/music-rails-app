json.id item.id
json.name item.name
json.time "01:32"
json.partial! "api/v1/artists/artists", artists: item.artists
json.sortNumber item.sort_number
json.lyrists []
json.composers []
json.posterUrl item.product.poster_url.url
json.url item.url.url
json.isFavorite false
