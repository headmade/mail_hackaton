json.array!(@collages) do |collage|
  json.extract! collage, :title, :image, :photos, :user_id
  json.url collage_url(collage, format: :json)
end
