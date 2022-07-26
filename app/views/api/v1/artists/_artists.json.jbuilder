json.artists artists do |artist|
  json.partial! "api/v1/artists/artist", artist: artist
end
